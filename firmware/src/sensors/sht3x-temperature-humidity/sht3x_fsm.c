#include "./sht3x.h"
#include "../../../../libraries/active-object-fsm/src/fsm/fsm_impl.h"

FSM_IMPLEMENTATION(SHT3X_AO, SHT3X_TEvent, SHT3X_STATE, SHT3X_SIG_MAX, SHT3X_STATES_MAX);

extern SHT3X_AO sht3xObj;

/* sht3x-temperature-humidity commands registers */
static const uint8_t SHT3X_CMD_READ_STATUS_REG[SHT3X_CMD_SIZE] =    {0xF3, 0x2D};
static const uint8_t SHT3X_CMD_MEASURE_LPM[SHT3X_CMD_SIZE] =        {0x24, 0x16};

/* Event handlers f prototypes */
static SHT3X_STATE _idle(SHT3X_AO *const sht3xObj, SHT3X_TEvent event);
static SHT3X_STATE _readStatus(SHT3X_AO *const sht3xObj, SHT3X_TEvent event);
static SHT3X_STATE _measure(SHT3X_AO *const sht3xObj, SHT3X_TEvent event);
static SHT3X_STATE _readMeasurements(SHT3X_AO *const sht3xObj, SHT3X_TEvent event);
static SHT3X_STATE _error(SHT3X_AO *const sht3xObj, SHT3X_TEvent event);

static void _dispatchReadMeasurements(uintptr_t context);
static void _tempDispatchMeasure(uintptr_t context); // TODO replace it by scheduler

/* state transitions table */
SHT3X_TEvent_HANDLE_F sht3xTransitionTable[SHT3X_STATES_MAX][SHT3X_SIG_MAX] = {
        [SHT3X_ST_INIT]=                {[SHT3X_READ_STATUS]=&_readStatus,  [SHT3X_MEASURE]=&_measure,      [SHT3X_ERROR]=&_error},
        [SHT3X_ST_IDLE]=                {[SHT3X_READ_STATUS]=&_readStatus,  [SHT3X_MEASURE]=&_measure,      [SHT3X_ERROR]=&_error},
        [SHT3X_ST_READ_STATUS]=         {[SHT3X_TRANSFER_SUCCESS]=&_idle,   [SHT3X_TRANSFER_FAIL]=&_error,  [SHT3X_ERROR]=&_error},
        [SHT3X_ST_MEASURE]=             {[SHT3X_TRANSFER_SUCCESS]=NULL,     [SHT3X_TRANSFER_FAIL]=&_error,  [SHT3X_READ_MEASURE]=&_readMeasurements, [SHT3X_ERROR]=&_error},
        [SHT3X_ST_READ_MEASURE]=        {[SHT3X_TRANSFER_SUCCESS]=&_idle,   [SHT3X_TRANSFER_FAIL]=&_error,  [SHT3X_ERROR]=&_error},
        [SHT3X_ST_ERROR]=               {[SHT3X_ERROR]=&_error}
};

SHT3X_STATE SHT3X_ProcessEventToNextState(SHT3X_AO *const sht3xObj, SHT3X_TEvent event) {
    SHT3X_STATE nextState = SHT3X_AO_FSM_ProcessEventToNextState(sht3xObj, event, sht3xTransitionTable, NULL);

    return nextState;
};


static SHT3X_STATE _idle(SHT3X_AO *const sht3xObj, SHT3X_TEvent event) {
    LED_Off();

    // temporary schedule measurement
    SYS_TIME_CallbackRegisterMS(
            _tempDispatchMeasure,
            (uintptr_t) NULL,
            1000,
            SYS_TIME_SINGLE
    );

    return SHT3X_ST_IDLE;
};

/**
 * @brief Detects whether the sensor is connected - by reading out it's ID register.
 * @description If the sensor does not answer or if the answer is not the expected value,
 * the test fails.
 */
static SHT3X_STATE _readStatus(SHT3X_AO *const sht3xObj, SHT3X_TEvent event) {
    DRV_I2C_WriteReadTransferAdd(
            sht3xObj->fields.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void *) &SHT3X_CMD_READ_STATUS_REG,
            SHT3X_CMD_SIZE,
            &(sht3xObj->fields.sensorRegs.status),
            SHT3X_STATUS_REG_SIZE,
            &(sht3xObj->fields.transferHandle)
    );

    // error on i2c transfer queuing
    if (DRV_I2C_TRANSFER_HANDLE_INVALID == sht3xObj->fields.transferHandle) {
        SHT3X_AO_Dispatch(sht3xObj, (SHT3X_TEvent){.sig = SHT3X_ERROR});
    };

    return SHT3X_ST_READ_STATUS;
};

/**
 * @brief Starts a measurement in high precision mode
 * @description Use sht3x_read() to read
 * out the values, once the measurement is done. The duration of the measurement
 * depends on the sensor in use, please consult the datasheet.
 */
static SHT3X_STATE _measure(SHT3X_AO *sht3xObj, SHT3X_TEvent event) {
    LED_On();

    DRV_I2C_WriteTransferAdd(
            sht3xObj->fields.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            (void *) &SHT3X_CMD_MEASURE_LPM,
            SHT3X_CMD_SIZE,
            &(sht3xObj->fields.transferHandle)
    );

    // error on i2c transfer queuing
    if (DRV_I2C_TRANSFER_HANDLE_INVALID == sht3xObj->fields.transferHandle) {
        SHT3X_AO_Dispatch(sht3xObj, (SHT3X_TEvent){.sig = SHT3X_ERROR});
    };


    // schedule measurement read cause SHT3x sensor needs some time to measure temperature/humidity
    SYS_TIME_CallbackRegisterMS(
            _dispatchReadMeasurements,
            (uintptr_t) NULL,
            SHT3X_MEASURE_TIME_MS,
            SYS_TIME_SINGLE
    );

    return SHT3X_ST_MEASURE;
};

/**
 * @brief Read results of measurements (usually after 15ms delay)
 */
static SHT3X_STATE _readMeasurements(SHT3X_AO *const sht3xObj, SHT3X_TEvent event) {
    DRV_I2C_ReadTransferAdd(
            sht3xObj->fields.drvI2CHandle,
            SHT3X_I2C_ADDR_DFLT,
            &(sht3xObj->fields.sensorRegs.measurements),
            SHT3X_MEASUREMENTS_SIZE,
            &(sht3xObj->fields.transferHandle)
    );

    // error on i2c transfer queuing
    if (DRV_I2C_TRANSFER_HANDLE_INVALID == sht3xObj->fields.transferHandle) {
        SHT3X_AO_Dispatch(sht3xObj, (SHT3X_TEvent){.sig = SHT3X_ERROR});
    };

    return SHT3X_ST_READ_MEASURE;
};

static SHT3X_STATE _error(SHT3X_AO *const sht3xObj, SHT3X_TEvent event) { return SHT3X_ST_ERROR; };


static void _dispatchReadMeasurements(uintptr_t context){
    SHT3X_AO_Dispatch(&sht3xObj,  (SHT3X_TEvent){.sig = SHT3X_READ_MEASURE});
}

static void _tempDispatchMeasure(uintptr_t context) {
    SHT3X_AO_Dispatch(&sht3xObj,  (SHT3X_TEvent){.sig = SHT3X_MEASURE});
};