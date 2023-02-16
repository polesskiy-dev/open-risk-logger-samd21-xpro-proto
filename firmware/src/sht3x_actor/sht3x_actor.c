#include "sht3x_actor.h"

extern SHT3X_STATE_HANDLE_F *sht3xTransitionTable[SHT3X_STATES_MAX][SHT3X_SIG_I_MAX];
extern QUEUE_EVENT_SIG sht3XParticularEventSigsLookup[SHT3X_SIG_I_MAX];

SHT3X_ACT_OBJ sht3xObj; // init in ctor

// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Local Functions
// *****************************************************************************
// *****************************************************************************
static void SHT3X_ACT_Ctor(SHT3X_ACT_OBJ *me, DRV_HANDLE drvI2CHandle) {
    me->queue = QUEUE_Ctor();
    me->state = SHT3X_ST_INIT;
    me->drvI2CHandle = drvI2CHandle;
    me->transferHandle = DRV_I2C_TRANSFER_HANDLE_INVALID;
};

static DRV_HANDLE SHT3X_ACT_OpenI2CDriver(void) {
    DRV_HANDLE drvI2CHandle = DRV_I2C_Open(DRV_I2C_INDEX_0,
                                           DRV_IO_INTENT_READWRITE | DRV_IO_INTENT_NONBLOCKING |
                                           DRV_IO_INTENT_SHARED);

    return drvI2CHandle;
};

static void SHT3X_ACT_HandleQueuedEvent(QUEUE_EVENT event) {
    FSM_ProcessEventToNextState(
            (SUPER_ACT_OBJ *) &sht3xObj,
            event,
            (TRANSITION_TABLE_DESCRIPTION) {
                    .STATES_MAX = SHT3X_STATES_MAX,
                    .EVENTS_MAX = SHT3X_SIG_I_MAX
            },
            (STATE_HANDLE_F *(*)[SHT3X_SIG_I_MAX]) sht3xTransitionTable
    );
};

// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Global Functions
// *****************************************************************************
// *****************************************************************************
void SHT3X_ACT_Initialize(void) {
    // open I2C driver, get handler
    DRV_HANDLE drvI2CHandle = SHT3X_ACT_OpenI2CDriver();

    // init SHT3X actor object
    SHT3X_ACT_Ctor(&sht3xObj, drvI2CHandle);

    // error on driver opening error
    if (DRV_HANDLE_INVALID == drvI2CHandle) {
        return SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_ERROR});
    };

    // set I2C handler @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-C99FBA78-A80D-40EE-B863-E40151E30C73
    DRV_I2C_TransferEventHandlerSet(
            sht3xObj.drvI2CHandle,
            SHT3X_ACT_TransferEventHandler,
            (uintptr_t) &sht3xObj
    );

    // TODO schedule it by scheduler and/or call in self-test
    SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_READ_STATUS});
};

void SHT3X_ACT_Tasks(void) {
    if (!QUEUE_isEmpty(&sht3xObj.queue)) {
        QUEUE_EVENT newEvent = QUEUE_unshiftEvent(&sht3xObj.queue);
        SHT3X_ACT_HandleQueuedEvent(newEvent);
    }
}

void SHT3X_ACT_Dispatch(QUEUE_EVENT event) {
    FSM_Dispatch(&(sht3xObj.queue), (QUEUE_EVENT) event);
}

/**
 * @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-95F7ABE3-6864-4FC9-B11B-97B31ACF683C
 * @param[in] event
 * @param[out] transferHandle
 * @param[in] context
 */
void SHT3X_ACT_TransferEventHandler(
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
            return SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_TRANSFER_SUCCESS});

            /* There was an error while processing the buffer transfer request. */
        case DRV_I2C_TRANSFER_EVENT_ERROR:
            return SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_TRANSFER_FAIL});

            /* Transfer Handle given is expired. It means transfer
            is completed but with or without error is not known. */
        case DRV_I2C_TRANSFER_EVENT_HANDLE_EXPIRED:
        case DRV_I2C_TRANSFER_EVENT_HANDLE_INVALID:
            return SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_ERROR});
    };
};