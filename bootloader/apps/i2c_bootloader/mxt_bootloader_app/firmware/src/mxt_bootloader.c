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
#include <string.h>


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
#define MXT_OBJ_HDR_SIZE            6

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

/* Define for MXT_GEN_COMMANDPROCESSOR_T6 */
#define MXT_BOOT_VALUE          0xA5
#define MXT_RESET_VALUE         0x01
#define MXT_BACKUP_VALUE        0x55
#define MXT_REPORTALL_VALUE     0x01   /* Non-zero value */

/*
 * MaxTouch Protocol, Chip Info.
 * Reference to Protocol Guide (I2C) for mXT1067TD-AT 1.0
 * Section 1.2 Memory Map Structure
 */
struct mxt_id_info {
    /* 
     * A unique identifier that indicates the device family. The family ID for
     * the mXT1067TD-AT is 0xA4.
     */
	uint8_t family_id;
	/* 
     * A unique identifier that indicates the device variant. The variant ID
     * for the mXT1067TD-AT is 0x3D.
     */
    uint8_t variant_id;
    /*
     * The current major and minor firmware version of the device. The upper 
     * nibble contains the major version and the lower nibble contains the
     * minor version. For example, firmware version 1.0 is stored as 0x10.
     */
	uint8_t version;
    /* The firmware build number. */
	uint8_t build;
	uint8_t matrix_xsize;
	uint8_t matrix_ysize;
	uint8_t object_num;
} __attribute__((packed));

/*
 * The Object Table is held within the Information Block. The Object Table
 * contains information on all the objects held within the memory map.
 * It indicates which objects are present and their addresses.
 * Reference to Protocol Guide (I2C) for mXT1067TD-AT 1.0
 * Section 1.5 Object Table
 * Each element in the Object Table has the fields listed in this struct.
 */
struct mxt_object_config {
	uint8_t type;                  /* Object type ID */
	uint8_t start_pos_lsb;         /* LSByte of the start address of the obj config structure */
	uint8_t start_pos_msb;         /* MSByte of the start address of the obj config structure */
	uint8_t size_minus_one;        /* Byte length of the obj config structure - 1 */
	uint8_t instances_minus_one;   /* Number of objects of this obj. type - 1 */
	uint8_t num_report_ids;        /* Number of Report IDs per instance. The max number of touches in a screen, max number of sliders in a slider array, etc.*/
} __attribute__((packed));

/*
 * The Object Table is held within the Information Block. The Object Table
 * contains information on all the objects held within the memory map.
 * It indicates which objects are present and their addresses.
 * Reference to Protocol Guide (I2C) for mXT1067TD-AT 1.0
 * Section 1.5 Object Table
 * Each element in the Object Table has the fields listed in this struct.
 */
struct mxt_object_config_instance {
	uint16_t type;         /* Object type ID */
	uint16_t instance;     /* Instance number */
	uint16_t size;         /* Length */
} __attribute__((packed));

/*
 * \brief Struct holding the object type / instance info.
 *
 * Struct holding the object type / instance info. An array of these maps
 * report id's to object type / instance (array index = report id).  Note
 * that the report ID number 0 is reserved.
 */
struct mxt_report_id_map {
	uint16_t object_type;  /* Object type */
	uint8_t instance;      /* Instance number */
};

/* MXT device context */
struct mxt_device {
	struct mxt_id_info           id_info;
    uint32_t                     cfgcrc;
	struct mxt_object_config     object_table[MXT_OBJECT_TABLE_MAX];
	struct mxt_report_id_map     report_id_map[MXT_REPORT_ID_MAX];
	uint8_t                      max_report_id;
	uint8_t                      i2c_addr_bl;
	uint8_t                      i2c_addr_app;
	bool                         app_mode; /* app mode or bootloader mode */
    bool                         cfg_header_init; /* CFG header received */
};

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

