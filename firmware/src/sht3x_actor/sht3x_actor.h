/*
 * File:   sht3x_actor.h
 * Author: apolisskyi
 *
 * Created on February 2, 2023, 3:06 AM
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


#ifdef	__cplusplus
extern "C" {
#endif

#define SHT3X_I2C_ADDR_DFLT     0x44

#define SHT3X_CMD_SIZE              2
#define SHT3X_STATUS_REG_SIZE       2
#define SHT3X_MEASUREMENTS_SIZE     6

#define SHT3X_MEASURE_TIME_MS       15

typedef enum {
    SHT3X_ST_INIT = 0,
    SHT3X_ST_IDLE,
    SHT3X_ST_READ_STATUS,
    SHT3X_ST_MEASURE,
    SHT3X_ST_READ_MEASURE,
    SHT3X_ST_ERROR,
    SHT3X_STATES_MAX
} SHT3X_STATE;

enum QUEUE_EVENT_SIG_LOOKUP_INDEX {
    TRANSFER_SUCCESS = 0,
    TRANSFER_FAIL,
    I2C_SIG_TRANSFER_MAX_RETRIES_I,
    READ_STATUS,
    MEASURE,
    READ_MEASURE,
    ERROR,
    SHT3X_SIG_I_MAX,
};

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

// traverse through the state
typedef SHT3X_STATE (SHT3X_STATE_HANDLE_F)(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

void SHT3X_ACT_Initialize(void);
void SHT3X_ACT_Tasks(void);

void SHT3X_ACT_Dispatch(QUEUE_EVENT event);
void SHT3X_ACT_HandleQueuedEvent(QUEUE_EVENT event);

void SHT3X_ACT_ProcessEventToNextState(SHT3X_ACT_OBJ *me, QUEUE_EVENT event);

// common I2C transfer handler
void SHT3X_ACT_TransferEventHandler(DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context);


#ifdef	__cplusplus
}
#endif

#endif	/* SHT3X_ACTOR_H */