#include "fsm.h"

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event) {
    QUEUE_pushEvent(queue, event);
};
