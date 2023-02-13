#include "sht3x_actor.h"

// sht3x commands registers
static const uint8_t SHT3X_CMD_READ_STATUS_REG[SHT3X_CMD_SIZE] = {0xF3, 0x2D};
//static const uint8_t SHT3X_CMD_MEASURE_LPM[SHT3X_CMD_SIZE]      = {0x24, 0x16};

// transfer handler markers
DRV_I2C_TRANSFER_HANDLE transferHandlerReadStatus = SHT3X_SIG_READ_STATUS;

static SHT3X_STATE SHT3X_Idle(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

static SHT3X_STATE SHT3X_ReadStatus(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

static SHT3X_STATE SHT3X_Measure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

static SHT3X_STATE SHT3X_ReadMeasure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

static SHT3X_STATE SHT3X_Error(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

QUEUE_EVENT_SIG possibleEventSigs[SHT3X_SIG_I_MAX] = {
        [I2C_SIG_TRANSFER_SUCCESS_I]=I2C_SIG_TRANSFER_SUCCESS,
        [I2C_SIG_TRANSFER_FAIL_I]=I2C_SIG_TRANSFER_FAIL,
        [SHT3X_SIG_READ_STATUS_I]=SHT3X_SIG_READ_STATUS,
        [SHT3X_SIG_MEASURE_I]=SHT3X_SIG_MEASURE,
        [SHT3X_SIG_READ_MEASURE_I]=SHT3X_SIG_READ_MEASURE,
        [SHT3X_SIG_ERROR_I]=SHT3X_SIG_ERROR};

SHT3X_STATE_HANDLE_F *transitionTable[SHT3X_STATES_MAX][SHT3X_SIG_I_MAX] = {
        [SHT3X_ST_INIT]=                {[SHT3X_SIG_READ_STATUS_I]=&SHT3X_ReadStatus, [SHT3X_SIG_ERROR_I]=&SHT3X_Error},
        [SHT3X_ST_IDLE]=                {[SHT3X_SIG_READ_STATUS_I]=&SHT3X_ReadStatus, [SHT3X_SIG_MEASURE_I]=&SHT3X_Measure, [SHT3X_SIG_ERROR_I]=&SHT3X_Error},
        [SHT3X_ST_READ_STATUS]=         {[I2C_SIG_TRANSFER_SUCCESS_I]=&SHT3X_Idle, [I2C_SIG_TRANSFER_FAIL_I]=&SHT3X_Error, [SHT3X_SIG_ERROR_I]=&SHT3X_Error},
        [SHT3X_ST_MEASURE]=             {[I2C_SIG_TRANSFER_SUCCESS_I]=&SHT3X_ReadMeasure, [I2C_SIG_TRANSFER_FAIL_I]=&SHT3X_Error, [SHT3X_SIG_ERROR_I]=&SHT3X_Error},
        [SHT3X_ST_READ_MEASURE]=        {[I2C_SIG_TRANSFER_SUCCESS_I]=&SHT3X_Idle, [I2C_SIG_TRANSFER_FAIL_I]=&SHT3X_Error, [SHT3X_SIG_ERROR_I]=&SHT3X_Error},
        [SHT3X_ST_ERROR]=               {[SHT3X_SIG_ERROR_I]=&SHT3X_Error}
};

uint8_t getEventIndex(QUEUE_EVENT targetEvent) {
        uint8_t signalI = I2C_SIG_TRANSFER_SUCCESS_I;
        while (possibleEventSigs[signalI] != targetEvent.sig) signalI++;

    return signalI;
};

void SHT3X_ACT_ProcessEventToNextState(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
    SHT3X_STATE prevState = me->state;
    uint8_t eventLookupIndex = getEventIndex(event);
    SHT3X_STATE_HANDLE_F *nextStateHandler = transitionTable[prevState][eventLookupIndex];

    SHT3X_STATE nextState = (*nextStateHandler)(me, event);
    me->state = nextState;
};

static SHT3X_STATE SHT3X_Idle(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
    return SHT3X_ST_IDLE;
};

static SHT3X_STATE SHT3X_ReadStatus(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
    DRV_I2C_TransferEventHandlerSet(
            me->drvI2CHandle,
            SHT3X_ACT_TransferEventHandler,
            (uintptr_t) NULL
    );

    DRV_I2C_WriteReadTransferAdd(
            me->drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void *) &SHT3X_CMD_READ_STATUS_REG,
            SHT3X_CMD_SIZE,
            &(me->sensorRegs.status),
            SHT3X_STATUS_REG_SIZE,
            &transferHandlerReadStatus
    );

    return SHT3X_ST_READ_STATUS;
};

static SHT3X_STATE SHT3X_Measure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) { return SHT3X_ST_MEASURE; };

static SHT3X_STATE SHT3X_ReadMeasure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) { return SHT3X_ST_READ_MEASURE; };

static SHT3X_STATE SHT3X_Error(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) { return SHT3X_ST_ERROR; };