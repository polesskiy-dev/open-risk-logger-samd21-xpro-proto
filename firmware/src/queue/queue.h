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

#ifdef	__cplusplus
extern "C" {
#endif
    
#define QUEUE_MAX_SIZE 8

//typedef enum {
//  FLASH_ERASE_BOOT_SECTOR = 1,
//  FLASH_ERASE_BOOT_SECTOR_SUCCESS,
//  FLASH_ERASE_BOOT_SECTOR_ERROR,
//  FLASH_WRITE_BOOT_SECTOR,
//  FLASH_WRITE_BOOT_SECTOR_SUCCESS,
//  FLASH_WRITE_BOOT_SECTOR_ERROR,
//} QUEUE_EVENT_TYPE;

typedef struct {
  uint16_t const type;
  void *const payload;
} QUEUE_EVENT;

typedef struct {
  union {
    QUEUE_EVENT head;
    QUEUE_EVENT events[QUEUE_MAX_SIZE];
  };
  ssize_t size;
} EVENTS_QUEUE;

bool eventcmp(QUEUE_EVENT *e1, QUEUE_EVENT *e2);
void enqueueEvent(EVENTS_QUEUE *queue, QUEUE_EVENT *newEvent);
QUEUE_EVENT denqueueEvent(EVENTS_QUEUE *queue);

// debug
void printEvent(QUEUE_EVENT *event);
void printQueue(EVENTS_QUEUE *queue);

#ifdef	__cplusplus
}
#endif

#endif	/* QUEUE_H */

