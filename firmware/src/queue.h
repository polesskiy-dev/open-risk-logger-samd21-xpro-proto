/* ************************************************************************** */
/** Descriptive File Name

  @Company
    apolisskyi

  @File Name
    queue.h

  @Summary
    Global events queue

 */
/* ************************************************************************** */

#ifndef _QUEUE_H    /* Guard against multiple inclusion */
#define _QUEUE_H

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "./config/default/definitions.h"
#include "./config/default/configuration.h"
#include "./config/default/system/debug/sys_debug.h"
#include "./config/default/system/system_module.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


    /* ************************************************************************** */
    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */
    /* ************************************************************************** */


#define GLOBAL_QUEUE_SIZE                   8
#define GLOBAL_QUEUE_EVENT_PAYLOAD_SIZE     32


    // *****************************************************************************
    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************
    // *****************************************************************************
    // *****************************************************************************
    typedef uint8_t GLOBAL_QUEUE_EVENT_PAYLOAD[GLOBAL_QUEUE_EVENT_PAYLOAD_SIZE];

    typedef enum {
        // spi flash
        FLASH_ERASE_WRITE_BOOT_SECTOR = 1,
        FLASH_ERASE_WRITE_BOOT_SECTOR_SUCCESS,
        FLASH_ERASE_WRITE_BOOT_SECTOR_ERROR,

        // sht3x temperature sensor
        SHT3X_TEMP_READ_STATUS,
        SHT3X_TEMP_READ_STATUS_SUCCESS,
        SHT3X_TEMP_MEASURE,
        SHT3X_TEMP_MEASURE_SUCCESS,
        SHT3X_TEMP_READ_MEASUREMENTS,
        SHT3X_TEMP_READ_MEASUREMENTS_SUCCESS,

        // NFC
        NFC_READ_UID,
        NFC_READ_UID_SUCCESS,
        NFC_PREPARE_MAILBOX,
        NFC_PREPARE_MAILBOX_SUCCESS,
        NFC_WRITE_MAILBOX,
        NFC_WRITE_MAILBOX_SUCCESS
    } GLOBAL_QUEUE_EVENT_TYPE;
    
    typedef struct {
        GLOBAL_QUEUE_EVENT_TYPE type;
        GLOBAL_QUEUE_EVENT_PAYLOAD payload;
    } GLOBAL_QUEUE_EVENT;
    
    typedef struct {
        GLOBAL_QUEUE_EVENT elements[GLOBAL_QUEUE_SIZE];
        ssize_t size;
    } GLOBAL_QUEUE_OBJECT;
    
    // *****************************************************************************
    // *****************************************************************************
    // Section: Interface Functions
    // *****************************************************************************
    // *****************************************************************************

    /**
     * Init global queue
     * @return SYS_MODULE_OBJ globalQueueObj
     */
    SYS_MODULE_OBJ GLOBAL_QUEUE_Initialize();
    
    /**
     * Add event to head
     * @param[out] globalQueue
     * @param[in] event
     */
    void globalQueueEnqueueEvent(GLOBAL_QUEUE_OBJECT *globalQueue, GLOBAL_QUEUE_EVENT *event);

    /**
     * Remove event from head
     * Violating queue ADT convention to simplify event->payload buffer handle,
     * just invoke globalQueuePeekEvent first
     * @param[out] globalQueue
     */
    void globalQueueDequeueEvent(GLOBAL_QUEUE_OBJECT *globalQueue);
    
    /**
     * Get head event
     * @param[out] globalQueue
     * @return GLOBAL_QUEUE_EVENT *event
     */
    GLOBAL_QUEUE_EVENT *globalQueuePeekEvent(GLOBAL_QUEUE_OBJECT *globalQueue);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
