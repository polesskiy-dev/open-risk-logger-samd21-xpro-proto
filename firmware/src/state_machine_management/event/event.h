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

#ifdef	__cplusplus
extern "C" {
#endif

#define QUEUE_MAX_SIZE 8

#define EMPTY_EVENT (QUEUE_EVENT) {NO_EVENT, NULL}

#define NO_RETRIES_LEFT        0

typedef enum {
    NO_EVENT                = 0,

    // I2C Async Transfer
    I2C_SIG_TRANSFER_SUCCESS,
    I2C_SIG_TRANSFER_FAIL,
    I2C_SIG_TRANSFER_TIMEOUT,
    I2C_SIG_TRANSFER_MAX_RETRIES,

    // Flash memory
    FLASH_ERASE_BOOT_SECTOR,
    FLASH_ERASE_BOOT_SECTOR_SUCCESS,
    FLASH_ERASE_BOOT_SECTOR_ERROR,
    FLASH_WRITE_BOOT_SECTOR,
    FLASH_WRITE_BOOT_SECTOR_SUCCESS,
    FLASH_WRITE_BOOT_SECTOR_ERROR,

    // Environment sensor
    SHT3X_SIG_READ_STATUS,
    SHT3X_SIG_MEASURE,
    SHT3X_SIG_READ_MEASURE,
    SHT3X_SIG_ERROR

    // Shock sensor

    // NFC
} QUEUE_EVENT_SIG;

typedef struct {
    QUEUE_EVENT_SIG const sig;
    void *const payload;
} QUEUE_EVENT;

bool EVENT_eventcmp(QUEUE_EVENT *e1, QUEUE_EVENT *e2);

// debug
void EVENT_print(QUEUE_EVENT *event);

#ifdef	__cplusplus
}
#endif

#endif	/* EVENT_H */

