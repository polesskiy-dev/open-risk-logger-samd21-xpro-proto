/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    memory_app.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "MEMORY_APP_Initialize" and "MEMORY_APP_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "MEMORY_APP_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _MEMORY_APP_H
#define _MEMORY_APP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "./config/default/definitions.h"
#include "./config/default/configuration.h"
#include "./config/default/system/debug/sys_debug.h"
#include "./config/default/driver/memory/drv_memory.h"
#include "./config/default/driver/driver_common.h"
#include "./diskImage.h"
#include "./queue.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************

// let's keep all file system related data in first erasable sector
#define FLASH_MEMORY_BOOT_SECTOR_SIZE DRV_AT25DF_ERASE_BUFFER_SIZE

// *****************************************************************************
/* Application states

  Summary:
    Application states enumeration

  Description:
    This enumeration defines the valid application states.  These states
    determine the behavior of the application at various times.
*/

typedef enum
{
    /* Application's state machine's initial state. */
    MEMORY_APP_STATE_INIT=0,

    MEMORY_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT,

    MEMORY_APP_STATE_READ_BLOCK,
    MEMORY_APP_STATE_WRITE_BLOCK,
    MEMORY_APP_STATE_ERASE_BLOCK,
    MEMORY_APP_STATE_ERASE_WRITE_BLOCK,
} MEMORY_APP_STATES;


// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */

typedef struct
{
    /* The application's current state */
    MEMORY_APP_STATES state;
    DRV_HANDLE drvMemoryHandle;
    uint8_t pagesToProcessAmount;
    uint8_t startPage;
    uint8_t *writeBuffer;
} MEMORY_APP_DATA;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void MEMORY_APP_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    MEMORY_APP_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    MEMORY_APP_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void MEMORY_APP_Initialize ( void );


/*******************************************************************************
  Function:
    void MEMORY_APP_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    MEMORY_APP_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void MEMORY_APP_Tasks( void );

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _MEMORY_APP_H */

/*******************************************************************************
 End of File
 */

