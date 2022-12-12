/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    memory_app.c

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

#include "memory_app.h"

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
    This structure should be initialized by the MEMORY_APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

MEMORY_APP_DATA memory_appData;

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

//DRV_MEMORY_COMMAND_HANDLE memoryReadCommandHandle( 
void memoryReadCommandHandle( 
        DRV_MEMORY_EVENT event,
        DRV_MEMORY_COMMAND_HANDLE commandHandle,
        uintptr_t context
) {
    switch(event)
    {
        case DRV_MEMORY_EVENT_COMMAND_COMPLETE:
        {
            memory_appData.state = MEMORY_APP_STATE_READ_BLOCK_READY;
            break;
        }

        case DRV_MEMORY_EVENT_COMMAND_ERROR:
        {
            memory_appData.state = MEMORY_APP_STATE_IDLE;
            // Handle Error
            SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "Memory app DRV_MEMORY_COMMAND_HANDLE_INVALID");
            break;
        }

        default:
        {
            memory_appData.state = MEMORY_APP_STATE_IDLE;
            break;
        }
    }
};

void asyncMemoryRead(void) {

    // temporary
    uint32_t blockStart = 4 - memory_appData.blocksToReadAmount;

    DRV_MEMORY_TransferHandlerSet(memory_appData.drvMemoryHandle, memoryReadCommandHandle, (uintptr_t)NULL);

    DRV_MEMORY_AsyncRead(memory_appData.drvMemoryHandle, NULL/*&memoryReadCommandHandle*/, &memory_appData.memoryReadWriteBuffer, blockStart, 1);
    
    
    // TODO lift it up

}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void MEMORY_APP_Initialize ( void )

  Remarks:
    See prototype in memory_app.h.
 */

void MEMORY_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    memory_appData.state = MEMORY_APP_STATE_INIT;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void MEMORY_APP_Tasks ( void )

  Remarks:
    See prototype in memory_app.h.
 */

void MEMORY_APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( memory_appData.state )
    {
        /* Application's initial state. */
        case MEMORY_APP_STATE_INIT:
        {
            memory_appData.drvMemoryHandle = DRV_MEMORY_Open(sysObj.drvMemory0, DRV_IO_INTENT_READWRITE| DRV_IO_INTENT_NONBLOCKING);
            memory_appData.blocksToReadAmount = 4;
                    
            // TODO check handle to lett app be initialized
            bool appInitialized = true;


            if (appInitialized)
            {
                memory_appData.state = MEMORY_APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case MEMORY_APP_STATE_SERVICE_TASKS:
        {
            memory_appData.state = MEMORY_APP_STATE_READY_TO_READ_BLOCK;
            
            break;
        }
        
        case MEMORY_APP_STATE_READY_TO_READ_BLOCK:
        {
            if (memory_appData.blocksToReadAmount) {
                asyncMemoryRead();
            };
            memory_appData.state = MEMORY_APP_STATE_IDLE;
            
            break;
        }
        
        case MEMORY_APP_STATE_IDLE:
        {
            break;
        }
        
        case MEMORY_APP_STATE_READ_BLOCK_READY:
        {
            SYS_DEBUG_PRINT(SYS_ERROR_DEBUG, "Block: \r\n %s", memory_appData.memoryReadWriteBuffer);
            memory_appData.blocksToReadAmount--;
            
            memory_appData.state = MEMORY_APP_STATE_SERVICE_TASKS;
            
            break;
        }


        /* TODO: implement your application state machine.*/
        case MEMORY_APP_STATE_READY_TO_DEINIT:
        {
            
            DRV_MEMORY_Close(memory_appData.drvMemoryHandle);
            
            memory_appData.state = MEMORY_APP_STATE_DEINIT;
            break;
        }
        
        case MEMORY_APP_STATE_DEINIT:
        {
            break;
        }

        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */
