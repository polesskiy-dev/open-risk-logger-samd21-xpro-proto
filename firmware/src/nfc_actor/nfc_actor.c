#include "nfc_actor.h"

extern NFC_STATE_HANDLE_F *nfcTransitionTable[NFC_STATES_MAX][NFC_SIG_I_MAX];

NFC_ACT_OBJ nfcObj; // init in ctor

// *****************************************************************************
// *****************************************************************************
// Section: NFC Actor Local Functions
// *****************************************************************************
// *****************************************************************************

static void NFC_ACT_Ctor(NFC_ACT_OBJ *me, DRV_HANDLE drvI2CHandle) {
    me->queue = QUEUE_Ctor();
    me->state = NFC_ST_INIT;
    me->drvI2CHandle = drvI2CHandle;
    me->transferHandle = DRV_I2C_TRANSFER_HANDLE_INVALID;
};

static DRV_HANDLE NFC_ACT_OpenI2CDriver(void) {
    DRV_HANDLE drvI2CHandle = DRV_I2C_Open(DRV_I2C_INDEX_0,
                                           DRV_IO_INTENT_READWRITE | DRV_IO_INTENT_NONBLOCKING |
                                           DRV_IO_INTENT_SHARED);

    return drvI2CHandle;
};

static void NFC_ACT_HandleQueuedEvent(QUEUE_EVENT event) {
    FSM_ProcessEventToNextState(
            (SUPER_ACT_OBJ *) &nfcObj,
            event,
            (TRANSITION_TABLE_DESCRIPTION) {
                    .STATES_MAX = NFC_STATES_MAX,
                    .EVENTS_MAX = NFC_SIG_I_MAX
            },
            (STATE_HANDLE_F *(*)[NFC_SIG_I_MAX]) nfcTransitionTable
    );
};

// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Global Functions
// *****************************************************************************
// *****************************************************************************

void NFC_ACT_Initialize(void) {
    // open I2C driver, get handler
    DRV_HANDLE drvI2CHandle = NFC_ACT_OpenI2CDriver();

    // init SHT3X actor object
    NFC_ACT_Ctor(&nfcObj, drvI2CHandle);

    // error on driver opening error
    if (DRV_HANDLE_INVALID == drvI2CHandle) {
        return NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_ERROR});
    };

    // set I2C handler @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-C99FBA78-A80D-40EE-B863-E40151E30C73
    DRV_I2C_TransferEventHandlerSet(
            nfcObj.drvI2CHandle,
            NFC_ACT_TransferEventHandler,
            (uintptr_t) &nfcObj
    );

    // TODO schedule it by scheduler and/or call in self-test
    NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_READ_UID});
};

void NFC_ACT_Tasks(void) {
    if (!QUEUE_isEmpty(&nfcObj.queue)) {
        QUEUE_EVENT newEvent = QUEUE_unshiftEvent(&nfcObj.queue);
        NFC_ACT_HandleQueuedEvent(newEvent);
    }
}

void NFC_ACT_Dispatch(QUEUE_EVENT event) {
    FSM_Dispatch(&(nfcObj.queue), event);
};

/**
 * @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-95F7ABE3-6864-4FC9-B11B-97B31ACF683C
 * @param[in] event
 * @param[out] transferHandle
 * @param[in] context - event to emit on success
 */
void NFC_ACT_TransferEventHandler(
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context
) {
    switch (event) {
        /* Transfer request is pending */
        case DRV_I2C_TRANSFER_EVENT_PENDING:
            return;

            /* All data from or to the buffer was transferred successfully. */
        case DRV_I2C_TRANSFER_EVENT_COMPLETE:
            return NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_TRANSFER_SUCCESS});

            /* There was an error while processing the buffer transfer request. */
        case DRV_I2C_TRANSFER_EVENT_ERROR:
            return NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_TRANSFER_FAIL});

            /* Transfer Handle given is expired. It means transfer
            is completed but with or without error is not known. */
        case DRV_I2C_TRANSFER_EVENT_HANDLE_EXPIRED:
        case DRV_I2C_TRANSFER_EVENT_HANDLE_INVALID:
            return NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_ERROR});
    };
};