/*******************************************************************************
 CLOCK PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_clock.c

  Summary:
    CLOCK PLIB Implementation File.

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#include "plib_clock.h"
#include "device.h"
#include "interrupts.h"

static void SYSCTRL_Initialize(void)
{
    /****************** XOSC32K initialization  ******************************/

    /* Configure 32K External Oscillator */
    SYSCTRL_REGS->SYSCTRL_XOSC32K = SYSCTRL_XOSC32K_STARTUP(0U) | SYSCTRL_XOSC32K_ENABLE_Msk | SYSCTRL_XOSC32K_EN32K_Msk | SYSCTRL_XOSC32K_XTALEN_Msk;
    while(!((SYSCTRL_REGS->SYSCTRL_PCLKSR & SYSCTRL_PCLKSR_XOSC32KRDY_Msk) == SYSCTRL_PCLKSR_XOSC32KRDY_Msk))
    {
        /* Waiting for the XOSC32K Ready state */
    }

    SYSCTRL_REGS->SYSCTRL_OSC32K = 0x0U;
}

static void FDPLL_Initialize(void)
{

    /****************** DPLL Initialization  *********************************/

    /* Configure DPLL    */
    SYSCTRL_REGS->SYSCTRL_DPLLCTRLB = SYSCTRL_DPLLCTRLB_FILTER(0x0U) | SYSCTRL_DPLLCTRLB_LTIME(0x0U)| SYSCTRL_DPLLCTRLB_REFCLK(0x0U) ;


    SYSCTRL_REGS->SYSCTRL_DPLLRATIO = SYSCTRL_DPLLRATIO_LDRFRAC(11U) | SYSCTRL_DPLLRATIO_LDR(2928U);

    /* Selection of the DPLL Enable */
    SYSCTRL_REGS->SYSCTRL_DPLLCTRLA = SYSCTRL_DPLLCTRLA_ENABLE_Msk   ;

    while((SYSCTRL_REGS->SYSCTRL_DPLLSTATUS & (SYSCTRL_DPLLSTATUS_LOCK_Msk | SYSCTRL_DPLLSTATUS_CLKRDY_Msk)) !=
                (SYSCTRL_DPLLSTATUS_LOCK_Msk | SYSCTRL_DPLLSTATUS_CLKRDY_Msk))
    {
        /* Waiting for the Ready state */
    }
}

static void DFLL_Initialize(void)
{
    /****************** DFLL Initialization  *********************************/
    SYSCTRL_REGS->SYSCTRL_DFLLCTRL &= (uint16_t)(~SYSCTRL_DFLLCTRL_ONDEMAND_Msk);

    while((SYSCTRL_REGS->SYSCTRL_PCLKSR & SYSCTRL_PCLKSR_DFLLRDY_Msk) != SYSCTRL_PCLKSR_DFLLRDY_Msk)
    {
        /* Waiting for the Ready state */
    }

    /*Load Calibration Value*/
    uint32_t calibCoarse = (((*(uint32_t*)0x806024U) >> 26U ) & 0x3FU);
    calibCoarse = (((calibCoarse) == 0x3FU) ? 0x1FU : (calibCoarse));

    SYSCTRL_REGS->SYSCTRL_DFLLVAL = SYSCTRL_DFLLVAL_COARSE(calibCoarse) | SYSCTRL_DFLLVAL_FINE(512U);

    while((SYSCTRL_REGS->SYSCTRL_PCLKSR & SYSCTRL_PCLKSR_DFLLRDY_Msk) != SYSCTRL_PCLKSR_DFLLRDY_Msk)
    {
        /* Waiting for the Ready state */
    }

    /* Configure DFLL    */
    SYSCTRL_REGS->SYSCTRL_DFLLCTRL = SYSCTRL_DFLLCTRL_ENABLE_Msk ;

    while((SYSCTRL_REGS->SYSCTRL_PCLKSR & SYSCTRL_PCLKSR_DFLLRDY_Msk) != SYSCTRL_PCLKSR_DFLLRDY_Msk)
    {
        /* Waiting for DFLL to be ready */
    }
}


static void GCLK0_Initialize(void)
{

    GCLK_REGS->GCLK_GENCTRL = GCLK_GENCTRL_SRC(8U) | GCLK_GENCTRL_GENEN_Msk | GCLK_GENCTRL_ID(0U);

    GCLK_REGS->GCLK_GENDIV = GCLK_GENDIV_DIV(2U) | GCLK_GENDIV_ID(0U);
    while((GCLK_REGS->GCLK_STATUS & GCLK_STATUS_SYNCBUSY_Msk) == GCLK_STATUS_SYNCBUSY_Msk)
    {
        /* wait for the Generator 0 synchronization */
    }
}


static void GCLK2_Initialize(void)
{
    GCLK_REGS->GCLK_GENCTRL = GCLK_GENCTRL_SRC(5U) | GCLK_GENCTRL_GENEN_Msk | GCLK_GENCTRL_ID(2U);

    while((GCLK_REGS->GCLK_STATUS & GCLK_STATUS_SYNCBUSY_Msk) == GCLK_STATUS_SYNCBUSY_Msk)
    {
        /* wait for the Generator 2 synchronization */
    }
}

void CLOCK_Initialize (void)
{
    /* Function to Initialize the Oscillators */
    SYSCTRL_Initialize();

    FDPLL_Initialize();
    DFLL_Initialize();
    GCLK2_Initialize();
    GCLK0_Initialize();


    /* Selection of the Generator and write Lock for USB */
    GCLK_REGS->GCLK_CLKCTRL = GCLK_CLKCTRL_ID(6U) | GCLK_CLKCTRL_GEN(0x0U)  | GCLK_CLKCTRL_CLKEN_Msk;
    /* Selection of the Generator and write Lock for SERCOM2_CORE */
    GCLK_REGS->GCLK_CLKCTRL = GCLK_CLKCTRL_ID(22U) | GCLK_CLKCTRL_GEN(0x0U)  | GCLK_CLKCTRL_CLKEN_Msk;
    /* Selection of the Generator and write Lock for SERCOM5_CORE */
    GCLK_REGS->GCLK_CLKCTRL = GCLK_CLKCTRL_ID(25U) | GCLK_CLKCTRL_GEN(0x0U)  | GCLK_CLKCTRL_CLKEN_Msk;
    /* Selection of the Generator and write Lock for TC3 TCC2 */
    GCLK_REGS->GCLK_CLKCTRL = GCLK_CLKCTRL_ID(27U) | GCLK_CLKCTRL_GEN(0x2U)  | GCLK_CLKCTRL_CLKEN_Msk;

    /* Configure the APBC Bridge Clocks */
    PM_REGS->PM_APBCMASK = 0x10890U;


    /*Disable RC oscillator*/
    SYSCTRL_REGS->SYSCTRL_OSC8M = 0x0U;
}
