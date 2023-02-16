#include "nfc_actor.h"

// st25dv nfc commands registers
static const uint8_t ST25DV_UID_REG[NFC_CMD_SIZE] = {0x00, 0x18};
//static const uint8_t ST25DV_MAILBOX_RAM_REG[NFC_CMD_SIZE]  =    {0x20, 0x08};
//static const uint8_t ST25DV_MB_CTRL_DYN_REG[NFC_CMD_SIZE]  =    {0x20, 0x06};
//static const uint8_t ST25DV_MB_MODE_REG[NFC_CMD_SIZE]  =        {0x00, 0x0D};
//static const uint8_t ST25DV_I2CPASSWD_REG[NFC_CMD_SIZE]  =      {0x09, 0x00};

//static uint8_t ST25DV_MB_MODE_RW =                              ST25DV_MB_MODE_RW_MASK;
//static uint8_t ST25DV_MB_CTRL_DYN_MBEN =                        ST25DV_MB_CTRL_DYN_MBEN_MASK;

// State handlers f prototypes
static NFC_STATE NFC_Init(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_Idle(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_ReadUID(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_PresentI2CPwd(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_AllowMBModeWrite(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_EnableFTMode(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_WriteMailbox(NFC_ACT_OBJ *me, QUEUE_EVENT event);

static NFC_STATE NFC_Error(NFC_ACT_OBJ *me, QUEUE_EVENT event);


// state transitions table, [state][event] => state handler f pointer
NFC_STATE_HANDLE_F *nfcTransitionTable[NFC_STATES_MAX][NFC_SIG_I_MAX] = {
        [NFC_ST_INIT]=                  {[NFC_READ_UID]=&NFC_ReadUID, [NFC_PREPARE_MAILBOX]=&NFC_PresentI2CPwd, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_IDLE]=                  {[NFC_WRITE_MAILBOX]=&NFC_WriteMailbox, [NFC_READ_UID]=&NFC_ReadUID, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_READ_UID]=              {[NFC_TRANSFER_SUCCESS]=&NFC_Init, [NFC_TRANSFER_FAIL]=&NFC_Error, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_PRESENT_I2C_PWD]=       {[NFC_TRANSFER_SUCCESS]=&NFC_AllowMBModeWrite, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_ALLOW_MB_MODE_WRITE]=   {[NFC_TRANSFER_SUCCESS]=&NFC_EnableFTMode, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_ENABLE_FT_MODE]=        {[NFC_TRANSFER_SUCCESS]=&NFC_Idle, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_WRITE_MAILBOX]=         {[NFC_TRANSFER_SUCCESS]=&NFC_Idle, [NFC_ERROR]=&NFC_Error},
        [NFC_ST_ERROR]=                 {[NFC_ERROR]=&NFC_Error},
};

static NFC_STATE NFC_Init(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
    return NFC_ST_INIT;
};

static NFC_STATE NFC_Idle(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
    return NFC_ST_IDLE;
};

static NFC_STATE NFC_ReadUID(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
    DRV_I2C_WriteReadTransferAdd(
            me->drvI2CHandle,
            ST25DV_ADDR_SYST_I2C,
            (void *) ST25DV_UID_REG,
            NFC_CMD_SIZE,
            &(me->st25dvRegs.uid),
            NFC_UID_SIZE,
            &(me->transferHandle)
    );

    // error on i2c transfer queuing
    if (DRV_I2C_TRANSFER_HANDLE_INVALID == me->transferHandle) {
        NFC_ACT_Dispatch((QUEUE_EVENT) {.nfcSig = NFC_ERROR});
    };
    
    return NFC_ST_READ_UID;
};

static NFC_STATE NFC_PresentI2CPwd(NFC_ACT_OBJ *me, QUEUE_EVENT event) { return NFC_ST_PRESENT_I2C_PWD; };

static NFC_STATE NFC_AllowMBModeWrite(NFC_ACT_OBJ *me, QUEUE_EVENT event) { return NFC_ST_ALLOW_MB_MODE_WRITE; };

static NFC_STATE NFC_EnableFTMode(NFC_ACT_OBJ *me, QUEUE_EVENT event) { return NFC_ST_ENABLE_FT_MODE; };

static NFC_STATE NFC_WriteMailbox(NFC_ACT_OBJ *me, QUEUE_EVENT event) { return NFC_ST_WRITE_MAILBOX; };

static NFC_STATE NFC_Error(NFC_ACT_OBJ *me, QUEUE_EVENT event) {
    switch (me->state) {
        case NFC_ST_READ_UID:
            SYS_DEBUG_MESSAGE(SYS_ERROR_ERROR, "NFC read UID error\n");
            break;
    }
    return NFC_ST_ERROR;
};