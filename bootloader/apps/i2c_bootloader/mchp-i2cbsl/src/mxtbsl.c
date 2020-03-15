/*
 * mxtbsl.c
 *
 *  Created on: Mar 13, 2020
 *      Author: Leo Zhang
 */
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>

#include "i2cbsl.h"
#include "blconfig.h"

typedef enum
{
    BL_COMMAND_READ_INFO = 0xC0,   /* NO ARG */
    BL_COMMAND_UNLOCK = 0xC1,      /* Unlock maxtouch bootloader */
    BL_COMMAND_PROGRAM = 0xC2,     /* NUM_BYTES3-0, DATA0-n*/
    BL_COMMAND_RESET_MXT = 0xC3,   /* NO ARG, will delay 500ms to let Host get status */
    BL_COMMAND_RESET_MCU = 0xC4,   /* NO ARG, Reset immediate */
    BL_COMMAND_READ_STATUS = 0xC5, /* NO ARG */
    BL_COMMAND_MAX
} MXT_BL_COMMAND;

typedef enum
{
    BL_STATUS_NO_ERROR = 0,
    BL_STATUS_INVALID_COMMAND,
    BL_STATUS_INVALID_LENGTH,
    BL_STATUS_INVALID_ARG,
    BL_STATUS_MXT_EXECUTION_ERROR,
    BL_STATUS_MXT_FW_CRC_ERROR,
}BL_STATUS;

struct mxt_id_info {
	uint8_t family_id;
	uint8_t variant_id;
	uint8_t version;
	uint8_t build;
	uint8_t matrix_xsize;
	uint8_t matrix_ysize;
	uint8_t object_num;
} __attribute__((packed));

extern int i2c_file;
extern uint8_t samd_i2c_addr;
extern uint32_t app_image_size;
extern uint8_t *image_pattern;

/**
 * Read Status
 * Return true: success
 */
static bool MXT_ReadStatus(void)
{
	uint32_t wait = 500; // 500ms
	uint8_t rd = BL_COMMAND_READ_STATUS;
	uint8_t status;

	while (1) {
		if (APP_I2CWriteRead(&rd, 1,  &status, 1)) {
			if (status == BL_STATUS_NO_ERROR) {
				return true;
			} else if (status == BL_STATUS_INVALID_COMMAND) {
				printf("MAXTOUCH: Invalid Command, ret(0x%02X)\n", status);
				return false;
			} else if (status == BL_STATUS_INVALID_LENGTH) {
				printf("MAXTOUCH: Invalid Length, ret(0x%02X)\n", status);
				return false;
			} else if (status == BL_STATUS_INVALID_ARG) {
				printf("MAXTOUCH: Invalid ARG, ret(0x%02X)\n", status);
				return false;
			} else if (status == BL_STATUS_MXT_EXECUTION_ERROR) {
				printf("MAXTOUCH: Execute error, ret(0x%02X)\n", status);
				return false;
			} else {
				printf("MAXTOUCH: Unknown status, ret(0x%02X)\n", status);
			}
			return false;
		} else {
			usleep(1000); // Sleep nano sleep
			if (--wait == 0) {
				printf("Read Status timeout\n");
				return false;
			}
		}
	}

	return false;
}

static uint32_t MXT_ImageDataWrite(uint8_t *buf, int32_t curPos, uint32_t nBytes)
{
    uint32_t k;
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = BL_COMMAND_PROGRAM;
    buf[nTxBytes++] = (nBytes >> 24);
    buf[nTxBytes++] = (nBytes >> 16);
    buf[nTxBytes++] = (nBytes >> 8);
    buf[nTxBytes++] = (nBytes);

    for (k = 0; k < nBytes; k++, nTxBytes++)
    {
        buf[nTxBytes] = image_pattern[curPos + k];
    }

    return nTxBytes;
}

static uint32_t MXT_GetInfoCommandSend(uint8_t *buf)
{
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = BL_COMMAND_READ_INFO;

    return nTxBytes;
}

static uint32_t MXT_UnlockCommandSend(uint8_t *buf)
{
    uint32_t nTxBytes = 0;

    buf[nTxBytes++] = BL_COMMAND_UNLOCK;
    buf[nTxBytes++] = (uint8_t)(MAX_BOOTLOADER_UNLOCK_SEQ >> 24);
    buf[nTxBytes++] = (uint8_t)(MAX_BOOTLOADER_UNLOCK_SEQ >> 16);
    buf[nTxBytes++] = (uint8_t)(MAX_BOOTLOADER_UNLOCK_SEQ >> 8);
    buf[nTxBytes++] = (uint8_t)(MAX_BOOTLOADER_UNLOCK_SEQ);

    buf[nTxBytes++] = (app_image_size >> 24);
    buf[nTxBytes++] = (app_image_size >> 16);
    buf[nTxBytes++] = (app_image_size >> 8);
    buf[nTxBytes++] = (app_image_size);

    return nTxBytes;
}

