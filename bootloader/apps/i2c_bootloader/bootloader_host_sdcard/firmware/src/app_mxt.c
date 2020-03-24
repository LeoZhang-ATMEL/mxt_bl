/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_mxt.c

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
#include "app.h"
#include "bsp/bsp.h"
#include "user.h"
#include <string.h>
#include "app_mxt.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
/* Definitions */
#define APP_BL_NUM_I2C_SLAVES                       1

typedef enum
{
    BL_STATUS_NO_ERROR = 0,
    BL_STATUS_INVALID_COMMAND,
    BL_STATUS_INVALID_LENGTH,
    BL_STATUS_INVALID_ARG,
    BL_STATUS_MXT_EXECUTION_ERROR,
    BL_STATUS_MXT_FW_CRC_ERROR,
}BL_STATUS;

#define         LINE_TERM       "\r\n"          // line terminator
// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_MXT_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_MXT_DATA app_mxtData;
extern BUFFER_ATTRIBUTES uint8_t               sdCardBuffer[];
extern APP_DATA appData;

/* For multiple I2C slaves on the same bus, set the APP_BL_NUM_I2C_SLAVES macro
 * to the number of slaves on the bus and populate this data structure with the
 * corresponding I2C slave's firmware update information as shown below for a
 * SAM E54 I2C slave.
 * For SAM D20, SAM D21, SAM C21N, SAM D11, SAM DA1, SAM L10, SAM L11, SAM L21, SAM L22:
    .i2cSlaveAddr       = <I2C Slave Address>,
    .erasePageSize      = 256,
    .programPageSize    = 64 or 256,
    .appStartAddr       = 0x800,
    .filename           = <firmware file name (.bin)>
 * For SAM E54:
    .i2cSlaveAddr       = <I2C Slave Address>,
    .erasePageSize      = 8192,
    .programPageSize    = 512 or 8192,
    .appStartAddr       = 0x2000,
    .filename           = <firmware file name (.bin)>
 */
APP_MXT_FIRMWARE_UPDATE_INFO  mxtFirmwareUpdateInfo[APP_BL_NUM_I2C_SLAVES] =
{
    {
        .i2cSlaveAddr       = 0x0054,
        /* This example programs all the pages in an erase row in one shot. In case the
         * embedded host has limited RAM, the programPageSize macro can be set to
         * the actual program page size to reduce the RAM used to hold the
         * program data.
         */
        .programPageSize    = 256
    },

    /* Add firmware update information for the additional I2C slaves on the bus
     * here */
};

static void CommandUpgradeMxt1(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static void CommandUpgradeMxt2(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static void CommandReadMxtInfo(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static const SYS_CMD_DESCRIPTOR    appMxtCmdTbl[]=
{
    {"mxt1",   CommandUpgradeMxt1,   ": Upgrade MaxTouch Firmware instance 1"},
    {"mxt2",   CommandUpgradeMxt2,   ": Upgrade MaxTouch Firmware instance 2"},
    {"readinfo", CommandReadMxtInfo,      ": Read MaxTouch firmware Info"},
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

static void APP_MXT_I2CEventHandler(uintptr_t context )
{
    APP_MXT_TRANSFER_STATUS* trasnferStatus = (APP_MXT_TRANSFER_STATUS*)context;

    if(SERCOM2_I2C_ErrorGet() == SERCOM_I2C_ERROR_NONE)
    {
        if (trasnferStatus)
        {
            *trasnferStatus = APP_MXT_TRANSFER_STATUS_SUCCESS;
        }
    }
    else
    {
        if (trasnferStatus)
        {
            *trasnferStatus = APP_MXT_TRANSFER_STATUS_ERROR;
        }
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

static void setAppMxtData(void)
{
    if (app_mxtData.i2cSlaveIndex < APP_BL_NUM_I2C_SLAVES)
    {
        app_mxtData.nBytesWritten = 0;
        app_mxtData.percentageDone = 0;
        app_mxtData.i2cSlaveAddr = mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].i2cSlaveAddr;
        app_mxtData.programPageSize = mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].programPageSize;
        SYS_CMD_PRINT("%s 0x%x ", "I2C Slave Addr:", app_mxtData.i2cSlaveAddr);
        app_mxtData.state = APP_FILE_OPEN;
    }
    else
    {
        SYS_CMD_PRINT ("---------------------------------------------------------\r\n");
        app_mxtData.state = APP_IDLE;
    }
}
static uint32_t APP_ReadInfoCommandHeaderGen(void)
{
    uint32_t nTxBytes = 0;

    app_mxtData.wrBuffer[nTxBytes++] = APP_MXT_BL_COMMAND_READ_INFO;

    return nTxBytes;
}

static uint32_t APP_MXT_UnlockCommandHeaderGen(uint32_t seq, uint32_t fwSize)
{
    uint32_t nTxBytes = 0;

    app_mxtData.wrBuffer[nTxBytes++] = APP_MXT_BL_COMMAND_UNLOCK;
    app_mxtData.wrBuffer[nTxBytes++] = (seq >> 24);
    app_mxtData.wrBuffer[nTxBytes++] = (seq >> 16);
    app_mxtData.wrBuffer[nTxBytes++] = (seq >> 8);
    app_mxtData.wrBuffer[nTxBytes++] = (seq);
    app_mxtData.wrBuffer[nTxBytes++] = (fwSize >> 24);
    app_mxtData.wrBuffer[nTxBytes++] = (fwSize >> 16);
    app_mxtData.wrBuffer[nTxBytes++] = (fwSize >> 8);
    app_mxtData.wrBuffer[nTxBytes++] = (fwSize);

    return nTxBytes;
}

static void printMxtInfo(void)
{
    struct mxt_id_info *info;
    
    info = (struct mxt_id_info *) (&app_mxtData.wrBuffer[1]);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH Chip Info Read %s", (app_mxtData.wrBuffer[0] == 0)? "Success" : "Failed");
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: family_id\t 0x%02X", info->family_id);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: variant_id\t 0x%02X", info->variant_id);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: version\t 0x%02X", info->version);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: build\t\t 0x%02X", info->build);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: matrix_xsize\t 0x%02X", info->matrix_xsize);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: matrix_ysize\t 0x%02X", info->matrix_ysize);
    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: object_num\t 0x%02X\n", info->object_num);
    SYS_CMD_PRINT(LINE_TERM);
}
static void CommandUpgradeMxt1(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    SYS_CMD_PRINT(" *** Upgrade MCU firmware 1 ***\r\n" );
    mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].filename = APP_MXT_FIRMWARE_NAME_INSTANCE1;
    appData.state = APP_IDLE;
    app_mxtData.state = APP_MXT_WAIT_SWITCH_PRESS;
}

