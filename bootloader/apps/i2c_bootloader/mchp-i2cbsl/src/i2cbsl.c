/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    i2cbsl.c

  Summary:
    This file contains the "main" function for bootloader project.

  Description:
    This file contains the "main" function for bootloader project.  The
    "main" function calls the "SYS_Initialize" function to initialize
    all modules in the system.
    It calls "bootloader_start" once system is initialized.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
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
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#include "i2cbsl.h"
#include "blconfig.h"

/* Statics */
/* Global I2C Handle that is opened by the main application */
extern int i2c_file;

extern uint8_t *image_pattern; /* alway align with APP_PROGRAM_PAGE_SIZE */
/* Definitions */
extern uint32_t app_image_size;
uint32_t app_image_start_addr = 0;
uint32_t app_image_erase_size = 0;
uint8_t samd_i2c_addr = 0;

#define APP_BL_STATUS_BIT_BUSY                      (0x01 << 0)
#define APP_BL_STATUS_BIT_INVALID_COMMAND           (0x01 << 1)
#define APP_BL_STATUS_BIT_INVALID_MEM_ADDR          (0x01 << 2)
#define APP_BL_STATUS_BIT_COMMAND_EXECUTION_ERROR   (0x01 << 3)      //Valid only when APP_BL_STATUS_BIT_BUSY is 0
#define APP_BL_STATUS_BIT_CRC_ERROR                 (0x01 << 4)
#define APP_BL_STATUS_BIT_ALL                       (APP_BL_STATUS_BIT_BUSY | APP_BL_STATUS_BIT_INVALID_COMMAND | APP_BL_STATUS_BIT_INVALID_MEM_ADDR | \
                                                    APP_BL_STATUS_BIT_COMMAND_EXECUTION_ERROR | APP_BL_STATUS_BIT_CRC_ERROR)

typedef enum
{
    APP_BL_COMMAND_UNLOCK = 0xA0,
    APP_BL_COMMAND_ERASE = 0xA1,
    APP_BL_COMMAND_PROGRAM = 0xA2,
    APP_BL_COMMAND_VERIFY = 0xA3,
    APP_BL_COMMAND_RESET = 0xA4,
    APP_BL_COMMAND_READ_STATUS = 0xA5
} APP_BL_COMMAND;

/* Combined R/W transfer (one STOP only) */
bool APP_I2CWriteRead(uint8_t* buf, uint32_t len, uint8_t* rbuf, uint32_t rlen)
{
    struct i2c_msg messages[2];
    struct i2c_rdwr_ioctl_data packets;

    /* Setting up the read */
    messages[0].addr = samd_i2c_addr;
    messages[0].flags = 0;
    messages[0].buf = buf;
    messages[0].len = len;

    /* Setting up the read */
    messages[1].addr = samd_i2c_addr;
    messages[1].flags = I2C_M_RD;
    messages[1].buf = rbuf;
    messages[1].len = rlen;

    /* Sending the request */
    packets.msgs = messages;
    packets.nmsgs = 2;

    if(ioctl(i2c_file, I2C_RDWR, &packets) < 0)
    {
        return false;
    }

    return true;
}

static uint32_t APP_ImageDataWrite(uint8_t *buf, uint32_t memAddr, uint32_t nBytes)
{
    uint32_t k;
    uint32_t nTxBytes = 0;
    uint32_t wrIndex = (memAddr - app_image_start_addr);

    buf[nTxBytes++] = APP_BL_COMMAND_PROGRAM;
    buf[nTxBytes++] = (nBytes >> 24);
    buf[nTxBytes++] = (nBytes >> 16);
    buf[nTxBytes++] = (nBytes >> 8);
    buf[nTxBytes++] = (nBytes);
    buf[nTxBytes++] = (memAddr >> 24);
    buf[nTxBytes++] = (memAddr >> 16);
    buf[nTxBytes++] = (memAddr >> 8);
    buf[nTxBytes++] = (memAddr);


    for (k = 0; k < nBytes; k++, nTxBytes++)
    {
        buf[nTxBytes] = image_pattern[wrIndex + k];
    }

    return nTxBytes;
}

static uint32_t APP_UnlockCommandSend(uint8_t *buf, uint32_t appStartAddr, uint32_t appSize)
{
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = APP_BL_COMMAND_UNLOCK;
    buf[nTxBytes++] = (appStartAddr >> 24);
    buf[nTxBytes++] = (appStartAddr >> 16);
    buf[nTxBytes++] = (appStartAddr >> 8);
    buf[nTxBytes++] = (appStartAddr);
    buf[nTxBytes++] = (appSize >> 24);
    buf[nTxBytes++] = (appSize >> 16);
    buf[nTxBytes++] = (appSize >> 8);
    buf[nTxBytes++] = (appSize);

    return nTxBytes;
}

