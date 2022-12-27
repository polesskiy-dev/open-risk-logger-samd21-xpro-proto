/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    sht3x_temp_app.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "SHT3X_TEMP_APP_Initialize" and "SHT3X_TEMP_APP_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "SHT3X_TEMP_APP_STATES" definition).  Both
    are defined here for convenience.
    
    based on https://github.com/Sensirion/embedded-sht/
*******************************************************************************/

#ifndef _SHT3X_TEMP_APP_H
#define _SHT3X_TEMP_APP_H

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
#include "./config/default/bsp/bsp.h"
#include "./config/default/system/debug/sys_debug.h"
#include "./config/default/driver/driver_common.h"

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
    
#define SHT3X_I2C_ADDR_DFLT     0x44
    
#define STATUS_OK 0
#define STATUS_ERR_BAD_DATA (-1)
#define STATUS_CRC_FAIL (-2)
#define STATUS_UNKNOWN_DEVICE (-3)
#define STATUS_ERR_INVALID_PARAMS (-4)
#define SHT3X_MEASUREMENT_DURATION_USEC 15000
    
/* status word macros */
#define SHT3X_IS_ALRT_PENDING(status) (((status)&0x8000U) != 0U)
#define SHT3X_IS_ALRT_RH_TRACK(status) (((status)&0x0800) != 0U)
#define SHT3X_IS_ALRT_T_TRACK(status) (((status)&0x0400U) != 0U)
#define SHT3X_IS_SYSTEM_RST_DETECT(status) (((status)&0x0010U) != 0U)
#define SHT3X_IS_LAST_CRC_FAIL(status) (((status)&0x0001U) != 0U)

#define SHT3X_CMD_SIZE              2
#define SHT3X_STATUS_SIZE           2
#define SHT3X_MEASUREMENTS_SIZE     6
    
#define SHT3X_MEASURE_TIME_MS       15     

/**
 * @brief SHT3x measurment mode options (Low, Medium and High rerefresh rates)
 */
typedef enum _sht3x_measurement_mode {
    SHT3X_MEAS_MODE_LPM, /*low power mode*/
    SHT3X_MEAS_MODE_MPM, /*medium power mode*/
    SHT3X_MEAS_MODE_HPM  /*high power mode*/
} sht3x_measurement_mode_t;

/**
 * @brief SHT3x Alert Thresholds
 */
typedef enum _sht3x_alert_thd {
    SHT3X_HIALRT_SET,
    SHT3X_HIALRT_CLR,
    SHT3X_LOALRT_CLR,
    SHT3X_LOALRT_SET,
} sht3x_alert_thd_t;    

    

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
    SHT3X_TEMP_APP_STATE_INIT=0,
    SHT3X_TEMP_APP_WAIT_GLOBAL_QUEUE_EVENT,

    SHT3X_TEMP_APP_STATUS_READ,
    SHT3X_TEMP_APP_MEASURE,
    SHT3X_TEMP_APP_READ_MEASUREMENTS,

    SHT3X_TEMP_APP_STATE_ERROR,
} SHT3X_TEMP_APP_STATES;


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
    SHT3X_TEMP_APP_STATES state;

    DRV_HANDLE drvI2CHandle;
    uint16_t status;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    uint8_t lastMeasurements[SHT3X_MEASUREMENTS_SIZE];

} SHT3X_TEMP_APP_DATA;

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
    void SHT3X_TEMP_APP_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    SHT3X_TEMP_APP_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    SHT3X_TEMP_APP_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void SHT3X_TEMP_APP_Initialize ( void );


/*******************************************************************************
  Function:
    void SHT3X_TEMP_APP_Tasks ( void )

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
    SHT3X_TEMP_APP_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void SHT3X_TEMP_APP_Tasks( void );



/**
 * @brief Reads out the results of a measurement that was previously started by
 * sht3x_measure(). If the measurement is still in progress, this function
 * returns an error.
 * Temperature is returned in [degree Celsius], multiplied by 1000,
 * and relative humidity in [percent relative humidity], multiplied by 1000.
 */
void sht3xReadMeasurements();

/**
 * @brief get temperature from raw sensor data
 * Temperature = 175 * S_T / 2^16 - 45
 * 
 * @return t in C
 */
float sht3xGetLastTemperatureC();

/**
 * @brief get relative humidity from raw sensor data
 * Humidity = * 100 * S_RH / 2^16
 * 
 * @return h in %
 */
int32_t sht3xGetLastRelativeHumidityP();

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _SHT3X_TEMP_APP_H */

/*******************************************************************************
 End of File
 */

