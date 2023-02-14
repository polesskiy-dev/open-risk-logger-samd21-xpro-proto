/*
 * File:   app.h
 * Author: apolisskyi
 *
 * Created on February 14, 2023, 3:00 AM
 */

#ifndef APP_H
#define APP_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>

#include "./sht3x_actor/sht3x_actor.h"
#include "./nfc_actor/nfc_actor.h"

#ifdef	__cplusplus
extern "C" {
#endif

typedef struct {
    SHT3X_ACT_OBJ *sht3x;
    NFC_ACT_OBJ *nfc;
} APP_ACTORS;

#ifdef	__cplusplus
}
#endif

#endif //APP_H
