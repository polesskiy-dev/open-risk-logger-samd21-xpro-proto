#include "sht3x_actor.h"

extern SHT3X_ACT_OBJ this;

// sht3x commands registers
uint8_t const SHT3X_CMD_READ_STATUS_REG[SHT3X_CMD_SIZE]         = {0xF3, 0x2D};

// transfer statuses
// TODO think how to add * to events here and get rid of additional
DRV_I2C_TRANSFER_HANDLE SHT3X_TRANSFER_HANDLE_READ_STATUS           = 0x0100;
//DRV_I2C_TRANSFER_HANDLE SHT3X_TRANSFER_HANDLE_START_MEASUREMENTS    = 0x0200;
//DRV_I2C_TRANSFER_HANDLE SHT3X_TRANSFER_HANDLE_READ_MEASURED         = 0x0300;

static void SHT3X_ACT_InitState(QUEUE_EVENT event) {
};

static void SHT3X_ACT_Idle(QUEUE_EVENT event) {
};

static void SHT3X_ACT_ReadStatus(QUEUE_EVENT event) {
    DRV_I2C_TransferEventHandlerSet(
            this.drvI2CHandle,
            SHT3X_ACT_TransferEventHandler,
            (uintptr_t) NULL
    );

    DRV_I2C_WriteReadTransferAdd(
            this.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void*)&SHT3X_CMD_READ_STATUS_REG,
            SHT3X_CMD_SIZE,
            &this.sensorRegs.status,
            SHT3X_STATUS_REG_SIZE,
            &SHT3X_TRANSFER_HANDLE_READ_STATUS
    );
};

void SHT3X_ACT_StateTransition(SHT3X_STATE state, QUEUE_EVENT event) {
    switch (state) {
        case SHT3X_ST_INIT:
            return SHT3X_ACT_InitState(event);
        case SHT3X_ST_IDLE:
            return SHT3X_ACT_Idle(event);
        case SHT3X_ST_READ_STATUS:
            return SHT3X_ACT_ReadStatus(event);
        case SHT3X_ST_MEASURE:
        case SHT3X_ST_READ_MEASURE:
        case SHT3X_ST_ERROR:
        default:
            return;
    }
};

SHT3X_NEXT_STATE_LOOKUP SHT3X_ACT_NextStateLookupTableCtor(void) {
    static QUEUE_EVENT_SIG signals[SHT3X_EVENTS_MAX] =
                                        {I2C_SIG_TRANSFER_SUCCESS,  I2C_SIG_TRANSFER_FAIL,  SHT3X_SIG_READ_STATUS,  SHT3X_SIG_MEASURE,  SHT3X_SIG_READ_MEASURE, SHT3X_SIG_ERROR};
    static SHT3X_TRANSITIONS_TABLE table = {
            [SHT3X_ST_INIT] =           {SHT3X_ST_INIT,             SHT3X_ST_INIT,          SHT3X_ST_READ_STATUS,   SHT3X_ST_MEASURE,   SHT3X_ST_READ_MEASURE,  SHT3X_ST_ERROR},
            [SHT3X_ST_IDLE] =           {SHT3X_ST_IDLE,             SHT3X_ST_IDLE,          SHT3X_ST_READ_STATUS,   SHT3X_ST_MEASURE,   SHT3X_ST_READ_MEASURE,  SHT3X_ST_ERROR},
            [SHT3X_ST_READ_STATUS] =    {SHT3X_ST_IDLE,             SHT3X_ST_READ_STATUS,   SHT3X_ST_READ_STATUS,   SHT3X_ST_MEASURE,   SHT3X_ST_READ_MEASURE,  SHT3X_ST_ERROR},
            [SHT3X_ST_MEASURE] =        {SHT3X_ST_IDLE,             SHT3X_ST_MEASURE,       SHT3X_ST_READ_STATUS,   SHT3X_ST_MEASURE,   SHT3X_ST_READ_MEASURE,  SHT3X_ST_ERROR},
            [SHT3X_ST_READ_MEASURE] =   {SHT3X_ST_IDLE,             SHT3X_ST_READ_MEASURE,  SHT3X_ST_READ_STATUS,   SHT3X_ST_MEASURE,   SHT3X_ST_READ_MEASURE,  SHT3X_ST_ERROR},
            [SHT3X_ST_ERROR] =          {SHT3X_ST_ERROR,            SHT3X_ST_ERROR,         SHT3X_ST_ERROR,         SHT3X_ST_ERROR,     SHT3X_ST_ERROR,         SHT3X_ST_ERROR}
    };

    static SHT3X_NEXT_STATE_LOOKUP lookup = {
            .signals = &signals,
            .table = &table
    };

    return lookup;
};