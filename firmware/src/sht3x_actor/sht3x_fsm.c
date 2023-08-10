//#include "sht3x_actor.h"
//
//// sht3x commands registers
//static const uint8_t SHT3X_CMD_READ_STATUS_REG[SHT3X_CMD_SIZE] =    {0xF3, 0x2D};
//static const uint8_t SHT3X_CMD_MEASURE_LPM[SHT3X_CMD_SIZE] =        {0x24, 0x16};
//
//// State handlers f prototypes
//static SHT3X_STATE SHT3X_Idle(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);
//
//static SHT3X_STATE SHT3X_ReadStatus(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);
//
//static SHT3X_STATE SHT3X_Measure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);
//
//static SHT3X_STATE SHT3X_ReadMeasure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);
//
//static SHT3X_STATE SHT3X_Error(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);
//
//// state transitions table, [state][event] => state handler f pointer
//SHT3X_STATE_HANDLE_F *sht3xTransitionTable[SHT3X_STATES_MAX][SHT3X_SIG_I_MAX] = {
//        [SHT3X_ST_INIT]=                {[SHT3X_READ_STATUS]=&SHT3X_ReadStatus, [SHT3X_MEASURE]=&SHT3X_Measure, [SHT3X_ERROR]=&SHT3X_Error},
//        [SHT3X_ST_IDLE]=                {[SHT3X_READ_STATUS]=&SHT3X_ReadStatus, [SHT3X_MEASURE]=&SHT3X_Measure, [SHT3X_ERROR]=&SHT3X_Error},
//        [SHT3X_ST_READ_STATUS]=         {[SHT3X_TRANSFER_SUCCESS]=&SHT3X_Idle, [SHT3X_TRANSFER_FAIL]=&SHT3X_Error, [SHT3X_ERROR]=&SHT3X_Error},
//        [SHT3X_ST_MEASURE]=             {[SHT3X_TRANSFER_SUCCESS]=NULL, [SHT3X_TRANSFER_FAIL]=&SHT3X_Error, [SHT3X_READ_MEASURE]=&SHT3X_ReadMeasure, [SHT3X_ERROR]=&SHT3X_Error},
//        [SHT3X_ST_READ_MEASURE]=        {[SHT3X_TRANSFER_SUCCESS]=&SHT3X_Idle, [SHT3X_TRANSFER_FAIL]=&SHT3X_Error, [SHT3X_ERROR]=&SHT3X_Error},
//        [SHT3X_ST_ERROR]=               {[SHT3X_ERROR]=&SHT3X_Error}
//};
//
///*static void SHT3X_TempDispatchMeasure(uintptr_t context) {
//    SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sig = SHT3X_MEASURE});;
//}*/
//
//static void SHT3X_DispatchReadMeasure(uintptr_t context) {
//    SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_READ_MEASURE});;
//}
//
//static SHT3X_STATE SHT3X_Idle(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
//    LED_Off();
//
//    // TODO remove it
//    // temporary schedule measurement
////    SYS_TIME_CallbackRegisterMS(
////            SHT3X_TempDispatchMeasure,
////            (uintptr_t) NULL,
////            1000,
////            SYS_TIME_SINGLE
////    );
//
//    return SHT3X_ST_IDLE;
//};
//
///**
// * @brief Handle read sensor status
// * Detects if a sensor is connected by reading out the ID register.
// * If the sensor does not answer or if the answer is not the expected value,
// * the test fails.
// */
//static SHT3X_STATE SHT3X_ReadStatus(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
//    DRV_I2C_WriteReadTransferAdd(
//            me->drvI2CHandle,
//            SHT3X_I2C_ADDR_DFLT,
//            (void *) &SHT3X_CMD_READ_STATUS_REG,
//            SHT3X_CMD_SIZE,
//            &(me->sensorRegs.status),
//            SHT3X_STATUS_REG_SIZE,
//            &(me->transferHandle)
//    );
//
//    // error on i2c transfer queuing
//    if (DRV_I2C_TRANSFER_HANDLE_INVALID == me->transferHandle) {
//        SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_ERROR});
//    };
//
//    return SHT3X_ST_READ_STATUS;
//};
//
///**
// * @brief Handle measure state
// * Starts a measurement in high precision mode. Use sht3x_read() to read
// * out the values, once the measurement is done. The duration of the measurement
// * depends on the sensor in use, please consult the datasheet.
// */
//static SHT3X_STATE SHT3X_Measure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
//    LED_On();
//
//    DRV_I2C_WriteTransferAdd(
//            me->drvI2CHandle,
//            SHT3X_I2C_ADDR_DFLT,
//            (void *) &SHT3X_CMD_MEASURE_LPM,
//            SHT3X_CMD_SIZE,
//            &(me->transferHandle)
//    );
//
//    // error on i2c transfer queuing
//    if (DRV_I2C_TRANSFER_HANDLE_INVALID == me->transferHandle) {
//        SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_ERROR});
//    };
//
//
//    // schedule measurement read cause sht3x sensor needs some time to measure temperature/humidity
//    SYS_TIME_CallbackRegisterMS(
//            SHT3X_DispatchReadMeasure,
//            (uintptr_t) NULL,
//            SHT3X_MEASURE_TIME_MS,
//            SYS_TIME_SINGLE
//    );
//
//    return SHT3X_ST_MEASURE;
//};
//
///**
// * @brief Handle read measure state
// * Read results of measurements (usually after 15ms delay)
// */
//static SHT3X_STATE SHT3X_ReadMeasure(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) {
//    DRV_I2C_ReadTransferAdd(
//            me->drvI2CHandle,
//            SHT3X_I2C_ADDR_DFLT,
//            &(me->sensorRegs.measurements),
//            SHT3X_MEASUREMENTS_SIZE,
//            &(me->transferHandle)
//    );
//
//    // error on i2c transfer queuing
//    if (DRV_I2C_TRANSFER_HANDLE_INVALID == me->transferHandle) {
//        SHT3X_ACT_Dispatch((QUEUE_EVENT) {.sht3xSig = SHT3X_ERROR});
//    };
//
//    return SHT3X_ST_READ_MEASURE;
//};
//
//static SHT3X_STATE SHT3X_Error(SHT3X_ACT_OBJ *me, QUEUE_EVENT event) { return SHT3X_ST_ERROR; };