#include "sht3x_actor.h"

SHT3X_ACT_OBJ me = {}; // init in ctor


// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Local Functions
// *****************************************************************************
// *****************************************************************************
static void SHT3X_ACT_Ctor(void) {
    me.state = SHT3X_ST_INIT;
    me.drvI2CHandle = DRV_HANDLE_INVALID;
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
        FSM_Dispatch(&me.queue, (QUEUE_EVENT) {.sig = I2C_SIG_TRANSFER_SUCCESS, .payload = (void *) transferHandle});
    } else if (DRV_I2C_TRANSFER_EVENT_ERROR == event) {
        FSM_Dispatch(&me.queue, (QUEUE_EVENT) {.sig = I2C_SIG_TRANSFER_FAIL, .payload = (void *) transferHandle});
    };
};

// *****************************************************************************
// *****************************************************************************
// Section: SHT3X Actor Global Functions
// *****************************************************************************
// *****************************************************************************

void SHT3X_ACT_Tasks(void) {
    if (!QUEUE_isEmpty(&me.queue)) {
        QUEUE_EVENT newEvent = QUEUE_unshiftEvent(&me.queue);
        SHT3X_ACT_HandleQueuedEvent(newEvent);
    }
}

void SHT3X_ACT_Initialize(void) {
    SHT3X_ACT_Ctor();
    me.drvI2CHandle = SHT3X_ACT_OpenI2CDriver();

    // TODO schedule it by scheduler and/or call in self-test
    SHT3X_ACT_Dispatch((QUEUE_EVENT){.sig = SHT3X_SIG_READ_STATUS});
};

void SHT3X_ACT_HandleQueuedEvent(QUEUE_EVENT event) {
    SHT3X_ACT_ProcessEventToNextState(&me, event);
};

void SHT3X_ACT_Dispatch(QUEUE_EVENT event) {
    FSM_Dispatch(&(me.queue), event);
}