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
extern GLOBAL_QUEUE_EVENT globalQueueObj;

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

MEMORY_APP_DATA memoryAppObj = {
        .state = MEMORY_APP_STATE_INIT,
        .drvMemoryHandle = (DRV_HANDLE)NULL,
        .pagesToProcessAmount = 0,
        .startPage = 0,
        .writeBuffer = NULL
};
extern GLOBAL_QUEUE_OBJECT globalEventsQueueObj;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

void eraseWriteTransferHandler(DRV_MEMORY_EVENT event, DRV_MEMORY_COMMAND_HANDLE commandHandle, uintptr_t context);

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
    void MEMORY_APP_Initialize ( void )

  Remarks:
    See prototype in memory_app.h.
 */

void MEMORY_APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    memoryAppObj.state = MEMORY_APP_STATE_INIT;

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
    switch ( memoryAppObj.state )
    {

        /* Application's initial state. */
        case MEMORY_APP_STATE_INIT:
        {
            // TODO remove it to main


            bool appInitialized = true;


            if (appInitialized)
            {
                memoryAppObj.state = MEMORY_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT;
            }

            return;
        }

        case MEMORY_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT: {
            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == FLASH_ERASE_WRITE_BOOT_SECTOR) {
                // open driver
                memoryAppObj.drvMemoryHandle = DRV_MEMORY_Open(sysObj.drvMemory0, DRV_IO_INTENT_READWRITE| DRV_IO_INTENT_NONBLOCKING);
                // TODO get this values from flash Geometry
                // set write flash boot sector geometry
                memoryAppObj.pagesToProcessAmount = FLASH_MEMORY_BOOT_SECTOR_SIZE / DRV_AT25DF_PAGE_SIZE;
                // set write flash boot sector source
                memoryAppObj.writeBuffer = (void *)diskImage;

                memoryAppObj.state = MEMORY_APP_STATE_ERASE_WRITE_BLOCK;
            }

            if (globalQueuePeekEvent(&globalEventsQueueObj)->type == FLASH_WRITE_BOOT_SECTOR_SUCCESS
            || globalQueuePeekEvent(&globalEventsQueueObj)->type == FLASH_WRITE_BOOT_SECTOR_ERROR) {
                // close memory driver for further use in USB MSD
                DRV_MEMORY_Close(memoryAppObj.drvMemoryHandle);
            }

            return;
        }
        case MEMORY_APP_STATE_READ_BLOCK: { return; }
        case MEMORY_APP_STATE_WRITE_BLOCK: { return; }
        case MEMORY_APP_STATE_ERASE_BLOCK: { return; }
        case MEMORY_APP_STATE_ERASE_WRITE_BLOCK: {
            DRV_MEMORY_TransferHandlerSet(memoryAppObj.drvMemoryHandle, eraseWriteTransferHandler, (uintptr_t)NULL);
            DRV_MEMORY_AsyncEraseWrite(memoryAppObj.drvMemoryHandle, NULL/*&commandHandle*/, memoryAppObj.writeBuffer, memoryAppObj.startPage, memoryAppObj.pagesToProcessAmount);

            memoryAppObj.state = MEMORY_APP_STATE_WAIT_GLOBAL_QUEUE_EVENT;
            return;
        }


        /*
         * TODO
         * DRV_MEMORY_Close(memory_appData.drvMemoryHandle);
         */
    }
}

void eraseWriteTransferHandler(DRV_MEMORY_EVENT event, DRV_MEMORY_COMMAND_HANDLE commandHandle, uintptr_t context) {
    // event handled
    globalQueueDequeueEvent(&globalEventsQueueObj);

    switch(event)
    {
        case DRV_MEMORY_EVENT_COMMAND_COMPLETE:
        {
            GLOBAL_QUEUE_EVENT bootSectorWriteSuccess = {
                    .type = FLASH_WRITE_BOOT_SECTOR_SUCCESS,
                    .payload = {}
            };

            globalQueueEnqueueEvent(&globalEventsQueueObj, &bootSectorWriteSuccess);
            break;
        }

        case DRV_MEMORY_EVENT_COMMAND_ERROR:
        {
            GLOBAL_QUEUE_EVENT bootSectorWriteError = {
                    .type = FLASH_WRITE_BOOT_SECTOR_ERROR,
                    .payload = {}
            };

            globalQueueEnqueueEvent(&globalEventsQueueObj, &bootSectorWriteError);

            SYS_DEBUG_PRINT(SYS_ERROR_ERROR, "%s\r\n", "Something goes wrong with writing flash boot sector attempt");

            break;
        }
    }

    // clean memory object
    memoryAppObj.pagesToProcessAmount = 0;
    memoryAppObj.startPage = 0;
    memoryAppObj.writeBuffer = NULL;
};

/*******************************************************************************
 End of File
 */
