///**
//* @file nfc_actor.h
//* @author apolisskyi
//* @date 16.02.2023
//*
//* @bried NFC ST25DV Actor declarations
//*/
//
//#ifndef NFC_ACTOR_H
//#define NFC_ACTOR_H
//
//#include <stdint.h>
//#include <stdbool.h>
//#include <stddef.h>
//#include <stdlib.h>
//
//#include "../config/default/configuration.h"
//#include "../config/default/driver/driver_common.h"
//#include "../config/default/definitions.h"
//#include "../state_machine_management/fsm.h"
//#include "./nfc_events.h"
//
//#ifdef	__cplusplus
//extern "C" {
//#endif
//
//#define NO_RETRIES_LEFT                     0
//#define NFC_TRANSFER_RETRIES_MAX            0x08
//
//#define NFC_UID_SIZE                        0x08
//#define NFC_CMD_SIZE                        0x02
//#define ST25DV_MAX_MAILBOX_LENGTH           0x100
//
//#define ST25DV_ADDR_DATA_I2C                0xA6 >> 1
//#define ST25DV_ADDR_SYST_I2C                0xAE >> 1
//
//#define DEFAULT_I2C_PWD_MSB                 0x00000000
//#define DEFAULT_I2C_PWD_LSB                 0x00000000
//#define I2C_PWD_SIZE                        0x08
//
///* MB_MODE */
//#define ST25DV_MB_MODE_RW_SHIFT              (0)
//#define ST25DV_MB_MODE_RW_FIELD              0xFE
//#define ST25DV_MB_MODE_RW_MASK               0x01
//
///* MB_CTRL_Dyn */
//#define ST25DV_MB_CTRL_DYN_MBEN_SHIFT        (0)
//#define ST25DV_MB_CTRL_DYN_MBEN_FIELD        0xFE
//#define ST25DV_MB_CTRL_DYN_MBEN_MASK         0x01
//#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_SHIFT  (1)
//#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_FIELD  0xFD
//#define ST25DV_MB_CTRL_DYN_HOSTPUTMSG_MASK   0x02
//#define ST25DV_MB_CTRL_DYN_RFPUTMSG_SHIFT    (2)
//#define ST25DV_MB_CTRL_DYN_RFPUTMSG_FIELD    0xFB
//#define ST25DV_MB_CTRL_DYN_RFPUTMSG_MASK     0x04
//#define ST25DV_MB_CTRL_DYN_STRESERVED_SHIFT  (3)
//#define ST25DV_MB_CTRL_DYN_STRESERVED_FIELD  0xF7
//#define ST25DV_MB_CTRL_DYN_STRESERVED_MASK   0x08
//#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_SHIFT (4)
//#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_FIELD 0xEF
//#define ST25DV_MB_CTRL_DYN_HOSTMISSMSG_MASK  0x10
//#define ST25DV_MB_CTRL_DYN_RFMISSMSG_SHIFT   (5)
//#define ST25DV_MB_CTRL_DYN_RFMISSMSG_FIELD   0xDF
//#define ST25DV_MB_CTRL_DYN_RFMISSMSG_MASK    0x20
//#define ST25DV_MB_CTRL_DYN_CURRENTMSG_SHIFT  (6)
//#define ST25DV_MB_CTRL_DYN_CURRENTMSG_FIELD  0x3F
//#define ST25DV_MB_CTRL_DYN_CURRENTMSG_MASK   0xC0
//
//typedef enum {
//    NFC_TRANSFER_SUCCESS = 1,
//    NFC_TRANSFER_FAIL,
//    NFC_TRANSFER_TIMEOUT,
//    NFC_TRANSFER_MAX_RETRIES,
//
//    NFC_READ_UID,
//    NFC_PRESENT_I2C_PWD,
//    NFC_ALLOW_MB_MODE_WRITE,
//    NFC_ENABLE_FT_MODE,
//    NFC_WRITE_MAILBOX,
//    NFC_PREPARE_MAILBOX,
//    NFC_ERROR,
//    NFC_SIG_I_MAX,
//} NFC_EVENT_SIG;
//
///**
//* @brief nfc states
//*/
//typedef enum {
//    NFC_ST_INIT = 0,
//    NFC_ST_IDLE,
//    NFC_ST_READ_UID,
//    NFC_ST_PRESENT_I2C_PWD,
//    NFC_ST_ALLOW_MB_MODE_WRITE,
//    NFC_ST_ENABLE_FT_MODE,
//    NFC_ST_WRITE_MAILBOX,
//    NFC_ST_ERROR,
//    NFC_STATES_MAX
//} NFC_STATE;
//
//typedef union {
//    struct {
//        uint32_t MsbPasswd;
//        uint32_t LsbPasswd;
//    };
//    uint8_t pwd[2 * sizeof (uint32_t)];
//} ST25DV_PASSWD;
//
///**
// * @brief NFC ST25DV Actor
// * @extends SUPER_ACT_OBJ
// */
//typedef struct {
//    SUPER_ACT_OBJ super;
//    DRV_HANDLE drvI2CHandle;
//    DRV_I2C_TRANSFER_HANDLE transferHandle;
//    uint8_t retriesLeft;
//    bool RFFieldPresence;
//    union {
//        uint8_t raw[NFC_CMD_SIZE + ST25DV_MAX_MAILBOX_LENGTH];
//        struct {
//            uint16_t cmd;
//            uint8_t mailbox[ST25DV_MAX_MAILBOX_LENGTH];
//        };
//    } transferBuf;
//    struct {
//        uint8_t uid[NFC_UID_SIZE];
//        ST25DV_PASSWD pwd;
//    } st25dvRegs;
//} NFC_ACT_OBJ;
//
///**
// * @brief State handler function type
// * @memberof NFC_ACT_OBJ
// */
//typedef NFC_STATE (NFC_STATE_HANDLE_F)(NFC_ACT_OBJ *me, QUEUE_EVENT event);
//
///**
// * @brief Initialize and construct actor, should be called before tasks
// * @memberof NFC_ACT_OBJ
// */
//void NFC_ACT_Initialize ( void );
//
///**
// * @brief Perform Actor tasks, mainly listen for events and process them
// * @memberof NFC_ACT_OBJ
// */
//void NFC_ACT_Tasks( void );
//
///**
// * @brief Dispatch event to NFC_ACT_OBJ queue
// * @memberof NFC_ACT_OBJ
// * @param event[in]
// */
//void NFC_ACT_Dispatch(QUEUE_EVENT event);
//
///**
// * @brief Callback for I2C ISR on success/error transfer.
// *
// * Required by Harmony framework drivers approach.
// * On success/error transfer ISR should dispatch appropriate event to Actor's queue
// *
// * @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-95F7ABE3-6864-4FC9-B11B-97B31ACF683C
// * @memberof NFC_ACT_OBJ
// * @param event[in]             transfer event
// * @param transferHandle[in]    marks appropriate Actor to associate callback with
// * @param context[in]           should be ptr to Actor, mostly unused
// */
//void NFC_ACT_TransferEventHandler(DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context);
//
//#ifdef	__cplusplus
//}
//#endif
//
//#endif //NFC_ACTOR_H
