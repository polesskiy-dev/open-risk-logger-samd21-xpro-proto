/*
 * File:   nfc_actor.h
 * Author: apolisskyi
 *
 * Created on February 14, 2023, 3:00 AM
 */

// TODO rename to _APP_
#ifndef NFC_ACTOR_H
#define NFC_ACTOR_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>

#include "../config/default/configuration.h"
#include "../config/default/driver/driver_common.h"
#include "../config/default/definitions.h"
#include "../state_machine_management/fsm.h"

#ifdef	__cplusplus
extern "C" {
#endif

#define NFC_UID_SIZE                        8
#define NFC_CMD_SIZE                        2
#define ST25DV_MAX_MAILBOX_LENGTH           256

#define ST25DV_ADDR_DATA_I2C                0xA6 >> 1
#define ST25DV_ADDR_SYST_I2C                0xAE >> 1

#define DEFAULT_I2C_PWD_MSB                 0x00000000
#define DEFAULT_I2C_PWD_LSB                 0x00000000
#define I2C_PWD_SIZE                        0x08

/* MB_MODE */
#define ST25DV_MB_MODE_RW_SHIFT              (0)
#define ST25DV_MB_MODE_RW_FIELD              0xFE
#define ST25DV_MB_MODE_RW_MASK               0x01

/* MB_CTRL_Dyn */
#define ST25DV_MB_CTRL_DYN_MBEN_SHIFT        (0)
#define ST25DV_MB_CTRL_DYN_MBEN_FIELD        0xFE
#define ST25DV_MB_CTRL_DYN_MBEN_MASK         0x01
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_SHIFT  (1)
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_FIELD  0xFD
#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_MASK   0x02
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_SHIFT    (2)
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_FIELD    0xFB
#define ST25DV_MB_CTRL_DYN_RFPUTMSG_MASK     0x04
#define ST25DV_MB_CTRL_DYN_STRESERVED_SHIFT  (3)
#define ST25DV_MB_CTRL_DYN_STRESERVED_FIELD  0xF7
#define ST25DV_MB_CTRL_DYN_STRESERVED_MASK   0x08
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_SHIFT (4)
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_FIELD 0xEF
#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_MASK  0x10
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_SHIFT   (5)
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_FIELD   0xDF
#define ST25DV_MB_CTRL_DYN_RFMISSMSG_MASK    0x20
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_SHIFT  (6)
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_FIELD  0x3F
#define ST25DV_MB_CTRL_DYN_CURRENTMSG_MASK   0xC0

typedef enum {
    NFC_ST_INIT = 0,
    NFC_ST_IDLE,
    NFC_ST_READ_UID,
    NFC_ST_PRESENT_I2C_PWD,
    NFC_ST_ALLOW_MB_MODE_WRITE,
    NFC_ST_ENABLE_FT_MODE,
    NFC_ST_WRITE_MAILBOX,
    NFC_ST_ERROR,
    NFC_STATES_MAX
} NFC_STATE;

typedef union {
    struct {
        uint32_t MsbPasswd;
        uint32_t LsbPasswd;
    };
    bool RFFieldPresence;
    uint8_t pwd[2 * sizeof (uint32_t)];
    uint8_t transferBuf[NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH];
} ST25DV_PASSWD;

typedef struct {
    NFC_STATE state;
    EVENTS_QUEUE queue;
    DRV_HANDLE drvI2CHandle;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    ST25DV_PASSWD pwd;
} NFC_ACT_OBJ;

// state handler f
typedef NFC_STATE (NFC_STATE_HANDLE_F)(NFC_ACT_OBJ *me, QUEUE_EVENT event);

void NFC_ACT_Initialize ( void );
void NFC_ACT_Tasks( void );

void NFC_ACT_Dispatch(QUEUE_EVENT event);
void NFC_ACT_HandleQueuedEvent(QUEUE_EVENT event);

void NFC_ACT_ProcessEventToNextState(NFC_ACT_OBJ *me, QUEUE_EVENT event);

// common I2C transfer handler
void NFC_ACT_TransferEventHandler(DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context);

#ifdef	__cplusplus
}
#endif

#endif //NFC_ACTOR_H
