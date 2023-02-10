#include "./event.h"

// debug
void EVENT_print(QUEUE_EVENT *event) {
    printf("type: %d, payload: %s", event->sig, (char *) event->payload);
}

bool EVENT_eventcmp(QUEUE_EVENT *e1, QUEUE_EVENT *e2) {
    return e1->sig == e2->sig
           && e1->payload == e2->payload // compare first chars to prevent passing NULL & !NULL to strcmp
           && !strcmp(e1->payload, e2->payload);
}