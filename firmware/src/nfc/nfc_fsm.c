#include "./nfc.h"
//
//// st25dv nfc commands registers
//static const uint16_t ST25DV_UID_REG =              0x0018;
//static const uint16_t ST25DV_MAILBOX_RAM_REG =      0x2008;
//static const uint16_t ST25DV_MB_CTRL_DYN_REG =      0x2006;
//static const uint8_t ST25DV_MB_MODE_REG  =          0x000D;
//static const uint16_t ST25DV_I2C_PWD_REG =          0x0900;
//
//static const uint8_t ST25DV_MB_MODE_RW =            ST25DV_MB_MODE_RW_MASK;
//static const uint8_t ST25DV_MB_CTRL_DYN_MBEN =      ST25DV_MB_CTRL_DYN_MBEN_MASK;
//
//// State handlers f prototypes
//static NFC_STATE NFC_Init(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_Idle(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_ReadUID(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_PresentI2CPwd(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_AllowMBModeWrite(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_EnableFTMode(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_WriteMailbox(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//static NFC_STATE NFC_Error(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
//
//// state transitions table, [state][event] => state handler f pointer
//NFC_STATE_HANDLE_F *nfcTransitionTable[NFC_STATES_MAX][NFC_SIG_I_MAX] = {
//        [NFC_ST_INIT]=                  {[NFC_READ_UID]=&NFC_ReadUID, [NFC_PREPARE_MAILBOX]=&NFC_PresentI2CPwd,                                                            [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_IDLE]=                  {[NFC_WRITE_MAILBOX]=&NFC_WriteMailbox, [NFC_READ_UID]=&NFC_ReadUID,                                                               [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_READ_UID]=              {[NFC_TRANSFER_SUCCESS]=&NFC_Init,              [NFC_TRANSFER_FAIL]=&NFC_Error,                                                    [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_PRESENT_I2C_PWD]=       {[NFC_TRANSFER_SUCCESS]=&NFC_AllowMBModeWrite,  [NFC_TRANSFER_FAIL]=&NFC_PresentI2CPwd,     [NFC_TRANSFER_MAX_RETRIES]=&NFC_Error, [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_ALLOW_MB_MODE_WRITE]=   {[NFC_TRANSFER_SUCCESS]=&NFC_EnableFTMode,      [NFC_TRANSFER_FAIL]=&NFC_AllowMBModeWrite,  [NFC_TRANSFER_MAX_RETRIES]=&NFC_Error, [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_ENABLE_FT_MODE]=        {[NFC_TRANSFER_SUCCESS]=&NFC_Idle,              [NFC_TRANSFER_FAIL]=&NFC_EnableFTMode,      [NFC_TRANSFER_MAX_RETRIES]=&NFC_Error, [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_WRITE_MAILBOX]=         {[NFC_TRANSFER_SUCCESS]=&NFC_Idle,                                                                                                 [NFC_ERROR]=&NFC_Error},
//        [NFC_ST_ERROR]=                 {                                                                                                                                  [NFC_ERROR]=&NFC_Error},
//};
//
//static inline void validateTransferHandle(NFC_ACT_OBJ *me) {
//    // error on i2c transfer queuing
//    if (DRV_I2C_TRANSFER_HANDLE_INVALID == me->transferHandle) {
//        NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_ERROR});
//    };
//};
//
//static inline void checkRemainingRetries(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    // decrease remaining retries on transfer fail
//    if (NFC_TRANSFER_FAIL == event.nfcSig) {
//        if (NO_RETRIES_LEFT == --me->retriesLeft) {
//            NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_TRANSFER_MAX_RETRIES});
//        }
//    } else {
//        // or refresh counter on non fail event
//        me->retriesLeft = NFC_TRANSFER_RETRIES_MAX;
//    };
//};
//
//static inline void clearTransferBuf(NFC_ACT_OBJ *me) {
//    memset(me->transferBuf.raw, 0, NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH);
//};
//
//static inline bool isMailboxEmpty(NFC_ACT_OBJ *me) {
//    for (uint16_t i = 0; i < ST25DV_MAX_MAILBOX_LENGTH; i++)
//        if (me->transferBuf.mailbox[i] != 0)
//            return false;
//
//    return true;
//};
//
//static NFC_STATE NFC_Init(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    return NFC_ST_INIT;
//};
//
//static NFC_STATE NFC_Idle(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    return NFC_ST_IDLE;
//};
//
//static NFC_STATE NFC_ReadUID(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    DRV_I2C_WriteReadTransferAdd(
//            me->drvI2CHandle,
//            ST25DV_ADDR_SYST_I2C,
//            (void *) &ST25DV_UID_REG,
//            NFC_CMD_SIZE,
//            &(me->st25dvRegs.uid),
//            NFC_UID_SIZE,
//            &(me->transferHandle)
//    );
//
//    validateTransferHandle(me);
//
//    return NFC_ST_READ_UID;
//};
//
///**
//  * @brief  Presents I2C password, to authorize the I2C writes to protected areas.
//  */
//static NFC_STATE NFC_PresentI2CPwd(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    checkRemainingRetries(me, event);
//    clearTransferBuf(me);
//
//    /* Build I2C Message with Password + Validation code 0x09 + Password */
//    me->transferBuf.mailbox[I2C_PWD_SIZE] = 0x09;
//    for (uint8_t i = 0; i < 4; i++) {
//        me->transferBuf.mailbox[i] =        (me->st25dvRegs.pwd.MsbPasswd >> ((3 - i) * 8)) & 0xFF;
//        me->transferBuf.mailbox[i + 4] =    (me->st25dvRegs.pwd.LsbPasswd >> ((3 - i) * 8)) & 0xFF;
//        me->transferBuf.mailbox[i + 9] =    me->transferBuf.mailbox[i];
//        me->transferBuf.mailbox[i + 13] =   me->transferBuf.mailbox[i + 4];
//    };
//    me->transferBuf.cmd = ST25DV_I2C_PWD_REG;
//
//    DRV_I2C_WriteTransferAdd(
//            me->drvI2CHandle,
//            ST25DV_ADDR_SYST_I2C,
//            me->transferBuf.raw,
//            NFC_CMD_SIZE + I2C_PWD_SIZE + 1 + I2C_PWD_SIZE,
//            &(me->transferHandle)
//    );
//
//    validateTransferHandle(me);
//
//    return NFC_ST_PRESENT_I2C_PWD;
//};
//
//static NFC_STATE NFC_AllowMBModeWrite(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    checkRemainingRetries(me, event);
//    clearTransferBuf(me);
//
//    me->transferBuf.cmd = ST25DV_MB_MODE_REG;
//    *(me->transferBuf.mailbox) = ST25DV_MB_MODE_RW;
//
//    DRV_I2C_WriteTransferAdd(
//            me->drvI2CHandle,
//            ST25DV_ADDR_SYST_I2C,
//            me->transferBuf.raw,
//            NFC_CMD_SIZE + sizeof(ST25DV_MB_MODE_RW),
//            &(me->transferHandle)
//    );
//
//    validateTransferHandle(me);
//
//
//    return NFC_ST_ALLOW_MB_MODE_WRITE;
//};
//
//static NFC_STATE NFC_EnableFTMode(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    checkRemainingRetries(me, event);
//    clearTransferBuf(me);
//
//    me->transferBuf.cmd = ST25DV_MB_CTRL_DYN_REG;
//    *(me->transferBuf.mailbox) = ST25DV_MB_CTRL_DYN_MBEN;
//
//    DRV_I2C_WriteTransferAdd(
//            me->drvI2CHandle,
//            ST25DV_ADDR_DATA_I2C,
//            me->transferBuf.raw,
//            NFC_CMD_SIZE + sizeof(ST25DV_MB_CTRL_DYN_MBEN),
//            &(me->transferHandle)
//    );
//
//    validateTransferHandle(me);
//
//    return NFC_ST_ENABLE_FT_MODE;
//};
//
//// dont't forget to write to me->transferBuf.mailbox first,
//static NFC_STATE NFC_WriteMailbox(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    SYS_ASSERT(!isMailboxEmpty(me), "__FILE__ trying to transfer empty data to mailbox, have you written to me->transferBuf.mailbox first?");
//
//    me->transferBuf.cmd = ST25DV_MAILBOX_RAM_REG;
//
//    DRV_I2C_WriteTransferAdd(
//            me->drvI2CHandle,
//            ST25DV_ADDR_DATA_I2C,
//            me->transferBuf.raw,
//            NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH,
//            &(me->transferHandle)
//    );
//
//    validateTransferHandle(me);
//
//    return NFC_ST_WRITE_MAILBOX;
//};
//
//static NFC_STATE NFC_Error(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
//    SYS_ASSERT(!(NFC_ERROR == event.nfcSig), "__FILE__ NFC Error");
//    SYS_ASSERT(!(NFC_TRANSFER_FAIL == event.nfcSig), "__FILE__ NFC Transfer Error");
//    SYS_ASSERT(!(NFC_TRANSFER_MAX_RETRIES == event.nfcSig), "__FILE__ NFC Transfer max retries Error");
//    return NFC_ST_ERROR;
//};