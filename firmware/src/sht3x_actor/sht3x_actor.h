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

#define SHT3X_STATES_MAX     (SHT3X_ST_ERROR - SHT3X_ST_INIT + 1)
#define SHT3X_EVENTS_MAX     (SHT3X_SIG_ERROR - SHT3X_SIG_READ_STATUS + 1 + I2C_SIG_TRANSFER_FAIL - I2C_SIG_TRANSFER_SUCCESS + 1)

typedef enum {
    SHT3X_ST_INIT = 0,
    SHT3X_ST_IDLE,
    SHT3X_ST_READ_STATUS,
    SHT3X_ST_MEASURE,
    SHT3X_ST_READ_MEASURE,
    SHT3X_ST_ERROR
} SHT3X_STATE;

// lookup table for transitions - next state from current state and event signal
typedef SHT3X_STATE SHT3X_TRANSITIONS_TABLE[SHT3X_STATES_MAX][SHT3X_EVENTS_MAX];

typedef struct {
    QUEUE_EVENT_SIG (*signals)[SHT3X_EVENTS_MAX];
    SHT3X_TRANSITIONS_TABLE *table;
} SHT3X_NEXT_STATE_LOOKUP;

typedef struct SHT3X_ACT_OBJ {
    SHT3X_STATE state;
    EVENTS_QUEUE queue;
    SHT3X_NEXT_STATE_LOOKUP nextStateLookup;
    DRV_HANDLE drvI2CHandle;
    struct {
        uint16_t status;
    } sensorRegs;
} SHT3X_ACT_OBJ;

void SHT3X_ACT_Initialize(void);
void SHT3X_ACT_Tasks(void);

void SHT3X_ACT_Dispatch(QUEUE_EVENT event);
void SHT3X_ACT_HandleQueuedEvent(QUEUE_EVENT event);
void SHT3X_ACT_StateTransition(SHT3X_STATE state, QUEUE_EVENT event);

SHT3X_NEXT_STATE_LOOKUP SHT3X_ACT_NextStateLookupTableCtor(void);

// common I2C transfer handler
void SHT3X_ACT_TransferEventHandler(DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context);


#ifdef	__cplusplus
}
#endif

#endif	/* SHT3X_ACTOR_H */
