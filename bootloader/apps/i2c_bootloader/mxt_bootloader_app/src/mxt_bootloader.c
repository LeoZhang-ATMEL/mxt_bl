/* ************************************************************************** */
/** mXTouch bootloader

  @Company
    Microchip Technology Inc.

  @File Name
    mxt_bootloader.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */
#include "definitions.h"
/* TODO:  Include other files here if needed. */
#include <stdio.h>
#include "mxt_bl_config.h"


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */
int global_data;

/* Bootloader mode status */
#define MXT_WAITING_BOOTLOAD_CMD    0xC0    /* valid 7 6 bit only */
#define MXT_WAITING_FRAME_DATA      0x80    /* valid 7 6 bit only */
#define MXT_FRAME_CRC_CHECK         0x02
#define MXT_FRAME_CRC_FAIL          0x03
#define MXT_FRAME_CRC_PASS          0x04
#define MXT_APP_CRC_FAIL            0x40    /* valid 7 6 bit only */
#define MXT_BOOT_EXTENDED_ID_MODE   0x20
#define MXT_BOOT_STATUS_MASK        0x3F

#define MXT_UPDATE_STATUS_Pos                    _U_(0x6)
#define MXT_UPDATE_STATUS_Msk                    (_U_(0x3) << MXT_UPDATE_STATUS_Pos)
#define MXT_UPDATE_STATUS_WAITING_BLCMD_Val      _U_(0xC0) 
#define MXT_UPDATE_STATUS_WAITING_FRAME_Val      _U_(0x80)
#define MXT_UPDATE_STATUS_APP_CRC_FAIL_Val       _U_(0x40)
#define MXT_UPDATE_STATUS(value)                 (MXT_UPDATE_STATUS_Msk & value)
#define MXT_UPDATE_STATUS_CRC_CHECK              _U_(0x02)
#define MXT_UPDATE_STATUS_CRC_FAIL               _U_(0x03)
#define MXT_UPDATE_STATUS_CRC_PASS               _U_(0x04)


/* Command to unlock bootloader */
#define MXT_UNLOCK_CMD_LSB	        0xDC
#define MXT_UNLOCK_CMD_MSB	        0xAA

/* MXT Object protocol */
#define MXT_ID_INFO_SIZE            7
#define MXT_OBJTBL_START            7
#define MXT_OBJTBL_ELEMENT_SIZE     6
#define MXT_INFO_CHECKSUM_SIZE      3

#define MXT_GEN_MESSAGEPROCESSOR_T5 5
#define MXT_GEN_COMMANDPROCESSOR_T6 6
#define MXT_SPT_MESSAGECOUNT_T44    44

/* Returned by get_object_address() if object is not found */
#define OBJECT_NOT_FOUND            -1

/* MXT_GEN_COMMANDPROCESSOR_T6 field */
#define MXT_COMMAND_RESET       0
#define MXT_COMMAND_BACKUPNV    1
#define MXT_COMMAND_CALIBRATE   2
#define MXT_COMMAND_REPORTALL   3
#define MXT_COMMAND_DIAGNOSTIC  5

struct mxt_id_info {
	uint8_t family_id;
	uint8_t variant_id;
	uint8_t version;
	uint8_t build;
	uint8_t matrix_xsize;
	uint8_t matrix_ysize;
	uint8_t object_num;
} __attribute__((packed));

typedef struct
{
    uint32_t indexOfFrameBuf; /* index of bl_inbuf[BL_INBUF_LEN] */
    uint32_t currentFrameLength; /* Current Frame Length: 2byte + (DATA + CRC) */
    uint32_t mxtImageLength;
    uint32_t mxtImageRemind;
} MXT_BL_PROTOCOL;

// *****************************************************************************
// *****************************************************************************
// Section: Global objects
// *****************************************************************************
// *****************************************************************************

static MXT_BL_PROTOCOL mxtBlProtocol;


/* Bootloader input and output buffer, the buffer will used for hold maxtouch
 * firmware upgrade. And the length should enough to fit one maxTouch frame
 * (MXT_MAX_FRAME_LEN) plus one Host frame (BL_MXT_DATA_SIZE)
 */
