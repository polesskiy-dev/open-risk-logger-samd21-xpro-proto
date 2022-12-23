/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    sht3x_temp_app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "sht3x_temp_app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
extern GLOBAL_QUEUE_OBJECT globalEventsQueueObj;

static const uint8_t SHT3X_CMD_READ_STATUS_REG[SHT3X_CMD_SIZE] = {0xF3, 0x2D};

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the SHT3X_TEMP_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

SHT3X_TEMP_APP_DATA sht3x_temp_appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************
/**
 * @brief Handle Status read
 *
 * @param event
 * @param transferHandle
 * @param context
 */
void sht3xTempReadStatusTransferEventHandler (
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context
);

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void SHT3X_TEMP_APP_Initialize ( void )

  Remarks:
    See prototype in sht3x_temp_app.h.
 */

void SHT3X_TEMP_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    sht3x_temp_appData.state = SHT3X_TEMP_APP_STATE_INIT;
    sht3x_temp_appData.transferHandle = DRV_I2C_TRANSFER_HANDLE_INVALID;
}


/******************************************************************************
  Function:
    void SHT3X_TEMP_APP_Tasks ( void )

  Remarks:
    See prototype in sht3x_temp_app.h.
 */

void SHT3X_TEMP_APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( sht3x_temp_appData.state )
    {
        /* Application's initial state. */
        case SHT3X_TEMP_APP_STATE_INIT:
        {
            /* Open the I2C Driver */
            sht3x_temp_appData.drvI2CHandle = DRV_I2C_Open( DRV_I2C_INDEX_0, DRV_IO_INTENT_READWRITE );
            if(sht3x_temp_appData.drvI2CHandle == DRV_HANDLE_INVALID)
            {
                sht3x_temp_appData.state = SHT3X_TEMP_APP_STATE_ERROR;
            }

            // init by status read call
            GLOBAL_QUEUE_EVENT sht3xTempReadStatusEvent = {
                    .type = SHT3X_TEMP_READ_STATUS,
                    .payload = {}
            };
            globalQueueEnqueueEvent(&globalEventsQueueObj, &sht3xTempReadStatusEvent);
            
            sht3x_temp_appData.state = SHT3X_TEMP_APP_WAIT_GLOBAL_QUEUE_EVENT;
            
            break;
        }

        case SHT3X_TEMP_APP_WAIT_GLOBAL_QUEUE_EVENT:
        {
            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == SHT3X_TEMP_READ_STATUS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                sht3xTempReadStatus(&sht3x_temp_appData.status);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == SHT3X_TEMP_READ_STATUS_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
            }

            break;
        }

        case SHT3X_TEMP_APP_STATE_ERROR:
        {
            SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "SHT3X is in ERROR state");
            break;
        }

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

void sht3xTempReadStatus(uint16_t *status) {
    /* Add a request to read data from EEPROM. */
    DRV_I2C_TransferEventHandlerSet(
            sht3x_temp_appData.drvI2CHandle,
            sht3xTempReadStatusTransferEventHandler,
            (uintptr_t)NULL
    );

    DRV_I2C_WriteReadTransferAdd(
            sht3x_temp_appData.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void * const)SHT3X_CMD_READ_STATUS_REG,
            SHT3X_CMD_SIZE,
            status,
            SHT3X_STATUS_SIZE,
            &sht3x_temp_appData.transferHandle
    );
};

void sht3xTempReadStatusTransferEventHandler (
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context
) {
    if (event == DRV_I2C_TRANSFER_EVENT_COMPLETE)
    {
        GLOBAL_QUEUE_EVENT sht3xTempReadStatusSuccessEvent = {
                .type = SHT3X_TEMP_READ_STATUS_SUCCESS,
                .payload = {}
        };
        globalQueueEnqueueEvent(&globalEventsQueueObj, &sht3xTempReadStatusSuccessEvent);
    }
    else
    {
        sht3x_temp_appData.state = SHT3X_TEMP_APP_STATE_ERROR;
    }
}

/*******************************************************************************
 End of File
 */
