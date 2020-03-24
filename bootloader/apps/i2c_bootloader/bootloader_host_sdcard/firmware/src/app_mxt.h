/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    app_mxt.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_MXT_Initialize" and "APP_MXT_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_MXT_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _APP_MXT_H
#define _APP_MXT_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "configuration.h"

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
#define APP_MXT_MAX_MEM_PAGE_SIZE                           (64UL)
#define APP_MXT_PROTOCOL_HEADER_MAX_SIZE                    9
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
    APP_MXT_INIT=0,
    APP_MXT_FILE_OPEN,
    APP_MXT_WAIT_SWITCH_PRESS,
    APP_MXT_LOAD_I2C_SLAVE_DATA,
    /* Read MaxTouch Firmware */
    APP_MXT_INFO_SEND_READ_COMMAND,
    APP_MXT_INFO_WAIT_READ_COMMAND_TRANSFER_COMPLETE,
    APP_MXT_INFO_SEND_READ_BACK_COMMAND,
    APP_MXT_INFO_WAIT_READ_BACK_COMMAND_TRANSFER_COMPLETE,
    /* Unlock to program firmware */
    APP_MXT_UNLOCK_SEND_COMMAND,
    APP_MXT_UNLOCK_WAIT_COMMAND_TRANSFER_COMPLETE,
    APP_MXT_UNLOCK_SEND_READ_STATUS_COMMAND,
    APP_MXT_UNLOCK_WAIT_READ_STATUS_COMMAND_TRANSFER_COMPLETE,
    /* Programming MaxTouch firmware */
    APP_MXT_FW_SEND_WRITE_COMMAND,
    APP_MXT_FW_WAIT_WRITE_COMMAND_TRANSFER_COMPLETE,
    APP_MXT_FW_SEND_READ_STATUS_COMMAND,
    APP_MXT_FW_WAIT_READ_STATUS_COMMAND_TRANSFER_COMPLETE,
    /* Final Status */
    APP_MXT_SUCCESSFUL,
    APP_MXT_ERROR,
    APP_MXT_IDLE,
    /* TODO: Define states used by the application state machine. */

} APP_MXT_STATES;

typedef enum
{
    APP_MXT_TRANSFER_STATUS_IN_PROGRESS,
    APP_MXT_TRANSFER_STATUS_SUCCESS,
    APP_MXT_TRANSFER_STATUS_ERROR,
    APP_MXT_TRANSFER_STATUS_IDLE,

} APP_MXT_TRANSFER_STATUS;

typedef enum
{
    APP_MXT_BL_COMMAND_READ_INFO =      0xC0,   /* NO ARG */
    APP_MXT_BL_COMMAND_UNLOCK =         0xC1,   /* Unlock MaxTouch for start program APP */
    APP_MXT_BL_COMMAND_PROGRAM =        0xC2,   /* NUM_BYTES3-0, DATA0-n*/
    APP_MXT_BL_COMMAND_RESET_MCU =      0xC4,   /* NO ARG, Reset immediate */
    APP_MXT_BL_COMMAND_READ_STATUS =    0xC5,   /* NO ARG */
    APP_MXT_BL_COMMAND_MAX,
}MXT_BL_COMMAND;

typedef struct
{
    uint16_t                i2cSlaveAddr;
    uint32_t                programPageSize;
    char*                   filename;
}APP_MXT_FIRMWARE_UPDATE_INFO;

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
    APP_MXT_STATES                              state;
    APP_STATES                                  nextState;
    uint8_t                                     i2cSlaveIndex;
    uint16_t                                    i2cSlaveAddr;
    uint8_t                                     percentageDone;
    uint32_t                                    programPageSize;
    /* SDCard related variables */
    SYS_FS_HANDLE                               fileHandle;
    uint32_t                                    fileSize;
    volatile bool                               isSDCardMount;
    /* I2C Bootloader related variables */
    volatile APP_MXT_TRANSFER_STATUS            trasnferStatus;
    uint32_t                                    appImageSize;
    uint32_t                                    nBytesWritten;
    uint8_t                                     status;
    uint8_t                                     wrBuffer[APP_MXT_MAX_MEM_PAGE_SIZE + APP_MXT_PROTOCOL_HEADER_MAX_SIZE];

    /* TODO: Define any additional data used by the application. */

} APP_MXT_DATA;

struct mxt_id_info {
	uint8_t family_id;
	uint8_t variant_id;
	uint8_t version;
	uint8_t build;
	uint8_t matrix_xsize;
	uint8_t matrix_ysize;
	uint8_t object_num;
} __attribute__((packed));

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
    void APP_MXT_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    APP_MXT_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_MXT_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void APP_MXT_Initialize ( void );


/*******************************************************************************
  Function:
    void APP_MXT_Tasks ( void )

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
    APP_MXT_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void APP_MXT_Tasks( void );



#endif /* _APP_MXT_H */

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

/*******************************************************************************
 End of File
 */