int mxt_getinfo(void)
{
	uint32_t nTxBytes;
	uint32_t curAddr;
	uint8_t buf[APP_PROGRAM_PAGE_SIZE + APP_PROTOCOL_HEADER_MAX_SIZE];
	uint32_t crc = 0;
	struct mxt_id_info *info;

	info = (struct mxt_id_info *)(buf + 1);

	if (samd_i2c_addr == 0) {
		samd_i2c_addr = APP_I2C_SLAVE_ADDR;
	}

	if (open_I2C_Wait_INT()) {
		return -1;
	}

	printf("MAXTOUCH: Send Get Info command\n");
	nTxBytes = MXT_GetInfoCommandSend(buf);
    if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
		printf("MAXTOUCH: Fail send get Info command\n");
		return -1;
	}
    close_I2C();

	if (open_I2C_Wait_INT()) {
		return -1;
	}
    if (read(i2c_file, buf, sizeof(struct mxt_id_info) + 1) != sizeof(struct mxt_id_info) + 1) {
		printf("RMAXTOUCH: Fail read Info command\n");
		return -1;
	}
    printf("\n\t MAXTOUCH Chip Info Read %s\n", (buf[0] == 0)? "Success" : "Failed");
    printf("MAXTOUCH: family_id\t 0x%02X\n", info->family_id);
    printf("MAXTOUCH: variant_id\t 0x%02X\n", info->variant_id);
    printf("MAXTOUCH: version\t 0x%02X\n", info->version);
    printf("MAXTOUCH: build\t\t 0x%02X\n", info->build);
    printf("MAXTOUCH: matrix_xsize\t 0x%02X\n", info->matrix_xsize);
    printf("MAXTOUCH: matrix_ysize\t 0x%02X\n", info->matrix_ysize);
	printf("MAXTOUCH: object_num\t 0x%02X\n", info->object_num);

	return 0;
}

int mxt_update_app(void)
{
	uint32_t nTxBytes;
	uint32_t curAddr;
	uint8_t buf[APP_PROGRAM_PAGE_SIZE + APP_PROTOCOL_HEADER_MAX_SIZE];
	uint32_t crc = 0;
	ssize_t ret;
	struct timeval starttime,endtime;

	struct mxt_id_info *info;

	info = (struct mxt_id_info *)buf;

	if (samd_i2c_addr == 0) {
		samd_i2c_addr = APP_I2C_SLAVE_ADDR;
	}

	gettimeofday(&starttime,0);

	if (open_I2C_Wait_INT()) {
		return -1;
	}

	printf("MAXTOUCH: Send Unlock command\n");
	nTxBytes = MXT_UnlockCommandSend(buf);
    if (write(i2c_file, buf, nTxBytes) != nTxBytes) {
		printf("MAXTOUCH: Fail Send Unlock Command\n");
		return -1;
	}
    close_I2C();

	if (open_I2C_Wait_INT()) {
		return -1;
	}

    if (MXT_ReadStatus()) {
    	printf("MAXTOUCH: Unlock Success\n");
    } else {
    	printf("MAXTOUCH: Unlock Failed\n");
    }

	/* Write App Image */
    printf("MAXTOUCH: Start Programming\n");
	curAddr = 0;
	while (curAddr < app_image_size) {
		nTxBytes = APP_PROGRAM_PAGE_SIZE;
		if ((app_image_size - curAddr) < APP_PROGRAM_PAGE_SIZE) {
			nTxBytes = app_image_size - curAddr;
		}
		nTxBytes = MXT_ImageDataWrite(buf, curAddr, nTxBytes);
		ret = write(i2c_file, buf, nTxBytes);
		close_I2C();

		if (ret != nTxBytes) {
			printf("Write Command Failed\r\n");
			return -1;
		}
		usleep(1);

		if (open_I2C_Wait_INT()) {
			return -1;
		}
		if (!MXT_ReadStatus()) {
			return -1;
		}
		curAddr += APP_PROGRAM_PAGE_SIZE;
	}

	gettimeofday(&endtime,0);
	uint32_t timeuse  = endtime.tv_sec - starttime.tv_sec;
	printf("Program MaxTouch Firmware Success, length %d bytes, Speed %d Bytes/Sec\n", app_image_size, app_image_size/timeuse);


	return 0;
}
