/* 
 * File:   queue.h
 * Author: apolisskyi
 *
 * Created on February 2, 2023, 3:06 AM
 */

#ifndef QUEUE_H
#define	QUEUE_H

#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "config/default/definitions.h"
#include "../event/event.h"

#ifdef	__cplusplus
extern "C" {
#endif
    
#define QUEUE_MAX_SIZE 8

typedef struct {
  union {
    QUEUE_EVENT head;
    QUEUE_EVENT events[QUEUE_MAX_SIZE];
  };
  ssize_t size;
} EVENTS_QUEUE;

EVENTS_QUEUE QUEUE_Ctor();
void QUEUE_pushEvent(EVENTS_QUEUE *queue, QUEUE_EVENT newEvent);
void QUEUE_shiftEvent(EVENTS_QUEUE *queue, QUEUE_EVENT newEvent);
QUEUE_EVENT QUEUE_unshiftEvent(EVENTS_QUEUE *queue);

bool QUEUE_isEmpty(EVENTS_QUEUE *queue);
bool QUEUE_isFull(EVENTS_QUEUE *queue);

// debug
//void QUEUE_printQueue(EVENTS_QUEUE *queue);

#ifdef	__cplusplus
}
#endif

#endif	/* QUEUE_H */

