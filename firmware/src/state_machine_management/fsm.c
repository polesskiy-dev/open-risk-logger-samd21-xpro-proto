#include "fsm.h"

static uint8_t getEventIndex(QUEUE_EVENT_SIG particularEventsSigs[], QUEUE_EVENT targetEvent) {
    uint8_t signalI = 0;
    while (particularEventsSigs[signalI] != targetEvent.sig) signalI++;

    return signalI;
};

void FSM_Dispatch(EVENTS_QUEUE *queue, QUEUE_EVENT event) {
    QUEUE_pushEvent(queue, event);
};

void FSM_ProcessEventToNextState(SUPER_ACT_OBJ *me, QUEUE_EVENT event, TRANSITION_TABLE_DESCRIPTION tableDescription, STATE_HANDLE_F *transitionTable[tableDescription.STATES_MAX][tableDescription.EVENTS_MAX]) {
    uint8_t prevState = me->state;
    uint8_t eventLookupIndex = getEventIndex(tableDescription.particularEventsSigs, event);
    STATE_HANDLE_F *nextStateHandler = transitionTable[prevState][eventLookupIndex];

    // if no handler for queue event just ignore event
    if (NULL == nextStateHandler) return;

    uint8_t nextState = (*nextStateHandler)(me, event);
    me->state = nextState;
};
