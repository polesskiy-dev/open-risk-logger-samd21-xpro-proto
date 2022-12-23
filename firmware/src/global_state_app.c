/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    global_state_app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "global_state_app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
extern GLOBAL_QUEUE_OBJECT globalEventsQueueObj;

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the GLOBAL_STATE_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

GLOBAL_STATE_APP_DATA global_state_appData;

GLOBAL_STATE globalStateObj = {
//        .isFlashBootSectorWritten = false
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void GLOBAL_STATE_APP_Initialize ( void )

  Remarks:
    See prototype in global_state_app.h.
 */

void GLOBAL_STATE_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    global_state_appData.state = GLOBAL_STATE_APP_STATE_INIT;
}


/******************************************************************************
  Function:
    void GLOBAL_STATE_APP_Tasks ( void )

  Remarks:
    See prototype in global_state_app.h.
 */

void GLOBAL_STATE_APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( global_state_appData.state )
    {
        /* Application's initial state. */
        case GLOBAL_STATE_APP_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {
//                global_state_appData.state = GLOBAL_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT;
            }
            break;
        }

        /* The default state should never be executed. */
        default:
        {
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */
