/**
* @file nfc_events.h 
* @author apolisskyi
* @date 16.02.2023
*/

#ifndef NFC_EVENTS_H
#define NFC_EVENTS_H

#ifdef    __cplusplus
extern "C" {
#endif

typedef enum {
    NFC_TRANSFER_SUCCESS = 1,
    NFC_TRANSFER_FAIL,
    NFC_TRANSFER_TIMEOUT,
    NFC_TRANSFER_MAX_RETRIES,

    NFC_READ_UID,
    NFC_PRESENT_I2C_PWD,
    NFC_ALLOW_MB_MODE_WRITE,
    NFC_ENABLE_FT_MODE,
    NFC_WRITE_MAILBOX,
    NFC_PREPARE_MAILBOX,
    NFC_ERROR,
    NFC_SIG_I_MAX,
} NFC_EVENT_SIG;

#ifdef    __cplusplus
}
#endif

#endif    /* NFC_EVENTS_H */
