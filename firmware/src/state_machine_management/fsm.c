#include "fsm.h"

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event) {
    QUEUE_pushEvent(queue, event);
};

void FSM_ProcessEventToNextState(
        SUPER_ACT_OBJ *me,
        QUEUE_EVENT event,
        TRANSITION_TABLE_DESCRIPTION tableDescription,
        STATE_HANDLE_F * const transitionTable[tableDescription.STATES_MAX][tableDescription.EVENTS_MAX]
) {
    uint8_t prevState = me->state;
    uint8_t eventLookupIndex = event.sig;
    STATE_HANDLE_F *nextStateHandler = transitionTable[prevState][eventLookupIndex];

    // if no handler for queue event just ignore event
    if (NULL == nextStateHandler) return;

    uint8_t nextState = (*nextStateHandler)(me, event);
    me->state = nextState;
};
