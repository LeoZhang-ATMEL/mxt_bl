/*******************************************************************************
  UART Bootloader Source File

  File Name:
    bootloader_i2c.c

  Summary:
    This file contains source code necessary to execute UART bootloader.

  Description:
    This file contains source code necessary to execute UART bootloader.
    It implements bootloader protocol which uses UART peripheral to download
    application firmware into internal flash from HOST-PC.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Include Files
// *****************************************************************************
// *****************************************************************************

#include "definitions.h"
#include <device.h>
#include "mxt_bl_config.h"
// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************

typedef enum
{
    BL_COMMAND_READ_INFO = 0xC0,   /* NO ARG */
    BL_COMMAND_UNLOCK = 0xC1,      /* Unlock MaxTouch for start program APP */
    BL_COMMAND_PROGRAM = 0xC2,     /* NUM_BYTES3-0, DATA0-n*/
    BL_COMMAND_RESET_MCU = 0xC4,   /* NO ARG, Reset immediate */
    BL_COMMAND_READ_STATUS = 0xC5, /* NO ARG */
    BL_COMMAND_MAX,
}BL_COMMAND;

typedef enum
{
    BL_I2C_READ_COMMAND = 0,
    BL_I2C_READ_COMMAND_ARGUMENTS,
    BL_I2C_READ_PROGRAM_DATA,
}BL_I2C_READ_STATE;

typedef enum
{
    BL_MXT_STATE_IDLE = 0,
    BL_MXT_STATE_FW_INFO,
    BL_MXT_STATE_BL_UNLOCK,
    BL_MXT_STATE_FW_WRITE,
    BL_FLASH_STATE_RESET_MCU,
}BL_MXT_STATE;

typedef struct
{
    uint32_t seq; /* Password for unlock */
    uint32_t appLen; /* Application Image Length */
} BL_COMMAND_PROTOCOL_UNLOCK;

typedef struct
{
    uint32_t seq; /* Password for Reset MCU */
} BL_COMMAND_PROTOCOL_RESET_MCU;

typedef struct
{
    uint32_t                                nBytes;
    uint8_t                                 data[BL_MXT_DATA_SIZE];
} BL_COMMAND_PROTOCOL_PROGRAM;

typedef enum
{
    BL_STATUS_NO_ERROR = 0,
    BL_STATUS_INVALID_COMMAND,
    BL_STATUS_INVALID_LENGTH,
    BL_STATUS_INVALID_ARG,
    BL_STATUS_MXT_EXECUTION_ERROR,
    BL_STATUS_MXT_FW_CRC_ERROR,
}BL_STATUS;

typedef union
{
    uint32_t                                cmdArg[2];
    BL_COMMAND_PROTOCOL_UNLOCK              unlockCmd;
    BL_COMMAND_PROTOCOL_PROGRAM             programCommand;
    BL_COMMAND_PROTOCOL_RESET_MCU           resetMcu;

}BL_COMMAND_PROTOCOL;

typedef struct
{
    int32_t                                 index;
    uint32_t                                nCmdArgWords;
    BL_I2C_READ_STATE                       rdState;
    BL_MXT_STATE                            mxtState;
    BL_COMMAND                              command;
    BL_COMMAND                              lastRdCmd;
    BL_STATUS                               status;
    uint32_t                                nFlashBytesWritten;
    BL_COMMAND_PROTOCOL                     cmdProtocol;
}BL_PROTOCOL;

// *****************************************************************************
// *****************************************************************************
// Section: Global objects
// *****************************************************************************
// *****************************************************************************

static BL_PROTOCOL                          blProtocol;

// *****************************************************************************
// *****************************************************************************
// Section: Bootloader Local Functions
// *****************************************************************************
// *****************************************************************************
static uint32_t mxt_read_buf_ind = 0;
extern uint8_t mxt_read_buf[];
extern void mxt_set_bootloader_len(uint32_t len);
int mxt_enter_boatloader_mode(void);
int mxt_upgrade_firmware(uint8_t *buf, uint8_t len);

