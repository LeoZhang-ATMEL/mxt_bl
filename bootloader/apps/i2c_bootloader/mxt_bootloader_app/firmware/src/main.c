/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "mxt_bl_config.h"

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

extern int8_t mxt_init(void);
extern void bootloader_Start(void);

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );

    SYSTICK_TimerStart();

    /* Init mXTouch */
    INT_MCU_Clear();
    if (mxt_init() != -1) {
        LED_Clear();
    }
    INT_MCU_Set();

    /* Indicate that bootloader code is running */
    bootloader_Start();

    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