uint8_t bl_inbuf[BL_INBUF_LEN];
uint8_t mxt_read_buf[MXT_I2C_RXBUF_LEN];
uint8_t mxt_write_buf[MXT_I2C_TXBUF_LEN];

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */


/* ************************************************************************** */

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
//static int ExampleLocalFunction(int param1, int param2) {
//    return 0;
//}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

void mxt_start_firmware_upgrade(uint32_t len)
{
    mxtBlProtocol.indexOfFrameBuf = 0;
    mxtBlProtocol.currentFrameLength = 0;
    mxtBlProtocol.mxtImageLength = len;
    mxtBlProtocol.mxtImageRemind = len;
}

/*
 * Force the maxTouch controller reset by reset line.
 */
void mxt_hardware_reset(void)
{
	CTP_RESET_Clear(); /* Drive RESET low */
    SYSTICK_DelayMs(1);
    CTP_RESET_Set();
    /* Wait for approx 105 milliseconds (93 millisecs in spec) */
    SYSTICK_DelayMs(200); /* Delay 200ms (double the spec 93ms) to wait MaxTouch Ready */

	return ;
}


/*
 * MaxTouch I2C driver for write and read.
 * 1. Init I2C as Master.
 * 2. Read from MXTouch
 * 3. Init I2C as Slave.
 */
int mxt_i2c_write_read(uint8_t i2c_addr, uint8_t *wbuf, uint32_t wlen, uint8_t *rbuf, uint32_t rlen)
{

    if (wlen && rlen) {
        SERCOM2_I2C_WriteRead(i2c_addr, wbuf, wlen, rbuf, rlen);
    }
    else if (wlen) {
        SERCOM2_I2C_Write(i2c_addr, wbuf, wlen);
    } else {
        SERCOM2_I2C_Read(i2c_addr, rbuf, rlen);
    }

    /* Poll and wait for the transfer to complete */
    while(SERCOM2_I2C_IsBusy());

    /* Check if any error occurred */
    if(SERCOM2_I2C_ErrorGet() == SERCOM_I2C_ERROR_NONE)
    {
        return 0;
    }
    else
    {
        return -1;
    }

	return 0;
}

/** 
  @Function
    int mxt_read_info_by_host ( void ) 

  @Summary
    Brief Read MaxTouch information
    Information includes:
    -  7 bytes MXT ID information
    - 3 bytes config CRC

  @Remarks
    Refer to the example_file.h interface header for function usage details.
 */
#if 0
void mxt_read_info_by_host(void)
{
	uint32_t i;
	uint32_t crc;

	/* Ack cmd */
	bl_send_ack('s');

	/* Read ID information */
	/* First try to read with application I2C address */
	if (mxt_read_register(mxt_dev.i2c_addr_app, (void *)bl_outbuf, 0, 7) != 0) {
		/* If fail, then try to read with bootloader I2C address */
		if (mxt_read_register(mxt_dev.i2c_addr_bl, (void *)bl_outbuf, 0, 7) != 0) {
			for (i = 0; i < 7; i++) {
				bl_outbuf[i] = 0;
			}
		}
	}

	/* Read config CRC */
	mxt_get_config_crc(&crc);
	bl_outbuf[7] = crc & 0xFF;
	bl_outbuf[8] = (crc >> 8) & 0xFF;
	bl_outbuf[9] = (crc >> 16) & 0xFF;

	bl_send_buf(bl_outbuf, (7+3));
}

#endif

void mxt_buf_reset(void)
{
    uint32_t i;
    for (i = 0; i < MXT_I2C_RXBUF_LEN; i++) {
        mxt_read_buf[i] = 0x00;
        mxt_write_buf[i] = 0x00;
    }
}

/**
 * 
 * @return 0: App mode, 1: BootLoader, -1: Fail
 */
