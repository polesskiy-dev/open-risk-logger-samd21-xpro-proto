/*
 * File:   event.h
 * Author: apolisskyi
 *
 * Created on February 2, 2023, 3:06 AM
 */

#ifndef EVENT_H
#define	EVENT_H

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#include "../../sht3x_actor/sht3x_events.h"
#include "../../nfc_actor/nfc_events.h"

#ifdef	__cplusplus
extern "C" {
#endif

#define QUEUE_MAX_SIZE 8

#define EMPTY_EVENT ((QUEUE_EVENT) {.sig = NO_EVENT, NULL})

typedef enum {
    NO_EVENT                = 0,

    // Flash memory
    FLASH_ERASE_BOOT_SECTOR,
    FLASH_ERASE_BOOT_SECTOR_SUCCESS,
    FLASH_ERASE_BOOT_SECTOR_ERROR,
    FLASH_WRITE_BOOT_SECTOR,
    FLASH_WRITE_BOOT_SECTOR_SUCCESS,
    FLASH_WRITE_BOOT_SECTOR_ERROR,

    // Global events
    GLOBAL_SIG_START_I = 0x80, // half of 0xFF
    // I2C Async Transfer
    I2C_TRANSFER_SUCCESS,
    I2C_TRANSFER_FAIL,
    I2C_TRANSFER_TIMEOUT,
    I2C_TRANSFER_MAX_RETRIES,

} QUEUE_EVENT_SIG;

typedef struct {
    union {
        QUEUE_EVENT_SIG sig;
        NFC_EVENT_SIG nfcSig;
        SHT3X_EVENT_SIG sht3xSig;
        int t;
    };
    void *payload;
} QUEUE_EVENT;

bool EVENT_eventcmp(QUEUE_EVENT *e1, QUEUE_EVENT *e2);

// debug
void EVENT_print(QUEUE_EVENT *event);

#ifdef	__cplusplus
}
#endif

#endif	/* EVENT_H */

