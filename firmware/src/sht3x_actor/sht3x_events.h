/**
* @file sht3x_events.h 
* @author apolisskyi
* @date 16.02.2023
*/

#ifndef SHT3X_EVENTS_H
#define SHT3X_EVENTS_H

#ifdef    __cplusplus
extern "C" {
#endif

typedef enum {
    SHT3X_TRANSFER_SUCCESS = 1,
    SHT3X_TRANSFER_FAIL,
    SHT3X_READ_STATUS,
    SHT3X_MEASURE,
    SHT3X_READ_MEASURE,
    SHT3X_ERROR,
    SHT3X_SIG_I_MAX,
} SHT3X_EVENT_SIG;

#ifdef    __cplusplus
}
#endif

#endif    /* SHT3X_EVENTS_H */