static void BL_Switch_I2C_Role(bool role)
{
    if (role) { // Master
        INT_MCU_Clear();
        while ((BL_I2CS_InterruptFlagsGet() & SERCOM_I2CS_INTFLAG_PREC(1)) == 0);
        BL_I2C_Initialize();
    } else { // Slave
        BL_I2CS_Initialize();
        INT_MCU_Set();
    }
}
/* Function to program received application firmware data into internal flash */

static bool BL_I2CMasterWriteHandler(uint8_t rdByte)
{
    switch(blProtocol.rdState)
    {
        case BL_I2C_READ_COMMAND:
            blProtocol.command = rdByte;
            /* Set default value of index to 3. Over-write below if needed */
            blProtocol.index = 3;

            blProtocol.nCmdArgWords = 0;

            if ((blProtocol.command < BL_COMMAND_READ_INFO) || (blProtocol.command >= BL_COMMAND_MAX))
            {
                blProtocol.status = BL_STATUS_INVALID_COMMAND;
                return false;
            }
            else if (blProtocol.command == BL_COMMAND_READ_INFO)
            {
                blProtocol.mxtState = BL_MXT_STATE_FW_INFO;
                blProtocol.lastRdCmd = BL_COMMAND_READ_INFO;
            }
            else if (blProtocol.command == BL_COMMAND_READ_STATUS)
            {
                blProtocol.lastRdCmd = BL_COMMAND_READ_STATUS;
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

                if (blProtocol.command == BL_COMMAND_UNLOCK)
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

                if (blProtocol.command == BL_COMMAND_UNLOCK)
                {
                    /* Set maxtouch firmware length */
                    if (blProtocol.cmdProtocol.unlockCmd.seq == MXT_CMD_PASSWORD) {
                        mxt_set_bootloader_len(blProtocol.cmdProtocol.unlockCmd.appLen);
                        blProtocol.mxtState = BL_MXT_STATE_BL_UNLOCK;
                    } else {
                        mxt_set_bootloader_len(0);
                        blProtocol.status = BL_STATUS_INVALID_ARG;
                        return false;
                    }
                }
                else if (blProtocol.command == BL_COMMAND_PROGRAM)
                {
                    if (blProtocol.cmdProtocol.programCommand.nBytes > BL_MXT_DATA_SIZE)
                    {
                        blProtocol.status = BL_STATUS_INVALID_LENGTH;
                        return false;
                    }
                    else
                    {
                        blProtocol.index = 0;
                        blProtocol.rdState = BL_I2C_READ_PROGRAM_DATA;
                    }
                }
                else if (blProtocol.command == BL_COMMAND_RESET_MCU)
                {
                    if (blProtocol.cmdProtocol.resetMcu.seq == MXT_CMD_PASSWORD) {
                        blProtocol.mxtState = BL_FLASH_STATE_RESET_MCU;
                    } else {
                        blProtocol.status = BL_STATUS_INVALID_ARG;
                        return false;
                    }
                }
            }
            break;

        case BL_I2C_READ_PROGRAM_DATA:
            blProtocol.cmdProtocol.programCommand.data[blProtocol.index++] = rdByte;
            if (blProtocol.index >= blProtocol.cmdProtocol.programCommand.nBytes)
            {
                blProtocol.nFlashBytesWritten = 0;
                blProtocol.rdState = BL_I2C_READ_COMMAND;
                blProtocol.mxtState = BL_MXT_STATE_FW_WRITE;
            }
            break;

        default:
            break;
    }
    return true;
}

