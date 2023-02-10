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

void FSM_NextStateTransition(uint32_t *currState, uint32_t nextState);

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event);

#endif	/* FSM_H */
