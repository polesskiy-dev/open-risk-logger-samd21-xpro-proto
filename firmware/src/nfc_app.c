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

static const uint8_t ST25DV_UID_REG[NFC_CMD_SIZE]  =            {0x00, 0x18};
static const uint8_t ST25DV_MAILBOX_RAM_REG[NFC_CMD_SIZE]  =    {0x20, 0x08};
static const uint8_t ST25DV_MB_CTRL_DYN_REG[NFC_CMD_SIZE]  =    {0x20, 0x06};
static const uint8_t ST25DV_MB_MODE_REG[NFC_CMD_SIZE]  =        {0x00, 0x0D};
static const uint8_t ST25DV_I2CPASSWD_REG[NFC_CMD_SIZE]  =      {0x09, 0x00};

static uint8_t ST25DV_MB_MODE_RW =                              ST25DV_MB_MODE_RW_MASK;
static uint8_t ST25DV_MB_CTRL_DYN_MBEN =                        ST25DV_MB_CTRL_DYN_MBEN_MASK;

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
        .internalEvent = NO_EVENT,
        .drvI2CHandle = DRV_I2C_TRANSFER_HANDLE_INVALID,
        .RFFieldPresence = false,
        .passWord = {
                .LsbPasswd = DEFAULT_I2C_PWD_LSB,
                .MsbPasswd = DEFAULT_I2C_PWD_MSB
        }
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
void nfcTransferOnSuccess(uintptr_t context);
void nfcTransferOnError(uintptr_t context);


// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

void stateTransition(NFC_APP_STATES nextState);
void nfcWriteTransferAdd(const uint16_t address, const uint8_t *cmd, uint8_t *buffer, size_t size, uintptr_t context);
void clearLocalTransferBuffer();

void nfcPresentI2CPassword(const ST25DV_PASSWD passWord);
void nfcAllowMBModeWrite();
void nfcReadUID(uint8_t *uid);
void nfcEnableFTMode();
void nfcWriteMailbox(uint8_t *transferBuf, ssize_t size);

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
                stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            }
            break;
        }

        case NFC_APP_WAIT_GLOBAL_QUEUE_EVENT: {
            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_READ_UID) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                stateTransition(NFC_APP_READ_UID);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_READ_UID_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);

                GLOBAL_QUEUE_EVENT nfcPrepareMailboxEvent = {
                        .type = NFC_PREPARE_MAILBOX,
                        .payload = {}
                };
                globalQueueEnqueueEvent(&globalEventsQueueObj, &nfcPrepareMailboxEvent);

                stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_PREPARE_MAILBOX) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                stateTransition(NFC_APP_PRESENT_I2C_PWD);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_PREPARE_MAILBOX_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                
                GLOBAL_QUEUE_EVENT nfcWriteMailboxEvent = {
                        .type = NFC_WRITE_MAILBOX,
                        .payload = {}
                };
                globalQueueEnqueueEvent(&globalEventsQueueObj, &nfcWriteMailboxEvent);

                stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_WRITE_MAILBOX) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                stateTransition(NFC_APP_WRITE_MAILBOX);
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == NFC_WRITE_MAILBOX_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            }
            break;
        }

        case NFC_APP_READ_UID: {
            nfcReadUID(nfc_appData.uid);
            stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            break;
        }

        case NFC_APP_PRESENT_I2C_PWD: {
            nfcPresentI2CPassword(nfc_appData.passWord);
            stateTransition(NFC_APP_PRESENT_I2C_PWD_WAIT);
            break;
        }

        case NFC_APP_PRESENT_I2C_PWD_WAIT: {
            switch (nfc_appData.internalEvent) {
                case NO_EVENT:
                    break;
                case TRANSFER_OK:
                    stateTransition(NFC_APP_ALLOW_MB_MODE_WRITE);
                    break;
                case TRANSFER_RETRY:
                    stateTransition(NFC_APP_PRESENT_I2C_PWD);
                    break;
            }
            break;
        }

        case NFC_APP_ALLOW_MB_MODE_WRITE: {
            nfcAllowMBModeWrite();
            stateTransition(NFC_APP_ALLOW_MB_MODE_WRITE_WAIT);
            break;
        }

        case NFC_APP_ALLOW_MB_MODE_WRITE_WAIT: {
            switch (nfc_appData.internalEvent) {
                case NO_EVENT:
                    break;
                case TRANSFER_OK:
                    stateTransition(NFC_APP_ENABLE_FT_MODE);
                    break;
                case TRANSFER_RETRY:
                    stateTransition(NFC_APP_ALLOW_MB_MODE_WRITE);
                    break;
            }
            break;
        }

        case NFC_APP_ENABLE_FT_MODE: {
            nfcEnableFTMode();
            stateTransition(NFC_APP_ENABLE_FT_MODE_WAIT);
            break;
        }

        case NFC_APP_ENABLE_FT_MODE_WAIT: {
            switch (nfc_appData.internalEvent) {
                case NO_EVENT:
                    break;
                case TRANSFER_OK:
                    stateTransition(NFC_APP_FT_MODE_ENABLED);
                    break;
                case TRANSFER_RETRY:
                    stateTransition(NFC_APP_ENABLE_FT_MODE);
                    break;
            }
            break;
        }

        case NFC_APP_FT_MODE_ENABLED: {
            GLOBAL_QUEUE_EVENT nfcPrepareMailboxSuccessEvent = {
                    .type = NFC_PREPARE_MAILBOX_SUCCESS,
                    .payload = {}
            };
            globalQueueEnqueueEvent(&globalEventsQueueObj, &nfcPrepareMailboxSuccessEvent);

            stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            break;
        }

        case NFC_APP_WRITE_MAILBOX: {
            uint8_t buf[] = {0xAA, 0xAF, 0xFA, 0xAA, 0xAC, 0xEE, 0xEA, 0xAD};
            nfcWriteMailbox(buf, 8);
            stateTransition(NFC_APP_WAIT_GLOBAL_QUEUE_EVENT);
            break;
        }

        case NFC_APP_STATE_ERROR: {
            SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "NFC APP is in ERROR state");
            break;
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
            ST25DV_ADDR_SYST_I2C,
            (void *const) ST25DV_UID_REG,
            NFC_CMD_SIZE,
            uid,
            NFC_UID_SIZE,
            &nfc_appData.transferHandle
    );
}

