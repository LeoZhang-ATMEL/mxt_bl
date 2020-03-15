/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for bootloader project.

  Description:
    This file contains the "main" function for bootloader project.  Thesuccess
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
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

/* MSP430 Defines */
#include "i2cbsl.h"

/* Linux Defines */
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>
#include "blconfig.h"

/* Globals */
int i2c_file;
uint8_t *image_pattern = 0;
uint32_t app_image_size = 0;
extern uint32_t app_image_erase_size;
extern uint32_t app_image_start_addr;
extern uint8_t samd_i2c_addr;

#define MODE_BOOT     1
#define MODE_APP      2
#define MODE_MAXTOUCH 3

#define MODE_MXT_CMD_GET_INFO   1
#define MODE_MXT_CMD_UPDATE_APP 2
#define MODE_MXT_CMD_UPDATE_CFG 3
/* Statics */
uint8_t *DeviceI2CAddr;

static void printProgramUsage(void);
static int INT_PIN_int(void);
int INT_PIN_Read();

int main(int argc, char **argv)
{
    uint32_t                ii; 
    uint32_t                chunk_size;
    uint32_t                readChunk;
    uint32_t                operTarget;
    uint8_t                 operCmd;
    uint8_t*                pTarget;

    uint8_t*                pTXTName;
    bool                    skipInvoke;

    /* Initializing Variables */
    DeviceI2CAddr = NULL;
    skipInvoke = false;
    pTXTName = NULL;
    chunk_size = 16;
    readChunk = 0;
    pTarget = NULL;
    operTarget = 0;
    operCmd = 0;

    printf("\n---------------------------------------------------------------");
    printf("\n   Microchip I2C Linux BootLoader Host 1.00                    ");
    printf("\n---------------------------------------------------------------\n");

    if (INT_PIN_int()) {
    	return -1;
    }

    if(argc <= 1)
    {
        printProgramUsage();
        return 1;
    }

    /* Parsing the parameters */
    for(ii=1;ii<argc;ii++)
    {
    	if(strcmp("-t", argv[ii]) == 0)
		{
			if(ii == (argc-1))
			{
				printProgramUsage();
				return 1;
			}
			pTarget = argv[++ii];
			if (strcmp("boot", pTarget) == 0 || strcmp("b", pTarget) == 0) {
				operTarget = MODE_BOOT;
			} else if (strcmp("app", pTarget) == 0 || strcmp("a", pTarget) == 0 ) {
				operTarget = MODE_APP;
			} else if (strcmp("touch", pTarget) == 0 || strcmp("t", pTarget) == 0) {
				operTarget = MODE_MAXTOUCH;
			} else {
				printProgramUsage();
				return 1;
			}

		}
    	else if(strcmp("-a", argv[ii]) == 0)
		{
			if(ii == (argc-1) || ii == (argc-2))
			{
				printProgramUsage();
				return 1;
			}
			/* Parsing Size and Address */
			app_image_start_addr = strtoul(argv[++ii], NULL, 16);
			app_image_erase_size = strtoul(argv[++ii], NULL, 16);
		}
        else if(strcmp("-n", argv[ii]) == 0)
        {
            skipInvoke = true;
        }
        else if(strcmp("-f", argv[ii]) == 0)
        {
            if(ii == (argc-1))
            {
                printProgramUsage();
                return 1;
            }

            pTXTName = argv[++ii];
		}
        else if(strcmp("-i", argv[ii]) == 0)
        {
            if(ii == (argc-1))
            {
                printProgramUsage();
                return 1;
            }

            DeviceI2CAddr = argv[++ii];
            printf("INFO: I2C BUS %s specified\n", DeviceI2CAddr);
        }
        else if(strcmp("-s", argv[ii]) == 0)
        {
            if(ii == (argc-1))
            {
                printProgramUsage();
                return 1;
            }

            samd_i2c_addr = strtoul(argv[++ii],NULL,16);
            printf("INFO: Slave address 0x%x specified\n", samd_i2c_addr);
        }
        else if(strcmp("-c", argv[ii]) == 0)
		{
			if(ii == (argc-1))
			{
				printProgramUsage();
				return 1;
			}
			pTarget = argv[++ii];
			if (strcmp("info", pTarget) == 0 || strcmp("i", pTarget) == 0) {
				operCmd = MODE_MXT_CMD_GET_INFO;
			} else if (strcmp("fw", pTarget) == 0 || strcmp("f", pTarget) == 0 ) {
				operCmd = MODE_MXT_CMD_UPDATE_APP;
			} else if (strcmp("cfg", pTarget) == 0 || strcmp("c", pTarget) == 0) {
				operCmd = MODE_MXT_CMD_UPDATE_CFG;
			} else {
				printProgramUsage();
				return 1;
			}
		}
        else if(strcmp("-u", argv[ii]) == 0)
        {
            if(ii == (argc-1))
            {
                printProgramUsage();
                return 1;
            }

            chunk_size  = atoi(argv[++ii]);
            printf("INFO: Chunk size changed to %d bytes\n", chunk_size);

            if((chunk_size%16) != 0 || chunk_size == 0)
            {
                printf("ERROR: Chunk size must be divisible by 16!\n");
                return 1;
            }
        }
        else
        {
            printProgramUsage();
            return 1;
        }
    }

    if (operTarget == 0) {
    	printProgramUsage();
    	return 1;
    }

    if (operTarget == MODE_MAXTOUCH && operCmd == MODE_MXT_CMD_GET_INFO) { /* MaxTouch Get Info cmd */
    	mxt_getinfo();
    	return 0;
    }

	printf("INFO: Firmware file %s specified\n", pTXTName);
	FILE *fp = NULL;
	uint32_t fs;
	fp = fopen(pTXTName, "rb");
	fseek(fp, 0L, SEEK_END);
	fs = ftell(fp);

	if (operTarget == MODE_APP) {
		// Align image size with APP_PAGE_SIZE (256)
		if (fs % 256) {
			app_image_size = (256 * ((fs/256) + 1));
		}
		fseek(fp, 0L, SEEK_SET);
		if (app_image_erase_size < app_image_size) {
			printf("ERROR: Erase size(%d) must be more or equale file size(%d)!\n",
					app_image_erase_size, app_image_size);
			return 1;
		}
		image_pattern = (uint8_t *) malloc(app_image_erase_size);
		memset(image_pattern, 0xFF, app_image_erase_size);
		fread(image_pattern, fs, 1, fp);
		updateApp();
	}

	if (operTarget == MODE_MAXTOUCH && operCmd == MODE_MXT_CMD_UPDATE_APP) {
		app_image_size = fs;
		image_pattern = (uint8_t *) malloc(app_image_size);
		fseek(fp, 0L, SEEK_SET);
		fread(image_pattern, app_image_size, 1, fp);
	    mxt_update_app();
	}

    /* Doing some housekeeping */
    if (image_pattern) {
    	free(image_pattern);
    }

    return 0;
}

