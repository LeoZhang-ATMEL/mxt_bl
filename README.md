# Simple Use
For simple use those project, there at least need an MCU host board, and currently
MCU firmware upgrade funtion can be demo on the MCU Host board (ATSAMD21-XPRO).
Reference docs/index.html for how to running MCU host demo.

For fully using, a Embedded Linux System need to be used, the demo Linux Host project
using SAMA5D27-SOM1-EK EVB and yocto build system. All MCU upgrade and maxtouch upgrade
function can be running by those demo.

# Projects
* i2c_bootloader_info4_board, I2C bootloader for INFO4 board. Flash range (0x0000 - 0x0800).
* mxt_i2c_bootloader_info4_board, MaxTouch I2C bootloader application for INFO4 board. Flash range (0x0800 - 0x17FF)
* i2c_bootloader_test_app_info4_board, test application for INFO4 board. Flash range (0x1800 - 0xFFFF).
* i2c_bootloader_sam_da1_xpro, I2C bootloader for SAMDA1 XPRO EVB. Flash range (0x0000 - 0x0800).
* mxt_i2c_bootloader_sam_da1_xpro, MaxTouch I2C bootloader application for SAMDA1 XPRO EVB. Flash range (0x0800 - 0x17FF)
* i2c_bootloader_test_app_sam_da1_xpro, test application for SAMDA1 XPRO EVB. Flash range (0x1800 - 0xFFFF).
* mchp-i2cbsl, Linux I2C bootloader host application

# Command Usage
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

#Convert MaxTouch firmware and configuration file to binary file
xxd -r -p mXT1067TDAT_0x3D_1.0.00_PROD.enc > mXT1067TDAT_0x3D_1.0.00_PROD.bin

# Demo Wired Connection
Wired connect between SAMA5D27-SOM1-EK, ATSAMDA1-XPRO and mXTouch1067-EVB
```python
MBus1/SDA <--> PA08 <--> MXT/SDA
MBus1/SCL <--> PA09 <--> MXT/SCL
MBus1/INT <--- PA02
               PB06 <--- MXT/CHG
               PB07 ---> MXT/RESET
```
Wired connect between SAMA5D27-SOM1-EK, INFO4 Board and mXTouch1067-EVB
```python
MBus1/SDA <--> PA00 <--> MXT/SDA
MBus1/SCL <--> PA01 <--> MXT/SCL
MBus1/INT <--- PA02
               PB04 <--- MXT/CHG
               PA03 ---> MXT/RESET
```

# Demo example (MCU)
Program **i2c_bootloader_sam_da1_xpro** to the board for testing app bootloader
## Upgrade MCU with samda1_1s.bin, the LED will toggle every 1s after finish.
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

# Demo example (Maxtouch)
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

## Known Issue
READ Info response wrong data if no delay after INT_MCU release.