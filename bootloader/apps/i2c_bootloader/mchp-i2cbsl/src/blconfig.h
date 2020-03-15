/*
 * blconfig.h
 *
 *  Created on: Mar 13, 2020
 *      Author: Leo Zhang
 */

#ifndef BLCONFIG_H_
#define BLCONFIG_H_

#define APP_I2C_SLAVE_ADDR 0x54
/* TARGET MCU SIZE 64K Default for SAMDA1J16B */
#define APP_FLASH_SIZE (0x10000)
#define APP_ERASE_PAGE_SIZE (256L)
/* This example programs all the pages in an erase row in one shot. In case the
 * embedded host has limited RAM, the APP_PROGRAM_PAGE_SIZE macro can be set to
 * the actual program page size (64 or 512) to reduce the RAM used to hold the
 * program data.
 */
#define APP_PROGRAM_PAGE_SIZE (64)
#define APP_PROTOCOL_HEADER_MAX_SIZE 9

#define MAX_BOOTLOADER_UNLOCK_SEQ 0xD70AB35C
#endif /* BLCONFIG_H_ */