/**
 * Wait INT PIN for release to send next command
 * 1. If INT PIN was active (low), then Just wait for release (High)
 * 2. If INT PIN was release (high) when first check, then it's porbolly
 *    not been active yet, need give a timeout 1ms (or more) to wait.
 * Return 0: success, other fail
 */
static int wait_INT_Release(void)
{
	uint32_t wait = 0;

	if (INT_PIN_Read() == 0) { /* MCU Already been in process */
		while (INT_PIN_Read() == 0 && wait++ < 10000) {
			usleep(1);
		}
	}

	usleep(1);
	return (INT_PIN_Read() == 1)?0:1;
}

int open_I2C(void)
{
	if (samd_i2c_addr == 0) {
		samd_i2c_addr = APP_I2C_SLAVE_ADDR;
	}

	/* Open the I2C Protocol */
    if ((i2c_file = open(DeviceI2CAddr, O_RDWR)) < 0)
    {
        printf("ERROR: Could not open I2C driver. Trying running as root?\n");
        return -1;
    }
	if (ioctl(i2c_file, I2C_SLAVE, samd_i2c_addr) < 0) {
		printf("%s, %d, ioctl set i2c slave address(%02x) fail\n",
				__func__, __LINE__, samd_i2c_addr);
		return -1;
	}
    return 0;
}

