/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    nfc_app.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "NFC_APP_Initialize" and "NFC_APP_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "NFC_APP_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _NFC_APP_H
#define _NFC_APP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "./config/default/definitions.h"
#include "./config/default/configuration.h"
#include "./config/default/system/debug/sys_debug.h"
#include "./config/default/driver/driver_common.h"
#include "./queue.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************
#define NFC_UID_SIZE                        8
#define NFC_CMD_SIZE                        2
#define ST25DV_MAX_MAILBOX_LENGTH           256

#define ST25DV_ADDR_DATA_I2C                0xA6 >> 1
#define ST25DV_ADDR_SYST_I2C                0xAE >> 1

#define DEFAULT_I2C_PWD_MSB                 0x00000000
#define DEFAULT_I2C_PWD_LSB                 0x00000000
#define I2C_PWD_SIZE                        0x08

/* MB_MODE */
#define ST25DV_MB_MODE_RW_SHIFT              (0)
#define ST25DV_MB_MODE_RW_FIELD              0xFE
#define ST25DV_MB_MODE_RW_MASK               0x01

/* MB_CTRL_Dyn */
#define ST25DV_MB_CTRL_DYN_MBEN_SHIFT        (0)
#define ST25DV_MB_CTRL_DYN_MBEN_FIELD        0xFE
#define ST25DV_MB_CTRL_DYN_MBEN_MASK         0x01
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_SHIFT  (1)
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_FIELD  0xFD
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_MASK   0x02
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_SHIFT    (2)
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_FIELD    0xFB
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_MASK     0x04
#define ST25DV_MB_CTRL_DYN_STRESERVED_SHIFT  (3)
#define ST25DV_MB_CTRL_DYN_STRESERVED_FIELD  0xF7
#define ST25DV_MB_CTRL_DYN_STRESERVED_MASK   0x08
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_SHIFT (4)
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_FIELD 0xEF
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_MASK  0x10
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_SHIFT   (5)
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_FIELD   0xDF
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_MASK    0x20
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_SHIFT  (6)
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_FIELD  0x3F
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_MASK   0xC0


// *****************************************************************************
/* Application states

  Summary:
    Application states enumeration

  Description:
    This enumeration defines the valid application states.  These states
    determine the behavior of the application at various times.
*/

typedef enum
{
    /* Application's state machine's initial state. */
    NFC_APP_STATE_INIT=0,
    NFC_APP_WAIT_GLOBAL_QUEUE_EVENT,

    NFC_APP_READ_UID,
    NFC_APP_PRESENT_I2C_PWD,
    NFC_APP_PRESENT_I2C_PWD_WAIT,
    NFC_APP_ALLOW_MB_MODE_WRITE,
    NFC_APP_ALLOW_MB_MODE_WRITE_WAIT,
    NFC_APP_ENABLE_FT_MODE,
    NFC_APP_ENABLE_FT_MODE_WAIT,
    NFC_APP_FT_MODE_ENABLED,
    NFC_APP_WRITE_MAILBOX,
    NFC_APP_WRITE_MAILBOX_WAIT,

    NFC_APP_STATE_ERROR
} NFC_APP_STATES;

typedef enum {
    NO_EVENT=0,
    TRANSFER_OK=1,
    TRANSFER_RETRY
} NFC_APP_INTERNAL_EVENTS;

// *****************************************************************************
/**
 * @brief  ST25DV Password structure definition.
 */
typedef struct {
    uint32_t MsbPasswd;
    uint32_t LsbPasswd;
} ST25DV_PASSWD;

/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */
typedef struct
{
    /* The application's current state */
    NFC_APP_STATES state;
    NFC_APP_INTERNAL_EVENTS internalEvent;

    DRV_HANDLE drvI2CHandle;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    bool RFFieldPresence;
    uint8_t uid[NFC_UID_SIZE];
    ST25DV_PASSWD passWord;
    uint8_t transferBuf[NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH];
} NFC_APP_DATA;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void NFC_APP_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    NFC_APP_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    NFC_APP_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void NFC_APP_Initialize ( void );


/*******************************************************************************
  Function:
    void NFC_APP_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    NFC_APP_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void NFC_APP_Tasks( void );

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _NFC_APP_H */

/*******************************************************************************
 End of File
 */

