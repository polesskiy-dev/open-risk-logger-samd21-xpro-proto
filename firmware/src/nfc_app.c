/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    nfc_app.c

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

#include "nfc_app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the NFC_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

NFC_APP_DATA nfc_appData = {
    .RFFieldPresence = false
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/**
 * A pulse is emitted on GPO, when RF field appears or disappears
 * @param context
 * @return 
 */
void handleRFFieldChangeInterrupt(uintptr_t context);

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void NFC_APP_Initialize ( void )

  Remarks:
    See prototype in nfc_app.h.
 */

void NFC_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    nfc_appData.state = NFC_APP_STATE_INIT;

    EIC_CallbackRegister(EIC_PIN_4, (EIC_CALLBACK)handleRFFieldChangeInterrupt, (uintptr_t)NULL);
}


/******************************************************************************
  Function:
    void NFC_APP_Tasks ( void )

  Remarks:
    See prototype in nfc_app.h.
 */

void NFC_APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( nfc_appData.state )
    {
        /* Application's initial state. */
        case NFC_APP_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {

                nfc_appData.state = NFC_APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case NFC_APP_STATE_SERVICE_TASKS:
        {

            break;
        }

        /* TODO: implement your application state machine.*/


        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

void handleRFFieldChangeInterrupt(uintptr_t context) {
    nfc_appData.RFFieldPresence = !nfc_appData.RFFieldPresence;
    SYS_DEBUG_PRINT(SYS_ERROR_INFO, "NFC RF field %i\r\n", nfc_appData.RFFieldPresence);
};


/*******************************************************************************
 End of File
 */
