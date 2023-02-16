/**
 * @file    fsm.h
 * @author  apolisskyi
 * @date February 7, 2023
 */

#ifndef FSM_H
#define    FSM_H

#include <stdint.h>

#include "../config/default/system/system_common.h"
#include "./event/event.h"
#include "./queue/queue.h"

#ifdef    __cplusplus
}
#endif

/**
 * @brief Base Actor object
 * @param state - contains current state
 * @param queue - events queue
 */
typedef struct {
    uint8_t state;
    EVENTS_QUEUE queue;
} SUPER_ACT_OBJ;

/**
 * @brief State handler function type
 */
typedef uint8_t (STATE_HANDLE_F)(SUPER_ACT_OBJ *me, QUEUE_EVENT event);

typedef struct {
    uint8_t STATES_MAX;
    uint8_t EVENTS_MAX;
} TRANSITION_TABLE_DESCRIPTION;

/**
 * @brief Invoke state handler f from transitions table by current state and event: [state][event] => f(event)
 * @memberof SUPER_ACT_OBJ
 *
 * @param me[in,out] - actor object
 * @param event - new event
 * @param tableDescription - table dimensions
 * @param transitionTable - state handlers functions 2D array
 */
void FSM_ProcessEventToNextState(
        SUPER_ACT_OBJ *me,
        QUEUE_EVENT event,
        TRANSITION_TABLE_DESCRIPTION tableDescription,
        STATE_HANDLE_F * const transitionTable[tableDescription.STATES_MAX][tableDescription.EVENTS_MAX]);

/**
 * @brief Dispatch event to queue - add to front
 * @memberof SUPER_ACT_OBJ
 * @param queue[in,out]
 * @param event
 */
void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event);

#endif    /* FSM_H */