static void CommandUpgradeMxt2(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    SYS_CMD_PRINT(" *** Upgrade MCU firmware 2 ***\r\n" );
    mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].filename = APP_MXT_FIRMWARE_NAME_INSTANCE2;
    appData.state = APP_IDLE;
    app_mxtData.state = APP_MXT_WAIT_SWITCH_PRESS;
}

static void CommandReadMxtInfo(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    SYS_CMD_PRINT(" *** Read Max Touch Firmware Info ***\r\n" );
    SERCOM2_I2C_CallbackRegister( APP_MXT_I2CEventHandler, (uintptr_t)&app_mxtData.trasnferStatus );
    appData.state = APP_IDLE;
    app_mxtData.state = APP_MXT_INFO_SEND_READ_COMMAND;
}
// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_MXT_Initialize ( void )

  Remarks:
    See prototype in app_mxt.h.
 */

void APP_MXT_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_mxtData.state = APP_MXT_INIT;

    app_mxtData.state            = APP_MXT_INIT;
    app_mxtData.nBytesWritten    = 0;
    app_mxtData.appImageSize     = 0;
    app_mxtData.isSDCardMount    = false;
    app_mxtData.fileSize         = 0;
    app_mxtData.i2cSlaveIndex    = 0;
    app_mxtData.percentageDone   = 0;
    mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].filename = NULL;
    
    SYS_CMD_ADDGRP(appMxtCmdTbl, sizeof(appMxtCmdTbl)/sizeof(*appMxtCmdTbl), "MaxTouch Bootloader", ": Upgrade MaxTouch Firmware through I2C");


    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_MXT_Tasks ( void )

  Remarks:
    See prototype in app_mxt.h.
 */

