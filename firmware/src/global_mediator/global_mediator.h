/**
* @file global_mediator.h 
* @author apolisskyi
* @date 19.02.2023
*
* @bried Global mediator
*
* @details Observes every app actors object queues, redispatch appropriate events to appropriate actors
* TODO global mediator tends to be kind of God object, rethink how to split it
*/

#ifndef GLOBAL_MEDIATOR_H
#define GLOBAL_MEDIATOR_H

#include "../nfc_actor/nfc_actor.h"
#include "../nfc_actor/nfc_events.h"
#include "../sht3x_actor/sht3x_actor.h"
#include "../sht3x_actor/sht3x_events.h"

#ifdef    __cplusplus
extern "C" {
#endif

extern SHT3X_ACT_OBJ sht3XActObj;
extern NFC_ACT_OBJ nfcActObj;

typedef enum {
    GLOBAL_MEDIATOR_ST_INTI = 0
} GLOBAL_MEDIATOR_STATES;

typedef struct {
    SHT3X_ACT_OBJ sht3x;
    NFC_ACT_OBJ nfc;
} GLOBAL_MEDIATOR_OBJ;

/**
 * @brief Initialize and construct global mediator
 * @memberof SHT3X_ACT_OBJ
 */
void GLOBAL_MEDIATOR_Initialize(void);

/**
 * @brief Perform global mediator tasks, listen for events and process them
 * @memberof SHT3X_ACT_OBJ
 */
void GLOBAL_MEDIATOR_Tasks(void);

#ifdef    __cplusplus
}
#endif

#endif    /* GLOBAL_MEDIATOR_H */