int8_t mxt_init(void)
{
    struct mxt_id_info *info;

    /* Hardware reset */
    mxt_hardware_reset();
    mxt_buf_reset();
    
    if (CTP_CHG_Get() == 0) { // Ops, MaxTouch firmware CRC failed?
        if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, NULL, 0, mxt_read_buf, 1) != 0) { // No valid firmware? maybe in bootloader mode.
            goto app_mode;
        }
        if ((mxt_read_buf[0] &= MXT_APP_CRC_FAIL) == 0) {
            return -1; /* No sure what's going on */
        }
        if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, NULL, 0, mxt_read_buf, 3) != 0) {
            return -1; /* No sure what's going on */
        }
        if ((mxt_read_buf[0] &= MXT_APP_CRC_FAIL) == 0) {
            return -1; /* No sure what's going on */
        }
        /* We are in bootloader mode, and APP CRC Check failed, the extend ID (bootloader version) now in byte 1 and 2 */
        return 1;
    }

app_mode:

    if (mxt_i2c_write_read(MXT_I2C_ADDR_APP, mxt_read_buf, 2, mxt_read_buf, MXT_ID_INFO_SIZE) == 0) {
        info = (struct mxt_id_info *) mxt_read_buf;
        if (info->family_id != 0x00) {
            return 0;
        }
    }
    
    return -1;
}

void mxt_set_bootloader_len(uint32_t len)
{
    mxtBlProtocol.mxtImageLength = len;
    mxtBlProtocol.mxtImageRemind = len;
}

/*
 * Wait CHG PIN with timeout,
 * 
 * parm state: 0: active, 1 inactive
 * 
 * 0: OK, -1 timeout
 */
static int mxt_wait_CHG(uint32_t state, uint32_t timeout)
{
    for (; timeout > 0; timeout--) {
        if (CTP_CHG_Get() == state) {
            return 0;
        }
    }
    return -1;
}

static int mxt_wait_Status(uint8_t val, uint32_t timeout)
{
    for (; timeout > 0; timeout--) {
        if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, NULL, 0, mxt_read_buf, 1) != 0) {
            continue;
        }
        if (val == MXT_UPDATE_STATUS_WAITING_BLCMD_Val
            || val == MXT_UPDATE_STATUS_WAITING_FRAME_Val
            || val == MXT_UPDATE_STATUS_APP_CRC_FAIL_Val
                )
        {
            if (MXT_UPDATE_STATUS(mxt_read_buf[0]) == val) {
                return 0;
            }
        } else {
            if (mxt_read_buf[0] == val) {
                return 0;
            }
        }
    }
    return -1;
}

/*
 * Force chip bootloader mode by toggling the RESET line.
 * This is done ten times (QTAN0051)
 */
int mxt_enter_boatloader_mode(void)
{
	uint32_t i;
    uint32_t j;

	for (i = 0; i < 10; i++) {
		/* Drive RESET low */
        CTP_RESET_Clear();

		/* Wait for approx 15us (spec says 1usec) */
        for (j = 0; j < 15; j++) {
            asm("nop");
        }

		/* Drive RESET high */
        CTP_RESET_Set();

		/* Wait for 55 milliseconds (spec says 50) */
		SYSTICK_DelayMs(55);
	}

	/* Wait for approx 105 milliseconds (100 millisecs in spec) */
	SYSTICK_DelayMs(50);

    if (CTP_CHG_Get() == 1) { /* App CRC Check Fail */
        /* Check app crc fail mode (just read to let CHG line go high in case of) */
        if (mxt_wait_Status(MXT_UPDATE_STATUS_APP_CRC_FAIL_Val, 1)) {
            return -1;
        }
    }
    if (mxt_wait_CHG(0, 100)) { // Wait for bootloader ready for communication
        return -1;
    }

    /* Wait for WAITING_BOOTLOAD_CMD Mode */
    if (mxt_wait_Status(MXT_UPDATE_STATUS_WAITING_BLCMD_Val, 100)) {
        return -1;
    }

	/* Send UNLOCK command */
	mxt_write_buf[0] = MXT_UNLOCK_CMD_LSB;
	mxt_write_buf[1] = MXT_UNLOCK_CMD_MSB;
	if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, mxt_write_buf, 2, NULL, 0) != 0) {
		return -1;
	}
    
    /* The MaxTouch currently still under Decryption algorithm initialization,
     * about need 25ms (CHG from inactive to active).
     * just let it going and start to transfer data from Host.
     * This can improve performance.
     */

	return 0;
}

