/*******************************************************************************
  MaxTouch Bootloader Config Header File

  File Name:
    mxt_bl_config.h

  Summary:
    This file contains Interface definitions of bootloder

  Description:
    This file defines interface for MaxTouch bootloader.
 *******************************************************************************/

#ifdef SAMDA1_XPRO
    #include "plib_sercom2_i2c_slave.h"
    /* I2C Slave */
    #define BL_I2CS_Initialize SERCOM2_I2CS_Initialize
    #define BL_I2CS_InterruptFlagsGet SERCOM2_I2CS_InterruptFlagsGet
    #define BL_I2CS_TransferDirGet SERCOM2_I2CS_TransferDirGet
    #define BL_I2CS_CommandSet SERCOM2_I2CS_CommandSet
    #define BL_I2CS_ReadByte SERCOM2_I2CS_ReadByte
    #define BL_I2CS_LastByteAckStatusGet SERCOM2_I2CS_LastByteAckStatusGet
    #define BL_I2CS_InterruptFlagsClear SERCOM2_I2CS_InterruptFlagsClear
    #define BL_I2CS_WriteByte SERCOM2_I2CS_WriteByte
    /* I2C Master */
    #define BL_I2C_Initialize SERCOM2_I2C_Initialize
    #define BL_I2C_WriteRead SERCOM2_I2C_WriteRead
    #define BL_I2C_Write SERCOM2_I2C_Write
    #define BL_I2C_Read SERCOM2_I2C_Read
    #define BL_I2C_IsBusy SERCOM2_I2C_IsBusy
    #define BL_I2C_ErrorGet SERCOM2_I2C_ErrorGet
#else
    #include "plib_sercom5_i2c_slave.h"
    #define LED_Clear()
    /* I2C Slave */
    #define BL_I2CS_Initialize SERCOM5_I2CS_Initialize
    #define BL_I2CS_InterruptFlagsGet SERCOM5_I2CS_InterruptFlagsGet
    #define BL_I2CS_TransferDirGet SERCOM5_I2CS_TransferDirGet
    #define BL_I2CS_CommandSet SERCOM5_I2CS_CommandSet
    #define BL_I2CS_ReadByte SERCOM5_I2CS_ReadByte
    #define BL_I2CS_LastByteAckStatusGet SERCOM5_I2CS_LastByteAckStatusGet
    #define BL_I2CS_InterruptFlagsClear SERCOM5_I2CS_InterruptFlagsClear
    #define BL_I2CS_WriteByte SERCOM5_I2CS_WriteByte
    /* I2C Master */
    #define BL_I2C_Initialize SERCOM5_I2C_Initialize
    #define BL_I2C_WriteRead SERCOM5_I2C_WriteRead
    #define BL_I2C_Write SERCOM5_I2C_Write
    #define BL_I2C_Read SERCOM5_I2C_Read
    #define BL_I2C_IsBusy SERCOM5_I2C_IsBusy
    #define BL_I2C_ErrorGet SERCOM5_I2C_ErrorGet
#endif

#ifndef MXT_BL_CONFIG_H
#define MXT_BL_CONFIG_H

/* Max Host frame length from Host (exclude Header) */
#define BL_MXT_DATA_SIZE 64

/* Max maxTouch frame length send to MaxTouch */
#define MXT_MAX_FRAME_LEN 276

/* MXT device I2C address, define it according to your device */
#define MXT_I2C_ADDR_BL             0x26    /* MXT641 - 0x26 */
#define MXT_I2C_ADDR_APP            0x4A    /* MXT641 - 0x4A */

#define MXT_OBJECT_TABLE_MAX        80      /* Define it according to your MXT device */
#define MXT_REPORT_ID_MAX           128     /* Define it according to your MXT device */

#define MXT_I2C_RETRY_TIMES         5
#define MXT_CHG_WAIT_TIMEOUT        10000

#define MXT_I2C_RXBUF_LEN           256
#define MXT_I2C_TXBUF_LEN           256

#define MXT_CMD_PASSWORD             0xD70AB35C /* Password used for unlock matouch, Reset MCU */

/* Buffer length for hold a complete maxtouch upgrade frame, the append 2 bytes was enc file frame length header */
#define BL_INBUF_LEN  (BL_MXT_DATA_SIZE + MXT_MAX_FRAME_LEN + 2)

#endif /* MXT_BL_CONFIG_H */