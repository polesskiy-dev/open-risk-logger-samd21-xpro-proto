/**
* @file global_mediator.c 
* @author apolisskyi
* @date 19.02.2023
*/

#include "global_mediator.h"

GLOBAL_MEDIATOR_OBJ globalMediatorObj;

static void GLOBAL_MEDIATOR_Ctor(void) {
    globalMediatorObj.nfc = nfcActObj;
    globalMediatorObj.sht3x = sht3XActObj;
}

void GLOBAL_MEDIATOR_Initialize(void) {
    GLOBAL_MEDIATOR_Ctor();
}

void GLOBAL_MEDIATOR_Tasks(void) {
    
}
