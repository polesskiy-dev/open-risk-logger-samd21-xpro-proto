#ifndef GLOBAL_DEFS_H
#define GLOBAL_DEFS_H

// retries related
#define NO_RETRIES_LEFT                 (0)
#define MAX_RETRIES                     (1)

// global active objects IDs
typedef enum {
    NO_ID,
    SHT3X_AO_ID,
    NFC_AO_ID,
    ACTIVE_OBJECTS_MAX
} GLOBAL_ACTIVE_OBJECT_IDS;

#endif //GLOBAL_DEFS_H
