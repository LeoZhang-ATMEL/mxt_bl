/*******************************************************************************
  MaxTouch Bootloader Config Header File

  File Name:
    mxt_bl_config.h

  Summary:
    This file contains Interface definitions of bootloder

  Description:
    This file defines interface for MaxTouch bootloader.
 *******************************************************************************/


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

/* Buffer length for hold a complete maxtouch upgrade frame, the append 2 bytes was enc file frame length header */
#define BL_INBUF_LEN  (BL_MXT_DATA_SIZE + MXT_MAX_FRAME_LEN + 2)

#endif /* MXT_BL_CONFIG_H */