/*
 * Write application firmware frame, (MXTAN2016, 1.3 Bootloading Sequence)
 */
int mxt_write_firmware_frame(void)
{
	/* Check the WAITING_FRAME_DATA Status, Waiting maxtouch Frame Decryption
     * and processing
     */
    mxt_wait_CHG(0, 100000); /***************** Wait Frame decryption and processing */

    if (mxt_wait_Status(MXT_UPDATE_STATUS_WAITING_FRAME_Val, 100000)) {
        goto wr_fw_error;
    }
    
    mxt_wait_CHG(1, 100000); /***************** Waiting before written entire frame */

	/* Write frame */
	if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, bl_inbuf, mxtBlProtocol.currentFrameLength, NULL, 0) != 0) {
		goto wr_fw_error;
	}

    mxt_wait_CHG(0, 100000); /***************** Wait before Read Status */

    if (mxt_wait_Status(MXT_UPDATE_STATUS_CRC_CHECK, 1)){
        goto wr_fw_error;
    }
    mxt_wait_CHG(1, 100000); /***************** Frame CRC Checking */
    /* Frame CRC Checking */
    mxt_wait_CHG(0, 100000); /***************** Frame CRC Finished */

    if (mxt_i2c_write_read(MXT_I2C_ADDR_BL, NULL, 0, mxt_read_buf, 1) != 0) {
		goto wr_fw_error;
	}
    if (mxt_read_buf[0] == MXT_UPDATE_STATUS_CRC_PASS) {
        
    } else if (mxt_read_buf[0] == MXT_UPDATE_STATUS_CRC_PASS) {
        
    } else {
        goto wr_fw_error;
    }
    mxt_wait_CHG(1, 100000); /***************** wait CHG inactive (Start Frame decryption and processing) */
    
    return 0;

wr_fw_error:
	return -1;
}

/**
 * Upgrade maxtouch firmware (BUFFER), max length was the BL_MXT_DATA_SIZE.
 * 
 * This function cannot operate I2C, since this function was been invoked from 
 * I2C Slave ISR, Only update buffer. And if the maxtouch frame buffer was ready
 * to send out, This function will move the state machine to next stage.
 * 
 * @param buf Firmware Data to be programmed into MaxTouch 
 * @param len Data length
 * @return 0: success, 1: frame ready. other value: fail
 */
int mxt_upgrade_firmware(uint8_t *buf, uint8_t len)
{
    uint8_t ind = 0;
    uint32_t left_len;

    if (len > BL_MXT_DATA_SIZE
            || (mxtBlProtocol.mxtImageRemind == 0)
            || (mxtBlProtocol.mxtImageLength == 0)
            || (len > mxtBlProtocol.mxtImageRemind)
            ) {
        return -1;
    }
    
    // Copy data to the buffer
    for (ind = 0; ind < len; ind++) {
        bl_inbuf[mxtBlProtocol.indexOfFrameBuf++] = buf[ind];
    }

frame_check:
    if (mxtBlProtocol.currentFrameLength == 0 && mxtBlProtocol.indexOfFrameBuf >= 2) {
        /* The length (2bytes) be count in by add 2 here */
        mxtBlProtocol.currentFrameLength = bl_inbuf[1] + (bl_inbuf[0] << 8) + 2;
    }
    
    if ((mxtBlProtocol.indexOfFrameBuf >= mxtBlProtocol.currentFrameLength)
            && (mxtBlProtocol.currentFrameLength > 0)
            ) {
        if (mxt_write_firmware_frame()) {
            return -1;
        }
        
        /* Copy remind data to the header of the buffer */
        left_len = mxtBlProtocol.indexOfFrameBuf - mxtBlProtocol.currentFrameLength;
        for (ind = 0; ind < left_len; ind++) { // Copy data to top of the buf
            bl_inbuf[ind] = bl_inbuf[mxtBlProtocol.currentFrameLength + ind];
        }
        mxtBlProtocol.mxtImageRemind -= mxtBlProtocol.currentFrameLength;
        mxtBlProtocol.indexOfFrameBuf = left_len;
        mxtBlProtocol.currentFrameLength = 0;
        goto frame_check;
    }

    return 0;
}

/******************************************************************************
 End of File
 */