void nfcEnableFTMode() {
    nfcWriteTransferAdd(
            ST25DV_ADDR_DATA_I2C,
            ST25DV_MB_CTRL_DYN_REG,
            &ST25DV_MB_CTRL_DYN_MBEN,
            1,
            (uintptr_t) NULL
    );
}

void nfcAllowMBModeWrite() {
    nfcWriteTransferAdd(
            ST25DV_ADDR_SYST_I2C,
            ST25DV_MB_MODE_REG,
            &ST25DV_MB_MODE_RW,
            1,
            (uintptr_t) NULL
            );
}

/**
  * @brief  Presents I2C password, to authorize the I2C writes to protected areas.
  * @param  passWord[in] Password value on 32bits
  */
void nfcPresentI2CPassword(const ST25DV_PASSWD passWord)
{
    static uint8_t ai2c_message[I2C_PWD_SIZE + 1 + I2C_PWD_SIZE] = {0};
    uint8_t i;

    /* Build I2C Message with Password + Validation code 0x09 + Password */
    ai2c_message[I2C_PWD_SIZE] = 0x09;
    for (i = 0; i < 4; i++) {
        ai2c_message[i] = (passWord.MsbPasswd >> ((3 - i) * 8)) & 0xFF;
        ai2c_message[i + 4] = (passWord.LsbPasswd >> ((3 - i) * 8)) & 0xFF;
        ai2c_message[i + 9] = ai2c_message[i];
        ai2c_message[i + 13] = ai2c_message[i + 4];
    };

    /* Present password to ST25DV */
    nfcWriteTransferAdd(
        ST25DV_ADDR_SYST_I2C,
        ST25DV_I2CPASSWD_REG,
        ai2c_message,
        I2C_PWD_SIZE + 1 + I2C_PWD_SIZE,
        (uintptr_t)NULL
    );
};

void nfcWriteMailbox(uint8_t *transferBuf, ssize_t size) {
    static GLOBAL_QUEUE_EVENT nfcWriteMailboxSuccessEvent = {
            .type = NFC_WRITE_MAILBOX_SUCCESS,
            .payload = {}
    };

    nfcWriteTransferAdd(
            ST25DV_ADDR_DATA_I2C,
            ST25DV_MAILBOX_RAM_REG,
            transferBuf,
            size,
            (uintptr_t) &nfcWriteMailboxSuccessEvent
    );
};

void nfcTransferOnSuccess(uintptr_t context) {
    if (context == (uintptr_t)NULL) {
        // for internal transition
        nfc_appData.internalEvent = TRANSFER_OK;
    } else {
        // dispatch global event
        GLOBAL_QUEUE_EVENT *globalQueueEvent = (GLOBAL_QUEUE_EVENT *) context;
        globalQueueEnqueueEvent(&globalEventsQueueObj, globalQueueEvent);
    }
}

void nfcTransferOnError(uintptr_t context) {
    nfc_appData.internalEvent = TRANSFER_RETRY;
}

void nfcTransferEventHandler(
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context) {
    if (event == DRV_I2C_TRANSFER_EVENT_COMPLETE)
        nfcTransferOnSuccess(context);
    else
        nfcTransferOnError(context);
}

void nfcWriteTransferAdd(const uint16_t address, const uint8_t *cmd, uint8_t *buffer, size_t size, uintptr_t context) {
    clearLocalTransferBuffer();
    memcpy(nfc_appData.transferBuf, cmd, NFC_CMD_SIZE);
    memcpy(nfc_appData.transferBuf + NFC_CMD_SIZE, buffer, size);

    DRV_I2C_TransferEventHandlerSet(
            nfc_appData.drvI2CHandle,
            nfcTransferEventHandler,
            context
    );

    DRV_I2C_WriteTransferAdd(
            nfc_appData.drvI2CHandle,
            address,
            nfc_appData.transferBuf,
            NFC_CMD_SIZE + size,
            &nfc_appData.transferHandle
    );
};

void stateTransition(NFC_APP_STATES nextState) {
    nfc_appData.internalEvent = NO_EVENT;
    nfc_appData.state = nextState;
};

void clearLocalTransferBuffer() {
    memset(nfc_appData.transferBuf, 0, NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH);
};

/*******************************************************************************
 End of File
 */
