# How to Using the Demo
Those demos projects present how to upgrade mXTouch firmware through a Host platform.
For using those projects, there at least need an MCU host board, Both
[SAM D21 Xplained Pro Evaluation Kit](https://www.microchip.com/developmenttools/ProductDetails/atsamd21-xpro) and
[SAMA5D27-SOM1-EK1](https://www.microchip.com/DevelopmentTools/ProductDetails/PartNO/ATSAMA5D27-SOM1-EK1) can be used as Bootloader Host Platform.

# Convert MaxTouch firmware and configuration file to binary file
Before running the demo, the maXTouch firmware needs to be converted to the binary file, following bellow command to convert a ENC file to the binary file.
```
xxd -r -p mXT1067TDAT_0x3D_1.0.00_PROD.enc > mXT1067TDAT_0x3D_1.0.00_PROD.bin
```

# Demo Wired Connection
1. Wired connect between ATSAMD21-XPRO, ATSAMDA1-XPRO and mXTouch1067-EVB
* Connect [I/O1 Xplained Pro board](https://www.microchip.com/DevelopmentTools/ProductDetails/ATIO1-XPRO) to EXT1 header of the [SAM D21 Xplained Pro Evaluation Kit](https://www.microchip.com/developmenttools/ProductDetails/atsamd21-xpro)
* Copy mXTouch firmware to the microSD card, and Insert a microSD card to [I/O1 Xplained Pro board](https://www.microchip.com/DevelopmentTools/ProductDetails/ATIO1-XPRO).
mXT1067TDAT_0x3D_1.0.00_PROD.bin
mXT1067TDAT_0x3D_1.0.AA_PROD.bin
* Connect the Debug USB port on the board to the computer using a micro USB cable

|SAMD21-XPRO|SAMDA1-XPRO|mXTouch1067-EVB|
|-----|-----|-----|
|EXT3-PA08 | EXT1-PA08 | MXT/SDA   |
|EXT3-PA09 | EXT1-PA09 | MXT/SCL   |
|EXT3-PA02 | EXT3-PA02 |           |
|          | EXT3-PA12 | MXT/CHG   |
|          | EXT3-PA13 | MXT/RESET |

|SAMD21-XPRO|INFO4-Board|mXTouch1067-EVB|
|-----|-----|-----|
|EXT3-PA08 | PB16 | MXT/SDA   |
|EXT3-PA09 | PB17 | MXT/SCL   |
|EXT3-PA02 | PA02 |           |
|          | PB04 | MXT/CHG   |
|          | PA03 | MXT/RESET |

2. Wired connect between SAMA5D27-SOM1-EK, ATSAMDA1-XPRO and mXTouch1067-EVB
|MBus1/SDA | EXT1-PA08 | MXT/SDA   |
|MBus1/SCL | EXT1-PA09 | MXT/SCL   |
|MBus1/INT | EXT3-PA02 |           |
|          | EXT3-PA12 | MXT/CHG   |
|          | EXT3-PA13 | MXT/RESET |

3. Wired connect between SAMA5D27-SOM1-EK, INFO4 Board and mXTouch1067-EVB
```python
MBus1/SDA <--> PA00 <--> MXT/SDA
MBus1/SCL <--> PA01 <--> MXT/SCL
MBus1/INT <--- PA02
               PB04 <--- MXT/CHG
               PA03 ---> MXT/RESET
```

# Projects
* i2c_bootloader_host_sdcard_sam_d21_xpro, I2C Bootloader host for both Info4 board and [SAM D21 Xplained Pro Evaluation Kit](https://www.microchip.com/developmenttools/ProductDetails/atsamd21-xpro)
* i2c_bootloader_info4_board, I2C bootloader for INFO4 board. Flash range (0x0000 - 0x0800).
* mxt_i2c_bootloader_info4_board, MaxTouch I2C bootloader application for INFO4 board. Flash range (0x0800 - 0x17FF)
* i2c_bootloader_test_app_info4_board, test application for INFO4 board. Flash range (0x1800 - 0xFFFF).
* i2c_bootloader_sam_da1_xpro, I2C bootloader for SAMDA1 XPRO EVB. Flash range (0x0000 - 0x0800).
* mxt_i2c_bootloader_sam_da1_xpro, MaxTouch I2C bootloader application for SAMDA1 XPRO EVB. Flash range (0x0800 - 0x17FF)
* i2c_bootloader_test_app_sam_da1_xpro, test application for SAMDA1 XPRO EVB. Flash range (0x1800 - 0xFFFF).
* mchp-i2cbsl, Linux I2C bootloader host application


# Demo example (SAMD21-XPRO Host)
* Program **i2c_bootloader_host_sdcard_sam_d21_xpro** to the [SAM D21 Xplained Pro Evaluation Kit](https://www.microchip.com/developmenttools/ProductDetails/atsamd21-xpro)
* Program **mxt_i2c_bootloader_info4_board** to the info4 board for testing maxtouch firmware upgrade

## Display MAXTOUCH firmware version, now the build version was 0x00
```bash
>readinfo
 *** Read Max Touch Firmware Info ***
>I2C Slave Addr: 0x12
MAXTOUCH: family_id      0xA4
MAXTOUCH: variant_id     0x3D
MAXTOUCH: version        0x10
MAXTOUCH: build          0xAA
MAXTOUCH: matrix_xsize   0x29
MAXTOUCH: matrix_ysize   0x1A
MAXTOUCH: object_num     0x22

```

## Upgrade MAXTouch firmware mXT1067TDAT_0x3D_1.0.*00*_PROD.bin
```
>mxt1
 *** Upgrade MCU firmware 1 ***
>I2C Slave Addr: 0x12
MAXTOUCH: Unlock Success.
MAXTOUCH: Start Programming mXT1067TDAT_0x3D_1.0.00_PROD.bin, 146992 Bytes
MAXTOUCH: ‰°‰°‰°‰°‰°‰°‰°‰°‰°100%   !!Success!!
MAXTOUCH: Download Speed 5628 Bytes/Second @ 26 seconds

```

## Display MAXTOUCH firmware version, now the build version was 0x00
```
>readinfo
 *** Read Max Touch Firmware Info ***
>I2C Slave Addr: 0x12
MAXTOUCH: family_id      0xA4
MAXTOUCH: variant_id     0x3D
MAXTOUCH: version        0x10
MAXTOUCH: build          0x00
MAXTOUCH: matrix_xsize   0x29
MAXTOUCH: matrix_ysize   0x1A
MAXTOUCH: object_num     0x22

```

## Upgrade MAXTouch firmware mXT1067TDAT_0x3D_1.0.*AA*_PROD.bin
```
>mxt2
 *** Upgrade MCU firmware 2 ***
>I2C Slave Addr: 0x12
MAXTOUCH: Unlock Success.
MAXTOUCH: Start Programming mXT1067TDAT_0x3D_1.0.AA_PROD.bin, 146992 Bytes
MAXTOUCH: ‰°‰°‰°‰°‰°‰°‰°‰°‰°100%   !!Success!!
MAXTOUCH: Download Speed 5628 Bytes/Second @ 26 seconds

```

## Display MAXTOUCH firmware version, now the build version was 0xAA
```bash
>readinfo
 *** Read Max Touch Firmware Info ***
>I2C Slave Addr: 0x12
MAXTOUCH: family_id      0xA4
MAXTOUCH: variant_id     0x3D
MAXTOUCH: version        0x10
MAXTOUCH: build          0xAA
MAXTOUCH: matrix_xsize   0x29
MAXTOUCH: matrix_ysize   0x1A
MAXTOUCH: object_num     0x22

```

* Program **i2c_bootloader_host_sdcard_sam_d21_xpro** to the [SAM D21 Xplained Pro Evaluation Kit](https://www.microchip.com/developmenttools/ProductDetails/atsamd21-xpro)
* Program **i2c_bootloader_info4_board** to the info4 board for testing MCU application upgrade

## Upgrade MCU with **info4_board_test_app_INT_low.bin**, the INT_MCU PIN will set Low.
```python
>info4_app1
 *** Upgrade MCU firmware info4_board_test_app_INT_low.bin ***
>I2C Slave Addr: 0x12 ������������������100%   !!Success!!

```
## Read INT_MCU PIN Status, the value should be 0.
```python
>readint
 *** Read INT_MCU Pin Value (0) ***
>
```

## Upgrade MCU with **info4_board_test_app_INT_high.bin**, the INT_MCU PIN will set High.
```python
>info4_app2
 *** Upgrade MCU firmware info4_board_test_app_INT_high.bin ***
>I2C Slave Addr: 0x12 ������������������100%   !!Success!!

```
## Read INT_MCU PIN Status, the value should be 1.
```python
>readint
 *** Read INT_MCU Pin Value (1) ***
>
```

# Demo example (Linux Host)

For fully using, an Embedded Linux System needs to be used, the demo Linux Host project
using SAMA5D27-SOM1-EK EVB and yocto build system. All MCU upgrades and maXTouch upgrade
function can be running by those demos.

## Command Usage
* Copy demo files under the *firmware/* folder to the root folder of the host (Linux based)
* Running `chmod 777 *.sh` and `chmod 777 mchp_i2cbsl`
* Program **i2c_bootloader_sam_da1_xpro** to the board for testing app bootloader
* Running `./app_1s.sh` download test app with 1s LED toggle, the SAMDA1 XPRO Board LED toggle every 1s
* Running `./app_0.5s.sh` download test app with 0.5s LED toggle, the SAMDA1 XPRO LED Board toggle every 0.5s
* Running `./app_int_1.sh` download test app will set INT_MCU pin high, the INFO4 Board INT_MCU pin was high
* Running `./app_int_0.sh` download test app will set INT_MCU pin low, the INFO4 Board INT_MCU pin was low
* Program **tianma_tp_i2c_bootloader_samda1_xpro** to the board for testing maxtouch firmware upgrade
* Running `./mxt_info.sh` Checking currently version of the maxtouch
* Running `./mxt_1067_v00.sh` download V00 version to the maxtouch
* Running `./mxt_1067_vAA.sh` download V00 version to the maxtouch

Program **i2c_bootloader_sam_da1_xpro** to the board for testing app bootloader
## Upgrade MCU with samda1_1s.bin, the LED will toggle every 1s after the finish.
Long push button 1 for trigger the bootloader if application already running
```bash
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t app -a 0x1800 0x2400 -i /dev/i2c-2 -f samda1_1s.bin

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
INFO: Firmware file samda1_1s.bin specified
Unlock target memory 0x00001800, length 9216
Erase flash from 0x00001800, length 0x00002400
Program flash success, length 9216 bytes
INFO: CRC Check Success, CRC=0x28AF03D5
INFO: Reset Target Success
root@sama5d27-som1-ek-sd:~# 
```
## Upgrade MCU with samda1_0.5s.bin, the LED will toggle every 0.5s after finish.
Long push button 1 for trigger the bootloader if application already running
```bash
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t app -a 0x1800 0x2400 -i /dev/i2c-2 -f samda1_0.5s.bin

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
INFO: Firmware file samda1_0.5s.bin specified
Unlock target memory 0x00001800, length 9216
Erase flash from 0x00001800, length 0x00002400
Program flash success, length 9216 bytes
INFO: CRC Check Success, CRC=0xFED3E998
INFO: Reset Target Success
root@sama5d27-som1-ek-sd:~# 
```

# Linux Host Get and Display mXTouch Version
Program **tianma_tp_i2c_bootloader_samda1_xpro** to the board for testing maxtouch firmware upgrade
## Display MAXTOUCH firmware version, now the build version was 0x00
```bash
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t touch -i /dev/i2c-2 -c info

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
MAXTOUCH: Send Get Info command

	 MAXTOUCH Chip Info Read Success
MAXTOUCH: family_id	 0xA4
MAXTOUCH: variant_id	 0x3D
MAXTOUCH: version	 0x10
MAXTOUCH: build		 0x00
MAXTOUCH: matrix_xsize	 0x29
MAXTOUCH: matrix_ysize	 0x1A
MAXTOUCH: object_num	 0x22
root@sama5d27-som1-ek-sd:~# 
```

## Upgrade MAXTouch firmware mXT1067TDAT_0x3D_1.0.*AA*_PROD.bin
```
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t touch -i /dev/i2c-2 -c fw -f mXT1067TDAT_0x3D_1.0.AA_PROD.bin

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
INFO: Firmware file mXT1067TDAT_0x3D_1.0.AA_PROD.bin specified
MAXTOUCH: Send Unlock command
MAXTOUCH: Unlock Success
MAXTOUCH: Start Programming
Program MaxTouch Firmware Success, length 146992 bytes, Speed 4199 Bytes/Sec
root@sama5d27-som1-ek-sd:~# 
```

## Display MAXTOUCH firmware version, now the build version was *0xAA*
```
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t touch -i /dev/i2c-2 -c info

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
MAXTOUCH: Send Get Info command

	 MAXTOUCH Chip Info Read Success
MAXTOUCH: family_id	 0xA4
MAXTOUCH: variant_id	 0x3D
MAXTOUCH: version	 0x10
MAXTOUCH: build		 0xAA
MAXTOUCH: matrix_xsize	 0x29
MAXTOUCH: matrix_ysize	 0x1A
MAXTOUCH: object_num	 0x22
root@sama5d27-som1-ek-sd:~# 
```

## Upgrade MAXTouch firmware mXT1067TDAT_0x3D_1.0.*00*_PROD.bin
```
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t touch -i /dev/i2c-2 -c fw -f mXT1067TDAT_0x3D_1.0.00_PROD.bin

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
INFO: Firmware file mXT1067TDAT_0x3D_1.0.00_PROD.bin specified
MAXTOUCH: Send Unlock command
MAXTOUCH: Unlock Success
MAXTOUCH: Start Programming
Program MaxTouch Firmware Success, length 146992 bytes, Speed 4083 Bytes/Sec
root@sama5d27-som1-ek-sd:~# 
```

## Display MAXTOUCH firmware version, now the build version was *0x00*
```
root@sama5d27-som1-ek-sd:~# ./mchp-i2cbsl -t touch -i /dev/i2c-2 -c info

---------------------------------------------------------------
   Microchip I2C Linux BootLoader Host 1.00                    
---------------------------------------------------------------
INFO: Set INT PIN Success.
INFO: I2C BUS /dev/i2c-2 specified
MAXTOUCH: Send Get Info command


	 MAXTOUCH Chip Info Read Success
MAXTOUCH: family_id	 0xA4
MAXTOUCH: variant_id	 0x3D
MAXTOUCH: version	 0x10
MAXTOUCH: build		 0x00
MAXTOUCH: matrix_xsize	 0x29
MAXTOUCH: matrix_ysize	 0x1A
MAXTOUCH: object_num	 0x22
root@sama5d27-som1-ek-sd:~# 
```
