/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    nfc_app.c

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

#include "nfc_app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

extern GLOBAL_QUEUE_OBJECT globalEventsQueueObj;

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the NFC_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

NFC_APP_DATA nfc_appData = {
        .state = NFC_APP_STATE_INIT,
        .drvI2CHandle = DRV_I2C_TRANSFER_HANDLE_INVALID,
        .RFFieldPresence = false
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

void nfcTransferEventHandler(
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context);

void handleRFFieldChangeInterrupt(uintptr_t context);

void nfcReadUID(uint8_t *uid);

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void NFC_APP_Initialize ( void )

  Remarks:
    See prototype in nfc_app.h.
 */

void NFC_APP_Initialize(void) {
    /* Place the App state machine in its initial state. */
    nfc_appData.state = NFC_APP_STATE_INIT;

    EIC_CallbackRegister(EIC_PIN_4, (EIC_CALLBACK) handleRFFieldChangeInterrupt, (uintptr_t) NULL);
}


/******************************************************************************
  Function:
    void NFC_APP_Tasks ( void )

  Remarks:
    See prototype in nfc_app.h.
 */

void NFC_APP_Tasks(void) {

    /* Check the application's current state. */
    switch (nfc_appData.state) {
        /* Application's initial state. */
        case NFC_APP_STATE_INIT: {
            nfc_appData.drvI2CHandle = DRV_I2C_Open(DRV_I2C_INDEX_0, DRV_IO_INTENT_READWRITE|DRV_IO_INTENT_NONBLOCKING|DRV_IO_INTENT_SHARED);
            if(nfc_appData.drvI2CHandle == DRV_HANDLE_INVALID)
            {
                nfc_appData.state = NFC_APP_STATE_ERROR;
            }

            // init by uid read call
            GLOBAL_QUEUE_EVENT nfcReadStatusEvent = {
                    .type = NFC_READ_UID,
                    .payload = {}
            };
            globalQueueEnqueueEvent(&globalEventsQueueObj, &nfcReadStatusEvent);

            bool appInitialized = true;

            if (appInitialized) {
                nfc_appData.state = NFC_APP_WAIT_GLOBAL_QUEUE_EVENT;
            }
            break;
        }

        case NFC_APP_WAIT_GLOBAL_QUEUE_EVENT: {
            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_READ_UID) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                nfc_appData.state = NFC_APP_READ_UID;
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_READ_UID_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                nfc_appData.state = NFC_APP_WAIT_GLOBAL_QUEUE_EVENT;
            }
        }

        case NFC_APP_READ_UID: {
            nfcReadUID(nfc_appData.uid);
            nfc_appData.state = NFC_APP_WAIT_GLOBAL_QUEUE_EVENT;
        }

        case NFC_APP_STATE_ERROR: {
            SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "NFC APP is in ERROR state");
        }


            /* The default state should never be executed. */
        default: {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

/**
 * A pulse is emitted on GPO, when RF field appears or disappears
 * @param context
 * @return
 */
void handleRFFieldChangeInterrupt(uintptr_t context) {
    nfc_appData.RFFieldPresence = !nfc_appData.RFFieldPresence;
    SYS_DEBUG_PRINT(SYS_ERROR_INFO, "NFC RF field %i\r\n", nfc_appData.RFFieldPresence);
};

void nfcReadUID(uint8_t *uid) {
    static GLOBAL_QUEUE_EVENT nfcReadUIDSuccessEvent = {
            .type = NFC_READ_UID_SUCCESS,
            .payload = {}
    };

    DRV_I2C_TransferEventHandlerSet(
            nfc_appData.drvI2CHandle,
            nfcTransferEventHandler,
            (uintptr_t) &nfcReadUIDSuccessEvent
    );

    DRV_I2C_WriteReadTransferAdd(
            nfc_appData.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void *const) ST25DV_UID_REG,
            NFC_CMD_SIZE,
            uid,
            NFC_UID_SIZE,
            &nfc_appData.transferHandle
    );
}

void nfcTransferEventHandler(
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context) {
    if (event == DRV_I2C_TRANSFER_EVENT_COMPLETE)
    {
        GLOBAL_QUEUE_EVENT *globalQueueEvent = (GLOBAL_QUEUE_EVENT*)context;
        globalQueueEnqueueEvent(&globalEventsQueueObj, globalQueueEvent);
    }
    else
    {
        nfc_appData.state = NFC_APP_STATE_ERROR;
    }
}

/*******************************************************************************
 End of File
 */