struct mxt_device mxt_dev;

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
int mxt_read_register(uint8_t *buf, uint16_t start_reg, uint16_t count);
static int mxt_calc_report_ids(void);
static int32_t mxt_get_config_crc(uint32_t *cs_out);
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
        BL_I2C_WriteRead(i2c_addr, wbuf, wlen, rbuf, rlen);
    }
    else if (wlen) {
        BL_I2C_Write(i2c_addr, wbuf, wlen);
    } else {
        BL_I2C_Read(i2c_addr, rbuf, rlen);
    }

    /* Poll and wait for the transfer to complete */
    while(BL_I2C_IsBusy());

    /* Check if any error occurred */
    if(BL_I2C_ErrorGet() == SERCOM_I2C_ERROR_NONE)
    {
        return 0;
    }
    else
    {
        return -1;
    }

	return 0;
}

void mxt_buf_reset(void)
{
    uint32_t i;
    for (i = 0; i < MXT_I2C_RXBUF_LEN; i++) {
        mxt_read_buf[i] = 0x00;
        mxt_write_buf[i] = 0x00;
    }
    for (i = 0; i < sizeof(struct mxt_device); i++) {
        ((uint8_t *)(&mxt_dev))[i] = 0;
    }
}

uint8_t mxt_get_info(uint32_t ind)
{
    if (ind < sizeof(struct mxt_id_info)) {
        return *(((uint8_t *) (&(mxt_dev.id_info))) + ind);
    } else if (ind < (sizeof(struct mxt_id_info) + 4)) {
        return *(((uint8_t *) (&(mxt_dev.cfgcrc))) + (ind - sizeof(struct mxt_id_info)));
    }
    return 0;
}
/**
 * Do hardware Reset for MaxTouch Chip.
 * Read Chip Info and Object Table, the Object Table was optionally just in
 * case no valid firmware in the MaxTouch, it can be fetch again when download
 * configuration
 * 
 * @return 0: App mode, 1: BootLoader, -1: Fail
 */
int8_t mxt_init(void)
{
    struct mxt_id_info *info;

    /* Hardware reset */
    mxt_hardware_reset();
    mxt_buf_reset();
    
    if (mxt_i2c_write_read(MXT_I2C_ADDR_APP, mxt_read_buf, 2, mxt_read_buf, MXT_ID_INFO_SIZE) == 0) {
        info = (struct mxt_id_info *) mxt_read_buf;
        if (info->family_id != 0x00) {
            memcpy((uint8_t *) (&(mxt_dev.id_info)), (uint8_t *)info, sizeof(struct mxt_id_info));
            /* Read Object table */
            if (mxt_read_register((void *)mxt_dev.object_table,
                        MXT_OBJTBL_START,
                        mxt_dev.id_info.object_num * MXT_OBJTBL_ELEMENT_SIZE) != 0)
            {
                return -1;
            }
            mxt_calc_report_ids();
            mxt_get_config_crc(&mxt_dev.cfgcrc);
            return 0;
        }
    }

    //if (CTP_CHG_Get() == 0) { // Ops, MaxTouch firmware CRC failed?
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
        //return 1;
    //}

app_mode:

    if (mxt_i2c_write_read(MXT_I2C_ADDR_APP, mxt_read_buf, 2, mxt_read_buf, MXT_ID_INFO_SIZE) == 0) {
        info = (struct mxt_id_info *) mxt_read_buf;
        if (info->family_id != 0x00) {
            memcpy((uint8_t *) (&(mxt_dev.id_info)), (uint8_t *)info, sizeof(struct mxt_id_info));
            return 0;
        }
    }
    
    return -1;
}