static uint32_t APP_VerifyCommandSend(uint8_t *buf, uint32_t crc)
{
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = APP_BL_COMMAND_VERIFY;
    buf[nTxBytes++] = (crc >> 24);
    buf[nTxBytes++] = (crc >> 16);
    buf[nTxBytes++] = (crc >> 8);
    buf[nTxBytes++] = (crc);

    return nTxBytes;
}

static uint32_t APP_EraseCommandSend(uint8_t *buf, uint32_t memAddr)
{
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = APP_BL_COMMAND_ERASE;
    buf[nTxBytes++] = (memAddr >> 24);
    buf[nTxBytes++] = (memAddr >> 16);
    buf[nTxBytes++] = (memAddr >> 8);
    buf[nTxBytes++] = (memAddr);

    return nTxBytes;
}

static bool APP_WaitForReady(void)
{
	uint32_t wait = 500; // 500ms
	uint8_t rd = APP_BL_COMMAND_READ_STATUS;
	uint8_t status;

	while (1) {
		if (APP_I2CWriteRead(&rd, 1,  &status, 1)) {
			if (status == APP_BL_STATUS_BIT_BUSY) {
				continue;
			} else if (status & APP_BL_STATUS_BIT_INVALID_COMMAND) {
				printf("Erase command failed, ret(0x%02X), Invalid Command\n", status);
				return false;
			} else if (status & APP_BL_STATUS_BIT_INVALID_MEM_ADDR) {
				printf("Erase command failed, ret(0x%02X), Invalid MEM Address\n", status);
				return false;
			} else if (status & APP_BL_STATUS_BIT_COMMAND_EXECUTION_ERROR) {
				printf("Erase command failed, ret(0x%02X), Command execution error\n", status);
				return false;
			} else if (status & APP_BL_STATUS_BIT_CRC_ERROR) {
				printf("CRC command failed, ret(0x%02X), CRC_ERROR\n", status);
				return false;
			} else {
				break;
			}
		}
		usleep(1000); // Sleep nano sleep
		if (--wait == 0) {
			printf("Read Status timeout\n");
			return false;
		}
	}
	return true;
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int updateApp(void)
{
	uint32_t nTxBytes;
	uint32_t curAddr;
	uint8_t buf[APP_PROGRAM_PAGE_SIZE + APP_PROTOCOL_HEADER_MAX_SIZE];
	uint32_t crc = 0;

	open_I2C();
	if (ioctl(i2c_file, I2C_SLAVE, samd_i2c_addr) < 0) {
		printf("%s, %d, ioctl set i2c slave address(%02x) fail\n",
				__func__, __LINE__, samd_i2c_addr);
		return -1;
	}
	printf("Unlock target memory 0x%08X, length %d\n",
			app_image_start_addr, app_image_erase_size);
	nTxBytes = APP_UnlockCommandSend(buf, app_image_start_addr, app_image_erase_size);
    if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
		printf("Unlock Command Failed\n");
		return -1;
	}

	printf("Erase flash from 0x%08X, length 0x%08X\n",
			app_image_start_addr, app_image_erase_size);
	curAddr = app_image_start_addr;
	while (curAddr < (app_image_start_addr + app_image_erase_size)) {
		nTxBytes = APP_EraseCommandSend(buf, curAddr);
		if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
			printf("Erase Command Failed\n");
			return -1;
		}

		/* Check if erase success */
		if (!APP_WaitForReady()) {
			printf("Read Status Failed(Erase)\n");
			return -1;
		}
		curAddr += APP_PROGRAM_PAGE_SIZE*4;
	}

	/* Write App Image */
	curAddr = 0;
	while (curAddr < app_image_size) {
		nTxBytes = APP_ImageDataWrite(buf,
				(app_image_start_addr + curAddr), APP_PROGRAM_PAGE_SIZE);
		if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
			printf("Write Command Failed\r\n");
			return -1;
		}
		if (!APP_WaitForReady()) {
			printf("Read Status Failed(Write)\n");
			return -1;
		}
		curAddr += APP_PROGRAM_PAGE_SIZE;
	}
	printf("Program flash success, length %d bytes\n", app_image_size);

	/* CRC Checking */
	crc = 0xFFFFFFFF;
	crc = crc32(crc, image_pattern, app_image_erase_size);
	nTxBytes = APP_VerifyCommandSend(buf, crc);
	if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
		printf("CRC Command Failed\r\n");
		return -1;
	}
	if (!APP_WaitForReady()) {
		printf("Read Status Failed(CRC), CRC=0x%08X\n", crc);
		return -1;
	}
	printf("INFO: CRC Check Success, CRC=0x%08X\n", crc);


	/* Reset Target */
	buf[0] = APP_BL_COMMAND_RESET;
	if (write(i2c_file, buf, 1) != 1) {
		printf("Reset Command Failed\r\n");
		return -1;
	}
	printf("INFO: Reset Target Success\n");

	return 0;
}
