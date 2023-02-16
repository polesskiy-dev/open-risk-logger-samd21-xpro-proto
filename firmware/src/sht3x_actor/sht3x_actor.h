/**
 * @file    sht3x_actor.h
 * @author  apolisskyi
 * @date February 2, 2023
 */

#ifndef SHT3X_ACTOR_H
#define	SHT3X_ACTOR_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>

#include "../config/default/configuration.h"
#include "../config/default/driver/driver_common.h"
#include "../config/default/definitions.h"
#include "../state_machine_management/fsm.h"
#include "./sht3x_events.h"

#ifdef	__cplusplus
extern "C" {
#endif

#define SHT3X_I2C_ADDR_DFLT     0x44

#define SHT3X_CMD_SIZE              2
#define SHT3X_STATUS_REG_SIZE       2
#define SHT3X_MEASUREMENTS_SIZE     6

#define SHT3X_MEASURE_TIME_MS       15

/**
 * @brief sht3x states
 */
typedef enum {
    SHT3X_ST_INIT = 0,
    SHT3X_ST_IDLE,
    SHT3X_ST_READ_STATUS,
    SHT3X_ST_MEASURE,
    SHT3X_ST_READ_MEASURE,
    SHT3X_ST_ERROR,
    SHT3X_STATES_MAX
} SHT3X_STATE;

/**
 * @brief sht3x environment sensor Actor
 * @extends SUPER_ACT_OBJ
 */
typedef struct SHT3X_ACT_OBJ {
    SHT3X_STATE state;
    EVENTS_QUEUE queue;
    DRV_HANDLE drvI2CHandle;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    struct {
        uint16_t status;
        uint8_t measurements[SHT3X_MEASUREMENTS_SIZE];
    } sensorRegs;
} SHT3X_ACT_OBJ;

/**
 * @brief State handler function type
 * @memberof SHT3X_ACT_OBJ
 */
typedef SHT3X_STATE (SHT3X_STATE_HANDLE_F)(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

/**
 * @brief Initialize and construct actor, should be called before tasks
 * @memberof SHT3X_ACT_OBJ
 */
void SHT3X_ACT_Initialize(void);

/**
 * @brief Perform Actor tasks, mainly listen for events and process them
 * @memberof SHT3X_ACT_OBJ
 */
void SHT3X_ACT_Tasks(void);

/**
 * @brief Dispatch event to SHT3X_ACT_OBJ queue
 * @memberof SHT3X_ACT_OBJ
 * @param event[in]
 */
void SHT3X_ACT_Dispatch(QUEUE_EVENT event);

/**
 * @brief Callback for I2C ISR on success/error transfer.
 *
 * Required by Harmony framework drivers approach.
 * On success/error transfer ISR should dispatch appropriate event to Actor's queue
 *
 * @see https://microchip-mplab-harmony.github.io/core/index.html?GUID-95F7ABE3-6864-4FC9-B11B-97B31ACF683C
 * @memberof SHT3X_ACT_OBJ
 * @param event[in]             transfer event
 * @param transferHandle[in]    marks appropriate Actor to associate callback with
 * @param context[in]           should be ptr to Actor, mostly unused
 */
void SHT3X_ACT_TransferEventHandler(DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context);


#ifdef	__cplusplus
}
#endif

#endif	/* SHT3X_ACTOR_H */
