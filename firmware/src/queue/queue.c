#include "./queue.h"

bool eventcmp(QUEUE_EVENT *e1, QUEUE_EVENT *e2) {
  return e1->type == e2->type 
    && e1->payload == e2->payload // compare first chars to prevent passing NULL & !NULL to strcmp
    && !strcmp(e1->payload, e2->payload);
}

void enqueueEvent(EVENTS_QUEUE *queue, QUEUE_EVENT *newEvent) {
  if (queue->size > QUEUE_MAX_SIZE) {
    printf("%s\r\n", "Trying to enqueue to a full global queue!");
    return;
  };

  uint8_t newEventPosition = queue->size;
  memcpy(&queue->events[newEventPosition], newEvent, sizeof(QUEUE_EVENT));
  queue->size++;
}

QUEUE_EVENT denqueueEvent(EVENTS_QUEUE *queue) {
  if (queue->size == 0) {
    printf("%s\r\n", "Trying to dequeue empty queue!");
    return;
  }
  uint8_t tailPos = queue->size - 1;
  uint8_t reducedSize = queue->size - 1;
  QUEUE_EVENT prevHead = queue->head;

  // copy elements with -1 shift
  memcpy(queue->events, queue->events + 1, reducedSize * sizeof(QUEUE_EVENT));

  // empty tail
  memcpy(queue->events + tailPos, &(QUEUE_EVENT){0, NULL}, sizeof(QUEUE_EVENT));

  queue->size--;
  return prevHead;
}

// debug
void printEvent(QUEUE_EVENT *event) {
  printf("type: %d, payload: %s", event->type, (char *)event->payload);
}
void printQueue(EVENTS_QUEUE *queue) {
  printf("size: %d, head: ", (uint32_t)queue->size);
  printEvent(&queue->head);
  printf("\r\n");

  for (int i = 0; i < queue->size; i++) {
    printEvent(&queue->events[i]);
    printf("\r\n");
  }
  printf("\r\n");
};
