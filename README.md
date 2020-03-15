#Convert MaxTouch firmware and configuration file to binary file
xxd -r -p mXT1067TDAT_0x3D_1.0.00_PROD.enc > mXT1067TDAT_0x3D_1.0.00_PROD.bin

# Command Usage
* Copy demo files under the *firmware/* folder to the root folder of the host (Linux based)
* Running `chmod 777 *.sh` and `chmod 777 mchp_i2cbsl`
* Program *i2c_bootloader_sam_da1_xpro* to the board for testing app bootloader
* Running `./app_1s.sh` download test app with 1s LED toggle, the board LED toggle every 1s
* Running `./app_0.5s.sh` download test app with 0.5s LED toggle, the board LED toggle every 0.5s
* Program *tianma_tp_i2c_bootloader_samda1_xpro* to the board for testing maxtouch firmware upgrade
* Running `./mxt_info.sh` Checking currently version of the maxtouch
* Running `./mxt_1067_v00.sh` download V00 version to the maxtouch
* Running `./mxt_1067_vAA.sh` download V00 version to the maxtouch
