/* ************************************************************************** */
/** Descriptive File Name

  @Company
    apolisskyi

  @File Name
    queue.c

  @Summary
    Global events queue implementation
 
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include "queue.h"


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

GLOBAL_QUEUE_OBJECT globalQueue = {{}, 0};


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

void globalQueueEnqueue(GLOBAL_QUEUE_OBJECT *globalQueue, GLOBAL_QUEUE_EVENT *event) {
    if (globalQueue->size >= GLOBAL_QUEUE_SIZE) {
        SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "Trying to enqueue to full global queue!");
        return;
    }

    globalQueue->elements[globalQueue->size].type = event->type;
    memcpy(globalQueue->elements[globalQueue->size].payload, event->payload,
           GLOBAL_QUEUE_EVENT_PAYLOAD_SIZE * sizeof(event->payload[0]));

    globalQueue->size++;
}
    
void globalQueueDequeue(GLOBAL_QUEUE_OBJECT *globalQueue) {
    if (globalQueue->size == 0) {
        SYS_DEBUG_PRINT(SYS_ERROR_WARNING, "%s\r\n", "Trying to dequeue empty queue!");
        return;
    }

    // shift elements for one GLOBAL_QUEUE_EVENT size
    memcpy(globalQueue->elements, globalQueue->elements + 1,
           (globalQueue->size - 1) * sizeof(GLOBAL_QUEUE_EVENT));
    memcpy(&globalQueue->elements[globalQueue->size - 1],
           &(GLOBAL_QUEUE_EVENT){0, ""}, sizeof(GLOBAL_QUEUE_EVENT));

    globalQueue->size--;
}
    
GLOBAL_QUEUE_EVENT *globalQueuePeek(GLOBAL_QUEUE_OBJECT *globalQueue){
    return &(globalQueue->elements[0]);
}

void debugPrintQueue(GLOBAL_QUEUE_OBJECT *globalQueue) {
    SYS_DEBUG_PRINT(SYS_ERROR_INFO, "Global queue: \r\n size: %d\r\n", (int)globalQueue->size);
    for (int i = 0; i < globalQueue->size; i++) {
        SYS_DEBUG_PRINT(SYS_ERROR_INFO, "position: %d, type: %d, payload: %s \r\n", i,
               globalQueue->elements[i].type, globalQueue->elements[i].payload);
    }
    SYS_DEBUG_PRINT(SYS_ERROR_INFO, "%s", "\r\n");
};

/* *****************************************************************************
 End of File
 */
