/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    usb_app.c

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

#include "usb_app.h"

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
    This structure should be initialized by the USB_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

USB_APP_DATA usb_appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

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
    void USB_APP_Initialize ( void )

  Remarks:
    See prototype in usb_app.h.
 */

void USB_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    usb_appData.state = USB_APP_STATE_INIT;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
    
    // TODO temporary hello world
//    SYS_TIME_CallbackRegisterMS(sendHelloWorldMessage, (uintptr_t)0, 1000, SYS_TIME_PERIODIC);
}


/******************************************************************************
  Function:
    void USB_APP_Tasks ( void )

  Remarks:
    See prototype in usb_app.h.
 */

void USB_APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( usb_appData.state )
    {
        /* Application's initial state. */
        case USB_APP_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {
                SYS_DEBUG_PRINT(SYS_ERROR_INFO, "USB APP started\r\n");
                usb_appData.state = USB_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT;
            }
            break;
        }

        case USB_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT:
        {
            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == FLASH_ERASE_WRITE_BOOT_SECTOR_SUCCESS) {
                globalQueueDequeueEvent(&globalEventsQueueObj);
                usb_appData.state = USB_APP_STATE_SERVICE_TASKS;
            } else if (globalQueuePeekEvent(&globalEventsQueueObj)->type == FLASH_ERASE_WRITE_BOOT_SECTOR_ERROR) {
                SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s \r\n", "Flash boot sector erase/write error event!");
                __conditional_software_breakpoint(false);
                usb_appData.state = USB_APP_STATE_SERVICE_TASKS;
            }

            break;
        }

        case USB_APP_STATE_SERVICE_TASKS:
        {
            /* Maintain Middleware & Other Libraries */
            /* USB Device layer tasks routine */
            USB_DEVICE_Tasks(sysObj.usbDevObject0);

            /* USB FS Driver Task Routine */
            DRV_USBFSV1_Tasks(sysObj.drvUSBFSV1Object);
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