void APP_MXT_Tasks ( void )
{
    uint32_t nTxBytes;

    /* Check the application's current state. */
    switch ( app_mxtData.state )
    {
        case APP_MXT_INIT:
            break;

        case APP_MXT_INFO_SEND_READ_COMMAND:
            setAppMxtData();
            nTxBytes = APP_ReadInfoCommandHeaderGen();
            app_mxtData.trasnferStatus = APP_MXT_TRANSFER_STATUS_IN_PROGRESS;
            SERCOM2_I2C_Write(app_mxtData.i2cSlaveAddr, &app_mxtData.wrBuffer[0], nTxBytes);
            app_mxtData.state = APP_MXT_INFO_WAIT_READ_COMMAND_TRANSFER_COMPLETE;
            break;

        case APP_MXT_INFO_WAIT_READ_COMMAND_TRANSFER_COMPLETE:
            if ((app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_SUCCESS) && INT_MCU_Get())
            {
                SYSTICK_DelayMs(1);
                app_mxtData.state = APP_MXT_INFO_SEND_READ_BACK_COMMAND;
            }
            else if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_ERROR)
            {
                app_mxtData.state = APP_MXT_ERROR;
            }
            break;

        case APP_MXT_INFO_SEND_READ_BACK_COMMAND:

            SERCOM2_I2C_Read(app_mxtData.i2cSlaveAddr, &app_mxtData.wrBuffer[0], sizeof(struct mxt_id_info) + 1);
            app_mxtData.trasnferStatus = APP_MXT_TRANSFER_STATUS_IN_PROGRESS;
            app_mxtData.state = APP_MXT_INFO_WAIT_READ_BACK_COMMAND_TRANSFER_COMPLETE;
            break;

        case APP_MXT_INFO_WAIT_READ_BACK_COMMAND_TRANSFER_COMPLETE:
            if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_SUCCESS)
            {
                app_mxtData.state = APP_MXT_IDLE;
                printMxtInfo();
            }
            else if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_ERROR)
            {
                app_mxtData.state = APP_MXT_ERROR;
            }
            break;

        case APP_MXT_WAIT_SWITCH_PRESS:
            if (mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].filename != NULL)
            {
                app_mxtData.state = APP_MXT_LOAD_I2C_SLAVE_DATA;
            }
            break;

        case APP_MXT_LOAD_I2C_SLAVE_DATA:
            if (app_mxtData.i2cSlaveIndex < APP_BL_NUM_I2C_SLAVES)
            {
                app_mxtData.nBytesWritten = 0;
                app_mxtData.percentageDone = 0;
                app_mxtData.i2cSlaveAddr = mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].i2cSlaveAddr;
                app_mxtData.programPageSize = mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].programPageSize;
                SYS_CMD_PRINT("%s 0x%x ", "I2C Slave Addr:", app_mxtData.i2cSlaveAddr);
                app_mxtData.state = APP_MXT_FILE_OPEN;
            }
            else
            {
                SYS_CMD_PRINT ("---------------------------------------------------------\r\n");
                app_mxtData.state = APP_IDLE;
            }
            break;

        case APP_MXT_FILE_OPEN:
            app_mxtData.fileHandle = SYS_FS_FileOpen((const char*)mxtFirmwareUpdateInfo[app_mxtData.i2cSlaveIndex].filename, (SYS_FS_FILE_OPEN_READ));
            if(app_mxtData.fileHandle == SYS_FS_HANDLE_INVALID)
            {
                /* Could not open the file. Error out */
                app_mxtData.state = APP_MXT_ERROR;
            }
            else
            {
                app_mxtData.fileSize = SYS_FS_FileSize(app_mxtData.fileHandle);
                app_mxtData.state = APP_MXT_UNLOCK_SEND_COMMAND;
            }
            break;

        case APP_MXT_UNLOCK_SEND_COMMAND:
            app_mxtData.appImageSize = app_mxtData.fileSize;

            nTxBytes = APP_MXT_UnlockCommandHeaderGen(MXT_CMD_PASSWORD, app_mxtData.fileSize);
            app_mxtData.trasnferStatus = APP_MXT_TRANSFER_STATUS_IN_PROGRESS;
            SERCOM2_I2C_Write(app_mxtData.i2cSlaveAddr, &app_mxtData.wrBuffer[0], nTxBytes);
            app_mxtData.state = APP_MXT_UNLOCK_WAIT_COMMAND_TRANSFER_COMPLETE;
            break;

        case APP_MXT_UNLOCK_WAIT_COMMAND_TRANSFER_COMPLETE:
            if ((app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_SUCCESS) && INT_MCU_Get())
            {
                app_mxtData.state = APP_MXT_UNLOCK_SEND_READ_STATUS_COMMAND;
            }
            else if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_ERROR)
            {
                app_mxtData.state = APP_MXT_ERROR;
            }
            break;

        case APP_MXT_UNLOCK_SEND_READ_STATUS_COMMAND:

            SERCOM2_I2C_Read(app_mxtData.i2cSlaveAddr, &app_mxtData.wrBuffer[0], 1);
            app_mxtData.trasnferStatus = APP_MXT_TRANSFER_STATUS_IN_PROGRESS;
            app_mxtData.state = APP_MXT_UNLOCK_WAIT_READ_STATUS_COMMAND_TRANSFER_COMPLETE;
            break;

        case APP_MXT_UNLOCK_WAIT_READ_STATUS_COMMAND_TRANSFER_COMPLETE:
            if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_SUCCESS)
            {
                if (app_mxtData.wrBuffer[0] == 0) {
                    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: Unlock Success.");
                } else {
                    SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: Unlock Failed, return code (0x%02X).", app_mxtData.wrBuffer[0]);
                }
                app_mxtData.state = APP_MXT_IDLE;
            }
            else if (app_mxtData.trasnferStatus == APP_MXT_TRANSFER_STATUS_ERROR)
            {
                app_mxtData.state = APP_MXT_ERROR;
                SYS_CMD_PRINT(LINE_TERM "MAXTOUCH: Unlock Failed, I2C Bus error.");
            }
            break;

        /* TODO: implement your application state machine.*/


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
