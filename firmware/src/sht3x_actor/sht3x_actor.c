#include "sht3x_actor.h"

//static uint8_t SHT3X_CMD_MEASURE_LPM[SHT3X_CMD_SIZE]              = {0x24, 0x16};

SHT3X_ACT_OBJ this = {}; // init in ctor


// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Local Functions
// *****************************************************************************
// *****************************************************************************
static void SHT3X_ACT_Ctor(void) {
    this.state = SHT3X_ST_INIT;
    this.drvI2CHandle = DRV_HANDLE_INVALID;
    this.nextStateLookup = SHT3X_ACT_NextStateLookupTableCtor();
};

static DRV_HANDLE SHT3X_ACT_OpenI2CDriver(void) {
    DRV_HANDLE drvI2CHandle = DRV_I2C_Open(DRV_I2C_INDEX_0,
                                             DRV_IO_INTENT_READWRITE | DRV_IO_INTENT_NONBLOCKING |
                                             DRV_IO_INTENT_SHARED);
    if (DRV_I2C_TRANSFER_HANDLE_INVALID == drvI2CHandle) {
        SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sig = SHT3X_SIG_ERROR});
    };

    return drvI2CHandle;
};

// TODO lift it to common functions after implementing pub/sub
/**
 *
 * @param[in] event
 * @param[out] transferHandle
 * @param[in] context - event to emit on success
 */
void SHT3X_ACT_TransferEventHandler(
        DRV_I2C_TRANSFER_EVENT event,
        DRV_I2C_TRANSFER_HANDLE transferHandle,
        uintptr_t context
) {
    if (DRV_I2C_TRANSFER_EVENT_COMPLETE == event) {
        FSM_Dispatch(&this.queue, (QUEUE_EVENT) {.sig = I2C_SIG_TRANSFER_SUCCESS, .payload = (void *) transferHandle});
    } else if (DRV_I2C_TRANSFER_EVENT_ERROR == event) {
        FSM_Dispatch(&this.queue, (QUEUE_EVENT) {.sig = I2C_SIG_TRANSFER_FAIL, .payload = (void *) transferHandle});
    };
};


static SHT3X_STATE SHT3X_DRV_GetNextState(QUEUE_EVENT event) {
    SHT3X_STATE currState = this.state;
    uint8_t sigIndex = 0;
    // find signal index in lookup arr
    while ((event.sig != *this.nextStateLookup.signals[sigIndex])
        || sigIndex <= SHT3X_EVENTS_MAX) {
        sigIndex++;
    }

    SHT3X_TRANSITIONS_TABLE *table = this.nextStateLookup.table;
    SHT3X_STATE nextState = (*table)[currState][sigIndex];

    return nextState;
};
// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Global Functions
// *****************************************************************************
// *****************************************************************************

void SHT3X_ACT_Tasks(void) {
    if (!QUEUE_isEmpty(&this.queue)) {
        QUEUE_EVENT newEvent = QUEUE_unshiftEvent(&this.queue);
        SHT3X_ACT_HandleQueuedEvent(newEvent);
    }
}

void SHT3X_ACT_Initialize(void) {
    SHT3X_ACT_Ctor();
    this.drvI2CHandle = SHT3X_ACT_OpenI2CDriver();

    SHT3X_ACT_Dispatch((QUEUE_EVENT){.sig = SHT3X_SIG_READ_STATUS});
};

void SHT3X_ACT_HandleQueuedEvent(QUEUE_EVENT event) {
    SHT3X_STATE newState = SHT3X_DRV_GetNextState(event);

//    if (newState != this.state) {
//        SHT3X_DRV_OnExitState(this.state);
//        SHT3X_DRV_OnEnterState(newState);
//    }

    this.state = newState;

    SHT3X_ACT_StateTransition(newState, event);
};

void SHT3X_ACT_Dispatch(QUEUE_EVENT event) {
    FSM_Dispatch(&this.queue, event);
}