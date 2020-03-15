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
#ifndef _BSL_HOST_H
#define _BSL_HOST_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h> 

#if 0
/* Defines for BSL Commands */
#define MSP430_I2C_MASSERASE    0x15
#define MSP430_I2C_READDATA     0x18
#define MSP430_I2C_SEGERASE     0x12
#define MSP430_I2C_BSLPASSWORD  0x11
#define MSP430_I2C_UNLOCKINFO   0x13
#define MSP430_I2C_SENDDATA     0x10
#define MSP430_I2C_SETPC        0x17
#define MSP430_I2C_CHECKCRC     0x16
#define MSP430_I2C_HEADER       0x80
#define MSP430_I2C_RESET        0x1C
#define MSP430_I2C_SUCCESS      0x01
#define MSP430_I2C_MESSAGE_RESP 0x3B
#define MSP430_I2C_CMD_RESP     0x3A
#define MSP430_I2C_ATTEMPTS     5
#define BUFFER_SIZE             1024
#define MSP430_MAX_CHUNK_SIZE   250

/* Largest Address on the bus */
#define MAX_I2C_ADDR            0xFE

/* Defines for response codes */
#define MSP430_STATUS_OPERATION_OK               0x00
#define MSP430_STATUS_PASSWORD_ERROR             0x05
#define MSP430_STATUS_TXTFILE_ERROR             0x101
#define MSP430_STATUS_RESET_ERROR               0x102
#define MSP430_STATUS_I2C_NOT_FOUND             0x103
#define MSP430_STATUS_I2C_TRANSACTION_ERROR     0x104
#define MSP430_STATUS_INVALID_RESP_HEADER       0x105
#define MSP430_STATUS_INVALID_RESP_LENGTH       0x106
#define MSP430_STATUS_INVALID_RESP_CRC          0x107
#define MSP430_STATUS_INVOKE_FAIL               0x108
#define MSP430_STATUS_VERIFICATION_FAIL         0x109

#define CRC16_POLY              0x1021
#define uintn_t                 UINTN

#define MSP430_I2C_SEGMENT_SIZE                 512
#define MSP430_RESET_VECTOR_ADDR                0xFFFE

/* Host Packet Structures */
typedef struct sI2CPayload
{
    uint8_t ui8Command;
    uint8_t ui8Addr_L;
    uint8_t ui8Addr_M;
    uint8_t ui8Addr_H;
    uint8_t* ui8pData;
} tI2CPayload;

typedef struct sI2CBSLPacket
{
    uint8_t ui8Header;
    uint16_t ui16Length;
    tI2CPayload tPayload;
    uint16_t ui16Checksum;
} tI2CBSLPacket;

/* Public Function ProtoTypes */
extern uint32_t MSP430BSL_sendData(uint8_t* data, uint32_t addr, uint32_t size);
extern uint32_t MSP430BSL_readData(uint8_t* inBuffer, uint32_t addr, 
                                                                uint32_t size);
extern uint32_t MSP430BSL_unlockDevice(uint8_t* password);
extern uint32_t MSP430BSL_massErase(void);
extern uint16_t MSP430BSL_checkCRC(uint32_t addr, uint32_t length, 
                                                        uint16_t* crcCalculate);
extern uint32_t MSP430BSL_invokeBSL(uint8_t* data, uint32_t length);
extern uint32_t MSP430BSL_setProgramCounter(uint16_t addr);

extern uint16_t calculateCRC16(uint8_t* data, uint32_t length);

#endif

int open_I2C(void);
int open_I2C_Wait_INT(void);
int close_I2C(void);

int updateApp(void);
uint32_t crc32(uint32_t crc, const void *buf, size_t size);
//void crc32(const void *data, size_t n_bytes, uint32_t* crc);

void CalculateCrc32( const unsigned char *address,unsigned int size, unsigned char *unCRC);
bool APP_I2CWriteRead(uint8_t* buf, uint32_t len, uint8_t* rbuf, uint32_t rlen);

int mxt_getinfo(void);
int mxt_update_app(void);

#endif /* BSLHOST */