void mxt_set_bootloader_len(uint32_t len)
{
    mxtBlProtocol.mxtImageLength = len;
    mxtBlProtocol.mxtImageRemind = len;
    mxtBlProtocol.indexOfFrameBuf = 0;
    mxtBlProtocol.currentFrameLength = 0;
    mxt_dev.cfg_header_init = false;
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

/*
 * \param obj Object table element.
 * \param instance Object instance index.
 *
 * \brief  Returns the start position for the specified object element by
 *         combining the least significant and most significant bytes.
 * \return Start position as a single value.
 */
static uint16_t mxt_get_start_position(struct mxt_object_config obj, uint8_t instance)
{
	return (obj.start_pos_msb * 256) + obj.start_pos_lsb + ((obj.size_minus_one + 1) * instance);
}

/*
 * \param  object_type Object ID number.
 * \param  instance Instance number of the object.
 *
 * \brief  Returns the start address of the selected object and instance number
 *         in the chip's memory map.
 * \return Object address, or OBJECT_NOT_FOUND if object/instance not found.
 */
static int mxt_get_object_address(uint16_t object_type, uint16_t instance, uint16_t *addr)
{
	uint32_t i = 0;
	struct mxt_object_config obj;

	for (i = 0; i < mxt_dev.id_info.object_num; i++) {
		obj = mxt_dev.object_table[i];

		/* Does object type match? */
		if (obj.type == object_type) {
			/* Are there enough instances defined in the firmware? */
			if (obj.instances_minus_one >= instance) {
                *addr = mxt_get_start_position(obj, instance);
				return 0;
			} else {
				return OBJECT_NOT_FOUND;
			}
		}
	}

	return OBJECT_NOT_FOUND;
}

/*
 * Read register from MXT chip
 */
int mxt_read_register(uint8_t *buf, uint16_t start_reg, uint16_t count)
{
	mxt_write_buf[0] = start_reg & 0xFF;
	mxt_write_buf[1] = (start_reg >> 8) & 0xFF;

	if (mxt_i2c_write_read(MXT_I2C_ADDR_APP, mxt_write_buf, 2, buf, count) != 0) {
		return -1;
	}

	return 0;
}

/*
 * \brief  Populates a look-up table for the report IDs.
 */
static int mxt_calc_report_ids(void)
{
	/* Report ID zero is reserved - start from one */
	mxt_dev.max_report_id = 1;
	int report_id_count = 1;

	int i;
	int instance;
	int report_index;

	struct mxt_object_config obj;

	/* Calculate the number of report IDs */
	for (i = 0; i < mxt_dev.id_info.object_num; i++) {
		mxt_dev.max_report_id += (mxt_dev.object_table[i].instances_minus_one + 1) *
			mxt_dev.object_table[i].num_report_ids;
	}

	/* Store the object and instance for each report ID */
	for (i = 0; i < mxt_dev.id_info.object_num; i++) {
		obj = mxt_dev.object_table[i];
		for (instance = 0; instance <= obj.instances_minus_one; instance++) {
			for (report_index = 0; report_index < obj.num_report_ids; report_index++) {
				mxt_dev.report_id_map[report_id_count].object_type = obj.type;
				mxt_dev.report_id_map[report_id_count].instance = instance;
				report_id_count++;
			}
		}
	}

	return 0;
}

/*
 * Readout Object Table from MaxTouch
 * 
 * Return 0 Success, other value failed
 */
int mxt_read_obj_table(void)
{
    if (mxt_init() != 0) {
        return -1;
    }
    
    /* Read Object table */
	if (mxt_read_register((void *)mxt_dev.object_table,
                MXT_OBJTBL_START,
				mxt_dev.id_info.object_num * MXT_OBJTBL_ELEMENT_SIZE) != 0)
    {
        return -1;
	}
	mxt_calc_report_ids();
    return 0;
}

/*
 * Write register to MXT chip
 */
int mxt_write_register(uint8_t *buf, uint16_t start_reg, uint16_t count)
{
	uint32_t i;
	uint32_t wr_len;

	wr_len = count + 2;

	if (wr_len > MXT_I2C_TXBUF_LEN) {
		return -1;
	}

	mxt_write_buf[0] = start_reg & 0xFF;
	mxt_write_buf[1] = (start_reg >> 8) & 0xFF;

	for (i = 0; i < count; i++) {
		mxt_write_buf[2+i] = *buf;
		buf++;
	}

	if (mxt_i2c_write_read(MXT_I2C_ADDR_APP, mxt_write_buf, wr_len, 0, 0) != 0) {
		return -1;
	}

	return 0;
}
/*
 * Send MXT T6 command
 */
static int mxt_t6_command(uint8_t cmd_offset, uint8_t value)
{
	uint16_t obj_addr;

	/* Obtain command processor's address */
	if (mxt_get_object_address(MXT_GEN_COMMANDPROCESSOR_T6, 0, &obj_addr)) {
		return -1;
	}

	/* Write to command processor register to perform command */
	if (mxt_write_register((void *)&value, obj_addr + cmd_offset, 1) != 0) {
		return -1;
	}

	return 0;
}

/*
 * \brief  Look up object type from report ID
 * \param  mxt Maxtouch Device
 * \param  report_id Report ID
 * \return Object type number, or OBJECT_NOT_FOUND
 */
static uint16_t mxt_report_id_to_type(int report_id)
{
	if (report_id > mxt_dev.max_report_id)
		return OBJECT_NOT_FOUND;

	return (mxt_dev.report_id_map[report_id].object_type);
}

/*
 * \brief  Returns the size of the specified type in the object table.
 * \return Object size, or OBJECT_NOT_FOUND if object not found.
 */
static uint8_t mxt_get_object_size(uint16_t object_type)
{
	int i;

	for (i = 0; i < mxt_dev.id_info.object_num; i++) {
		if (mxt_dev.object_table[i].type == object_type) {
			break;
		}
	}

	if (i >= mxt_dev.id_info.object_num) {
		return OBJECT_NOT_FOUND;
	}

	return mxt_dev.object_table[i].size_minus_one + 1;
}

/*
 * Reads config checksum from T6 messages
 */
static int32_t mxt_get_config_crc(uint32_t *cs_out)
{
	uint8_t count;
	uint16_t obj_addr;
	uint32_t timeout;
	uint32_t size;

	*cs_out = 0;

	/*======== Send report all command ========*/
	if (mxt_t6_command(MXT_COMMAND_REPORTALL, MXT_REPORTALL_VALUE) != 0) {

	}

	/* Check the CHG line Status */
	timeout = MXT_CHG_WAIT_TIMEOUT;
	while (CTP_CHG_Get() && (timeout--));

	SYSTICK_DelayMs(200); /* Wait more time ?? */

	/*======== Get T44 count ========*/
	if (mxt_get_object_address(MXT_SPT_MESSAGECOUNT_T44, 0, &obj_addr)) {
		return -1;
	}

	if (mxt_read_register((void *)&count, obj_addr, 1) != 0) {
		return -1;
	}

	/*======== Read message ========*/
	if (mxt_get_object_address(MXT_GEN_MESSAGEPROCESSOR_T5, 0, &obj_addr)) {
		return -1;
	}

	/* Do not read CRC byte */
	size = mxt_get_object_size(MXT_GEN_MESSAGEPROCESSOR_T5) - 1;
	if (size > MXT_I2C_RXBUF_LEN) {
		return -1;
	}
	while (count--) {
		if (mxt_read_register((void *)mxt_read_buf, obj_addr, size) != 0) {
			return -1;
		}

		if (mxt_report_id_to_type(mxt_read_buf[0]) == MXT_GEN_COMMANDPROCESSOR_T6) {
			if (cs_out != NULL) {
				*cs_out = mxt_read_buf[2] | (mxt_read_buf[3] << 8) | (mxt_read_buf[4] << 16);
			}
			break;
		}
	}
	return 0;
}

/**
 * Upgrade maxtouch configuration (BUFFER), max length was the BL_MXT_DATA_SIZE.
 * 
 * MaxTouch Raw Config File Format:
  *
 * The first four lines of the raw config file contain:
 *  1) Version
 *  2) Chip ID Information (first 7 bytes of device memory)
 *  3) Chip Information Block 24-bit CRC Checksum
 *  4) Chip Configuration 24-bit CRC Checksum
 *
 * The rest of the file consists of one line per object instance:
 *   <TYPE> <INSTANCE> <SIZE> <CONTENTS>
 *
 *   <TYPE> - 2-byte object type as hex
 *   <INSTANCE> - 2-byte object instance number as hex
 *   <SIZE> - 2-byte object size as hex
 *   <CONTENTS> - array of <SIZE> 1-byte hex values
 * This function cannot operate I2C, since this function was been invoked from 
 * I2C Slave ISR, Only update buffer. And if the maxtouch frame buffer was ready
 * to send out, This function will move the state machine to next stage.
 * 
 * @param buf Configuration Data to be programmed into MaxTouch 
 * @param len Data length
 * @return 0: success, other value: fail
 */
int mxt_upgrade_cfg(uint8_t *buf, uint8_t len)
{
    uint8_t ind = 0;
    uint32_t i;

	uint16_t obj_addr;
    uint16_t obj_type = 0;
    uint16_t obj_ins = 0;
    uint16_t obj_len = 0;

    if (len > BL_MXT_DATA_SIZE
            || (mxtBlProtocol.mxtImageRemind == 0)
            || (mxtBlProtocol.mxtImageLength == 0)
            || (len > mxtBlProtocol.mxtImageRemind)
            ) {
        return -1;
    }

    // Check configuration Header was correct, 
    if (mxt_dev.cfg_header_init == false) {
        //pinfo = (uint8_t *)()&mxt_dev.id_info);
        for (i = 0; i < MXT_ID_INFO_SIZE; i++) {
            if (buf[i] != *((uint8_t *)(&mxt_dev.id_info) + i)) {
                return -1;
            }
        }
        mxt_dev.cfg_header_init = true;
        /* Point to first Object */
        ind = MXT_ID_INFO_SIZE + MXT_INFO_CHECKSUM_SIZE * 2;
        mxtBlProtocol.mxtImageRemind -= MXT_ID_INFO_SIZE + MXT_INFO_CHECKSUM_SIZE * 2;
        /* Reset MaxTouch into application mode */
        mxt_hardware_reset();
    }
    
    /* Copy data to the buffer
     * bl_inbuf[0] should always be the first bytes of an Object
     */
    for (; ind < len; ind++) {
        bl_inbuf[mxtBlProtocol.indexOfFrameBuf++] = buf[ind];
    }
    
    while (mxtBlProtocol.indexOfFrameBuf > MXT_OBJ_HDR_SIZE) {
        /* Read object item type, instance and length (total 6 bytes) */
        if (mxtBlProtocol.indexOfFrameBuf >= MXT_OBJ_HDR_SIZE) {
            obj_type = bl_inbuf[1] + (bl_inbuf[0] << 8);
            obj_ins = bl_inbuf[3] + (bl_inbuf[2] << 8);
            obj_len = bl_inbuf[5] + (bl_inbuf[4] << 8);
            if (obj_len >= MXT_MAX_FRAME_LEN) {
                /* This object length is not support */
                return -1;
            }
            /* Object not received complement, break out and wait for next incoming data */
            if (mxtBlProtocol.indexOfFrameBuf < (obj_len + MXT_OBJ_HDR_SIZE)) {
                return 0;
            }
        } else {
            return 0;
        }

        /* Update Object */
        if (mxt_get_object_address(obj_type, obj_ins, &obj_addr) == OBJECT_NOT_FOUND) {
            return -1;
        }
        if (mxt_write_register((uint8_t *)(bl_inbuf + MXT_OBJ_HDR_SIZE), obj_addr, obj_len) != 0) {
            return -1;
        }
        mxtBlProtocol.mxtImageRemind -= (obj_len + MXT_OBJ_HDR_SIZE);
        if (mxtBlProtocol.mxtImageRemind < 0x40) {
            mxtBlProtocol.mxtImageRemind = mxtBlProtocol.mxtImageRemind;
        }
        if (mxtBlProtocol.mxtImageRemind == 0) {
            if (mxt_t6_command(MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE) == 0) {
                SYSTICK_DelayMs(200);
                if (mxt_init() == 0) {
                    return 0;
                }
            }
            return -1;
        }

        /* Copy remind data to the header of the buffer */
        for (ind = 0; ind < (mxtBlProtocol.indexOfFrameBuf - obj_len - MXT_OBJ_HDR_SIZE); ind++) {
             bl_inbuf[ind] = bl_inbuf[obj_len + MXT_OBJ_HDR_SIZE + ind];
        }
        mxtBlProtocol.indexOfFrameBuf -= (obj_len + MXT_OBJ_HDR_SIZE);
    }
    return 0;
}

/******************************************************************************
 End of File
 */
