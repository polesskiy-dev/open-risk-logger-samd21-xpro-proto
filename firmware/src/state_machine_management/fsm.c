#include "fsm.h"

void FSM_NextStateTransition(uint32_t *currState, uint32_t nextState) {
    *currState = nextState;
};

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event) {
    QUEUE_pushEvent(queue, event);
};
