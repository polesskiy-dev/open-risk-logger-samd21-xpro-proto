#include "queue.h"

EVENTS_QUEUE QUEUE_Ctor() {
    EVENTS_QUEUE newQueue = {};
    return newQueue;
};

bool QUEUE_isEmpty(EVENTS_QUEUE *queue) {
    return queue->size == 0;
};

bool QUEUE_isFull(EVENTS_QUEUE *queue) {
    return queue->size >= QUEUE_MAX_SIZE;
}

void QUEUE_pushEvent(EVENTS_QUEUE *queue, QUEUE_EVENT newEvent) {
    if (QUEUE_isFull(queue)) {
        SYS_ASSERT(false, "__FILE__: Trying push to a full queue!");
        return;
    };

    memcpy(&(queue->events[queue->size]), &newEvent, sizeof(QUEUE_EVENT));
    queue->size++;
}

void QUEUE_shiftEvent(EVENTS_QUEUE *queue, QUEUE_EVENT newEvent) {
    if (QUEUE_isFull(queue)) {
        SYS_ASSERT(false, "__FILE__:  Trying shift to a full queue!");
        return;
    };

    // copy elements with +1 shift
    memcpy(queue->events + 1, queue->events, queue->size * sizeof(QUEUE_EVENT));

    // shift new event to head
    memcpy(&queue->head, &newEvent, sizeof(QUEUE_EVENT));

    queue->size++;
}

QUEUE_EVENT QUEUE_unshiftEvent(EVENTS_QUEUE *queue) {
    if (QUEUE_isEmpty(queue)) {
        SYS_ASSERT(false, "__FILE__: Trying to dequeue an empty queue!");
        return EMPTY_EVENT;
    }
    uint8_t tailPos = queue->size - 1;
    uint8_t reducedSize = queue->size - 1;
    QUEUE_EVENT prevHead = queue->head;

    // copy elements with -1 shift
    memcpy(queue->events, queue->events + 1, reducedSize * sizeof(QUEUE_EVENT));

    // empty tail
    memcpy(queue->events + tailPos, &EMPTY_EVENT, sizeof(QUEUE_EVENT));

    queue->size--;
    return prevHead;
}

// debug
//void QUEUE_printQueue(EVENTS_QUEUE *queue) {
//    printf("size: %d, head: ", queue->size);
//    EVENT_print(&queue->head);
//    printf("\r\n");
//
//    for (int i = 0; i < queue->size; i++) {
//        EVENT_print(&queue->events[i]);
//        printf("\r\n");
//    }
//    printf("\r\n");
//};