int open_I2C_Wait_INT(void)
{
	if (wait_INT_Release() != 0) {
		printf("ERROR: Timeout Waiting for INT PIN Release.");
		return -1;
	}
	if (open_I2C()) {
		return -1;
	}
}
int close_I2C(void)
{
	/* Open the I2C Protocol */
	if (close(i2c_file)) {
		printf("ERROR: Could not open I2C driver. Trying running as root?\n");
		return -1;
	}
	return 0;
}

// MCU Interrupt IO: PB0

#define SYSFS_GPIO_EXPORT           "/sys/class/gpio/export"
#define SYSFS_GPIO_INT_PIN_VAL      "32"
#define SYSFS_GPIO_INT_DIR          "/sys/class/gpio/PB0/direction"
#define SYSFS_GPIO_INT_DIR_VAL      "in"
#define SYSFS_GPIO_INT_VAL          "/sys/class/gpio/PB0/value"

static int INT_PIN_int(void)
{
    int fd;

	 //Open Port
	 fd = open(SYSFS_GPIO_EXPORT, O_WRONLY);
	 if(fd == -1)  {
			   printf("ERR: Radio hard reset pin open error.\n");
			   return -1;
	 }
	 write(fd, SYSFS_GPIO_INT_PIN_VAL ,sizeof(SYSFS_GPIO_INT_PIN_VAL));
	 close(fd);

	 //Set IO Direction
	 fd = open(SYSFS_GPIO_INT_DIR, O_WRONLY);
	 if(fd == -1) {
			   printf("ERR: Radio hard reset pin direction open error.\n");
			   return -1;
	 }
	 write(fd, SYSFS_GPIO_INT_DIR_VAL, sizeof(SYSFS_GPIO_INT_DIR_VAL));
	 close(fd);

	 printf("INFO: Set INT PIN Success.\n");

	 return 0;
}

int INT_PIN_Read()
{
    int fd;
    char value_str[3];
    fd = open(SYSFS_GPIO_INT_VAL, O_RDONLY);

    if (fd < 0) {
        printf("Failed to open gpio value for reading!\n");
        return -1;
    }

    if (read(fd, value_str, 3) < 0) {
        printf("Failed to read value!\n");
        return -1;
    }

    close(fd);
    return (atoi(value_str));
}

static void printProgramUsage(void)
{
    printf("\n------Microchip Linux I2C Boot Loader Usage------\n");

    printf("\nmchp-i2cbsl <options> -t <type> -f <firmware> -i <bus-path> -s <slaveAddress>\n");

    printf("\n---Required Arguments---\n");
    printf("\n-t <type>                Upgrade target, b:bootloader, a:app, t:touch");
    printf("\n-f <firmware>            Binary file of firmware to program to MCU\n\n PLUS\n\n");
    printf("\n-i <bus-path>            I2C Bus Path (ie /dev/i2c-2)");
    printf("\n-s <slaveAddress>        I2C slave address (hex)");
    printf("\n-a <address (hex)> <legnth (dec)> Unlocked Address and length for operation/erase, Valid for bootloader and app.");
    printf("\n-c <cmd>                 Command for maxtouch, 1: Get info, 2: Upgrade maxtouch firmware");

    printf("\n\n---Additional Options---\n");
    printf("\n-u <chunksize>         Specifies the maximum chunk size for data program transactions.");
    printf("\n-v                     Perform a post verification on all memory programmed.");
    printf("\n-n Skip the invoke sequence.\n\n");
}

