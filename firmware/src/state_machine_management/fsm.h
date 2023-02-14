/*
 * File:   fsm.h
 * Author: apolisskyi
 *
 * Created on February 7, 2023, 1:00 AM
 */

#ifndef FSM_H
#define	FSM_H

#include <stdint.h>

#include "./event/event.h"
#include "./queue/queue.h"

#ifdef	__cplusplus
}
#endif

typedef struct {
    uint8_t state;
    EVENTS_QUEUE queue;
} SUPER_ACT_OBJ;

// state handler f
typedef uint8_t (STATE_HANDLE_F)(SUPER_ACT_OBJ *me, QUEUE_EVENT event);

typedef struct {
    uint8_t STATES_MAX;
    uint8_t EVENTS_MAX;
    QUEUE_EVENT_SIG particularEventsSigs[];
} TRANSITION_TABLE_DESCRIPTION;

void FSM_ProcessEventToNextState(SUPER_ACT_OBJ *me, QUEUE_EVENT event, TRANSITION_TABLE_DESCRIPTION tableDescription, STATE_HANDLE_F *transitionTable[tableDescription.STATES_MAX][tableDescription.EVENTS_MAX]);

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event);

#endif	/* FSM_H */