static void BL_I2C_EventsProcess(void)
{
    static bool isFirstRxByte;
    static bool transferDir;
    SERCOM_I2C_SLAVE_INTFLAG intFlags = BL_I2CS_InterruptFlagsGet();

    if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_AMATCH)
    {
        isFirstRxByte = true;

        transferDir = BL_I2CS_TransferDirGet();

        /* Reset the I2C read state machine */
        blProtocol.rdState = BL_I2C_READ_COMMAND;

        BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_ACK);
    }
    else if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_DRDY)
    {
        if (transferDir == SERCOM_I2C_SLAVE_TRANSFER_DIR_WRITE) /**** Write */
        {
            if (BL_I2CMasterWriteHandler(BL_I2CS_ReadByte()) == true)
            {
                BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_ACK);
            }
            else
            {
                BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_SEND_NAK);
            }
        }
        else  /**** Read */
        {
            if ((isFirstRxByte == true) && (BL_I2CS_LastByteAckStatusGet() == SERCOM_I2C_SLAVE_ACK_STATUS_RECEIVED_ACK))
            {
                BL_I2CS_WriteByte(blProtocol.status);

                /* Clear all status bits except the busy bit */
                blProtocol.status = BL_STATUS_NO_ERROR;

                isFirstRxByte = false;

                BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_RECEIVE_ACK_NAK);
            }
            else if ((isFirstRxByte == false)
                    && (blProtocol.lastRdCmd == BL_COMMAND_READ_INFO)
                    && (BL_I2CS_LastByteAckStatusGet() == SERCOM_I2C_SLAVE_ACK_STATUS_RECEIVED_ACK)
                    )
            {
                BL_I2CS_WriteByte(mxt_read_buf[mxt_read_buf_ind++]);

                BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_RECEIVE_ACK_NAK);
            }
            else
            {
                BL_I2CS_CommandSet(SERCOM_I2C_SLAVE_COMMAND_WAIT_FOR_START);
            }
        }
    }
    else if (intFlags & SERCOM_I2C_SLAVE_INTFLAG_PREC)
    {
        BL_I2CS_InterruptFlagsClear(SERCOM_I2C_SLAVE_INTFLAG_PREC);
    }
}

extern int8_t mxt_init(void);
static void BL_MXT_SM(void)
{
    switch(blProtocol.mxtState)
    {
        case BL_MXT_STATE_FW_INFO:
            BL_Switch_I2C_Role(true);
            if (mxt_init() != -1) {
                blProtocol.status = 0;
            } else {
                blProtocol.status = BL_STATUS_MXT_EXECUTION_ERROR;
            }
            mxt_read_buf_ind = 0;
            blProtocol.mxtState = BL_MXT_STATE_IDLE;
            BL_Switch_I2C_Role(false);
            break;

        case BL_MXT_STATE_BL_UNLOCK:
            BL_Switch_I2C_Role(true);
            if (mxt_enter_boatloader_mode()) {
                blProtocol.status = BL_STATUS_MXT_EXECUTION_ERROR;
            } else {
                blProtocol.status = 0;
            }
            
            blProtocol.mxtState = BL_MXT_STATE_IDLE;
            BL_Switch_I2C_Role(false);
            break;

        case BL_MXT_STATE_FW_WRITE:
            BL_Switch_I2C_Role(true);
            if (mxt_upgrade_firmware(blProtocol.cmdProtocol.programCommand.data,
                    blProtocol.index)) {
                blProtocol.status = BL_STATUS_MXT_EXECUTION_ERROR;
            } else {
                blProtocol.status = BL_STATUS_NO_ERROR;
            }
            blProtocol.mxtState = BL_MXT_STATE_IDLE;
            BL_Switch_I2C_Role(false);
            break;

        case BL_FLASH_STATE_RESET_MCU:
            /* Wait for the I2C transfer to complete */
            while (!(BL_I2CS_InterruptFlagsGet() & SERCOM_I2C_SLAVE_INTFLAG_PREC));
            NVIC_SystemReset();
            break;

        case BL_MXT_STATE_IDLE:
            /* Do nothing */
            break;

        default:
            break;
    }
}

void bootloader_Start(void)
{
    blProtocol.mxtState = BL_MXT_STATE_IDLE;
    BL_Switch_I2C_Role(false);
    while (1)
    {
        BL_MXT_SM();
        BL_I2C_EventsProcess();
    }
}
