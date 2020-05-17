/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_info4.c

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
#include "definitions.h"
#include <device.h>
#include "app_info4.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
#define BTL_MAGIC_WORD      (0x80A79127UL)

typedef enum
{
    BL_I2C_READ_COMMAND = 0,
    BL_I2C_READ_COMMAND_ARGUMENTS,
    BL_I2C_READ_PROGRAM_DATA,
}BL_I2C_READ_STATE;

typedef enum
{
    BL_COMMAND_TRIGGER = 0xAA,
    BL_COMMAND_MAX
}BL_COMMAND;

static uint32_t *ramStart = (uint32_t *)BTL_TRIGGER_RAM_START;

typedef struct
{
    uint32_t                                magicWord;
    uint32_t                                triggerPattern;
}BL_COMMAND_PROTOCOL_TRIGGER;

typedef union __ALIGNED(4)
{
    uint32_t                                cmdArg[2];
    BL_COMMAND_PROTOCOL_TRIGGER             triggerCommand;
}BL_COMMAND_PROTOCOL;

typedef struct
{
    int32_t                                 index;
    uint32_t                                nCmdArgWords;
    BL_I2C_READ_STATE                       rdState;
    BL_COMMAND                              command;
    BL_COMMAND_PROTOCOL                     cmdProtocol;
}BL_PROTOCOL;

static BL_PROTOCOL                          blProtocol;

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_INFO4_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_INFO4_DATA app_info4Data;


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

static bool BL_I2CMasterWriteHandler(uint8_t rdByte)
{
    switch(blProtocol.rdState)
    {
        case BL_I2C_READ_COMMAND:
            blProtocol.command = rdByte;
            /* Set default value of index to 3. Over-write below if needed */
            blProtocol.index = 3;

            blProtocol.nCmdArgWords = 0;
            
            app_info4Data.state = APP_INFO4_I2C_TRIGGER_WAIT;

            if ((blProtocol.command < BL_COMMAND_TRIGGER) || (blProtocol.command >= BL_COMMAND_MAX))
            {
                return false;
            }
            else
            {
                /* All commands transition to the BL_I2C_READ_COMMAND_ARGUMENTS state */
                blProtocol.rdState = BL_I2C_READ_COMMAND_ARGUMENTS;
            }
            break;
        case BL_I2C_READ_COMMAND_ARGUMENTS:
            ((uint8_t*)&blProtocol.cmdProtocol.cmdArg[blProtocol.nCmdArgWords])[blProtocol.index--] = rdByte;

            if (blProtocol.index < 0)
            {
                /* Program enters here after receiving each word of the command argument */
                blProtocol.nCmdArgWords++;

                if (blProtocol.command == BL_COMMAND_TRIGGER)
                {
                    if (blProtocol.nCmdArgWords < 2)
                    {
                        blProtocol.index = 3;
                    }
                }
            }

            if (blProtocol.index < 0)
            {
                /* Set default state to BL_I2C_READ_COMMAND. Over-write below if needed */
                blProtocol.rdState = BL_I2C_READ_COMMAND;

                if (blProtocol.command == BL_COMMAND_TRIGGER)
                {
                    /* Save application start address and size for future reference */
                    if (blProtocol.cmdProtocol.triggerCommand.magicWord == BTL_MAGIC_WORD)
                    {
                        blProtocol.rdState = BL_I2C_READ_COMMAND;
                        app_info4Data.state = APP_INFO4_TRIGGER_BOOTLOADER;
                    }
                    else
                    {
                        blProtocol.rdState = BL_I2C_READ_COMMAND;
                        return false;
                    }
                }
            }
            break;
        default:
            break;
    }
    return true;
}

static void BL_I2C_EventsProcess(void)
{
    static bool transferDir;
    SERCOM_I2C_SLAVE_INTFLAG intFlags = SERCOM5_I2C_InterruptFlagsGet();

    if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_AMATCH)
    {
        transferDir = SERCOM5_I2C_TransferDirGet();

        /* Reset the I2C read state machine */
        blProtocol.rdState = BL_I2C_READ_COMMAND;
        SERCOM5_I2C_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_ACK);

    }
    else if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_DRDY)
    {
        if (transferDir == SERCOM_I2C_SLAVE_TRANSFER_DIR_WRITE)
        {
            if (BL_I2CMasterWriteHandler(SERCOM5_I2C_ReadByte()) == true)
            {
                SERCOM5_I2C_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_ACK);
            }
            else
            {
                SERCOM5_I2C_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_NAK);
            }
        }
        else
        {
            SERCOM5_I2C_CommandSet(SERCOM_I2C_SLAVE_COMMAND_RECEIVE_ACK_NAK);
        }

    }
    else if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_PREC)
    {
        SERCOM5_I2C_InterruptFlagsClear(SERCOM_I2C_SLAVE_INTFLAG_PREC);
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_INFO4_Initialize ( void )

  Remarks:
    See prototype in app_info4.h.
 */

void APP_INFO4_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_info4Data.state = APP_INFO4_STATE_INIT;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
    app_info4Data.blPattern = 0;
}


/******************************************************************************
  Function:
    void APP_INFO4_Tasks ( void )

  Remarks:
    See prototype in app_info4.h.
 */

void APP_INFO4_Tasks ( void )
{
    BL_I2C_EventsProcess();
    /* Check the application's current state. */
    switch ( app_info4Data.state )
    {
        /* Application's initial state. */
        case APP_INFO4_STATE_INIT:
        {
            bool appInitialized = true;


            if (appInitialized)
            {

                app_info4Data.state = APP_INFO4_IDLE;
            }
            break;
        }

        case APP_INFO4_I2C_TRIGGER_WAIT:
        {
            INT_MCU_Clear();
            break;
        }

        case APP_INFO4_TRIGGER_BOOTLOADER:
        {
            ramStart[0] = blProtocol.cmdProtocol.triggerCommand.triggerPattern;
            ramStart[1] = blProtocol.cmdProtocol.triggerCommand.triggerPattern;
            ramStart[2] = blProtocol.cmdProtocol.triggerCommand.triggerPattern;
            ramStart[3] = blProtocol.cmdProtocol.triggerCommand.triggerPattern;

            DCACHE_CLEAN_BY_ADDR(ramStart, 16);

            APP_SystemReset();
            break;
        }

        case APP_INFO4_IDLE:
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
