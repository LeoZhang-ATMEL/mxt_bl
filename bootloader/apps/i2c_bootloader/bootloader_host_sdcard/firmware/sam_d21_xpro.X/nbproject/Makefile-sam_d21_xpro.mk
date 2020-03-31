#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-sam_d21_xpro.mk)" "nbproject/Makefile-local-sam_d21_xpro.mk"
include nbproject/Makefile-local-sam_d21_xpro.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_d21_xpro
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_d21_xpro/bsp/bsp.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c ../src/config/sam_d21_xpro/peripheral/port/plib_port.c ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c ../src/config/sam_d21_xpro/stdio/xc32_monitor.c ../src/config/sam_d21_xpro/system/command/src/sys_command.c ../src/config/sam_d21_xpro/system/console/src/sys_console.c ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c ../src/config/sam_d21_xpro/system/dma/sys_dma.c ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c ../src/config/sam_d21_xpro/system/int/src/sys_int.c ../src/config/sam_d21_xpro/system/time/src/sys_time.c ../src/config/sam_d21_xpro/initialization.c ../src/config/sam_d21_xpro/interrupts.c ../src/config/sam_d21_xpro/exceptions.c ../src/config/sam_d21_xpro/startup_xc32.c ../src/config/sam_d21_xpro/libc_syscalls.c ../src/config/sam_d21_xpro/tasks.c ../src/main.c ../src/app.c ../src/app_mxt.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1011596308/bsp.o ${OBJECTDIR}/_ext/283281740/drv_sdspi.o ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o ${OBJECTDIR}/_ext/600686086/plib_clock.o ${OBJECTDIR}/_ext/2010544706/plib_dsu.o ${OBJECTDIR}/_ext/602835572/plib_evsys.o ${OBJECTDIR}/_ext/2097924074/plib_nvic.o ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o ${OBJECTDIR}/_ext/2010533750/plib_pac.o ${OBJECTDIR}/_ext/2097977225/plib_port.o ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o ${OBJECTDIR}/_ext/869718558/plib_systick.o ${OBJECTDIR}/_ext/480497801/plib_tc3.o ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o ${OBJECTDIR}/_ext/221584075/sys_command.o ${OBJECTDIR}/_ext/235128105/sys_console.o ${OBJECTDIR}/_ext/235128105/sys_console_uart.o ${OBJECTDIR}/_ext/2025987491/sys_dma.o ${OBJECTDIR}/_ext/2050482443/ff.o ${OBJECTDIR}/_ext/2050482443/diskio.o ${OBJECTDIR}/_ext/920642281/sys_fs.o ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o ${OBJECTDIR}/_ext/189042961/sys_int.o ${OBJECTDIR}/_ext/130570711/sys_time.o ${OBJECTDIR}/_ext/128142748/initialization.o ${OBJECTDIR}/_ext/128142748/interrupts.o ${OBJECTDIR}/_ext/128142748/exceptions.o ${OBJECTDIR}/_ext/128142748/startup_xc32.o ${OBJECTDIR}/_ext/128142748/libc_syscalls.o ${OBJECTDIR}/_ext/128142748/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/app_mxt.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1011596308/bsp.o.d ${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d ${OBJECTDIR}/_ext/600686086/plib_clock.o.d ${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d ${OBJECTDIR}/_ext/602835572/plib_evsys.o.d ${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/2010533750/plib_pac.o.d ${OBJECTDIR}/_ext/2097977225/plib_port.o.d ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d ${OBJECTDIR}/_ext/869718558/plib_systick.o.d ${OBJECTDIR}/_ext/480497801/plib_tc3.o.d ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d ${OBJECTDIR}/_ext/221584075/sys_command.o.d ${OBJECTDIR}/_ext/235128105/sys_console.o.d ${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d ${OBJECTDIR}/_ext/2025987491/sys_dma.o.d ${OBJECTDIR}/_ext/2050482443/ff.o.d ${OBJECTDIR}/_ext/2050482443/diskio.o.d ${OBJECTDIR}/_ext/920642281/sys_fs.o.d ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d ${OBJECTDIR}/_ext/189042961/sys_int.o.d ${OBJECTDIR}/_ext/130570711/sys_time.o.d ${OBJECTDIR}/_ext/128142748/initialization.o.d ${OBJECTDIR}/_ext/128142748/interrupts.o.d ${OBJECTDIR}/_ext/128142748/exceptions.o.d ${OBJECTDIR}/_ext/128142748/startup_xc32.o.d ${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d ${OBJECTDIR}/_ext/128142748/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/app_mxt.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1011596308/bsp.o ${OBJECTDIR}/_ext/283281740/drv_sdspi.o ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o ${OBJECTDIR}/_ext/600686086/plib_clock.o ${OBJECTDIR}/_ext/2010544706/plib_dsu.o ${OBJECTDIR}/_ext/602835572/plib_evsys.o ${OBJECTDIR}/_ext/2097924074/plib_nvic.o ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o ${OBJECTDIR}/_ext/2010533750/plib_pac.o ${OBJECTDIR}/_ext/2097977225/plib_port.o ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o ${OBJECTDIR}/_ext/869718558/plib_systick.o ${OBJECTDIR}/_ext/480497801/plib_tc3.o ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o ${OBJECTDIR}/_ext/221584075/sys_command.o ${OBJECTDIR}/_ext/235128105/sys_console.o ${OBJECTDIR}/_ext/235128105/sys_console_uart.o ${OBJECTDIR}/_ext/2025987491/sys_dma.o ${OBJECTDIR}/_ext/2050482443/ff.o ${OBJECTDIR}/_ext/2050482443/diskio.o ${OBJECTDIR}/_ext/920642281/sys_fs.o ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o ${OBJECTDIR}/_ext/189042961/sys_int.o ${OBJECTDIR}/_ext/130570711/sys_time.o ${OBJECTDIR}/_ext/128142748/initialization.o ${OBJECTDIR}/_ext/128142748/interrupts.o ${OBJECTDIR}/_ext/128142748/exceptions.o ${OBJECTDIR}/_ext/128142748/startup_xc32.o ${OBJECTDIR}/_ext/128142748/libc_syscalls.o ${OBJECTDIR}/_ext/128142748/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/app_mxt.o

# Source Files
SOURCEFILES=../src/config/sam_d21_xpro/bsp/bsp.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c ../src/config/sam_d21_xpro/peripheral/port/plib_port.c ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c ../src/config/sam_d21_xpro/stdio/xc32_monitor.c ../src/config/sam_d21_xpro/system/command/src/sys_command.c ../src/config/sam_d21_xpro/system/console/src/sys_console.c ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c ../src/config/sam_d21_xpro/system/dma/sys_dma.c ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c ../src/config/sam_d21_xpro/system/int/src/sys_int.c ../src/config/sam_d21_xpro/system/time/src/sys_time.c ../src/config/sam_d21_xpro/initialization.c ../src/config/sam_d21_xpro/interrupts.c ../src/config/sam_d21_xpro/exceptions.c ../src/config/sam_d21_xpro/startup_xc32.c ../src/config/sam_d21_xpro/libc_syscalls.c ../src/config/sam_d21_xpro/tasks.c ../src/main.c ../src/app.c ../src/app_mxt.c

# Pack Options 
PACK_COMMON_OPTIONS=-I ${CMSIS_DIR}\CMSIS\Core\Include



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sam_d21_xpro.mk dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMD21J18A
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1011596308/bsp.o: ../src/config/sam_d21_xpro/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1011596308" 
	@${RM} ${OBJECTDIR}/_ext/1011596308/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1011596308/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1011596308/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1011596308/bsp.o.d" -o ${OBJECTDIR}/_ext/1011596308/bsp.o ../src/config/sam_d21_xpro/bsp/bsp.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/600686086/plib_clock.o: ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/600686086" 
	@${RM} ${OBJECTDIR}/_ext/600686086/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/600686086/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/600686086/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/600686086/plib_clock.o.d" -o ${OBJECTDIR}/_ext/600686086/plib_clock.o ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2010544706/plib_dsu.o: ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2010544706" 
	@${RM} ${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d 
	@${RM} ${OBJECTDIR}/_ext/2010544706/plib_dsu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d" -o ${OBJECTDIR}/_ext/2010544706/plib_dsu.o ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/602835572/plib_evsys.o: ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/602835572" 
	@${RM} ${OBJECTDIR}/_ext/602835572/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/602835572/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/602835572/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/602835572/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/602835572/plib_evsys.o ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2097924074/plib_nvic.o: ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2097924074" 
	@${RM} ${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2097924074/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/2097924074/plib_nvic.o ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o: ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1104193656" 
	@${RM} ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2010533750/plib_pac.o: ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2010533750" 
	@${RM} ${OBJECTDIR}/_ext/2010533750/plib_pac.o.d 
	@${RM} ${OBJECTDIR}/_ext/2010533750/plib_pac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2010533750/plib_pac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2010533750/plib_pac.o.d" -o ${OBJECTDIR}/_ext/2010533750/plib_pac.o ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2097977225/plib_port.o: ../src/config/sam_d21_xpro/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2097977225" 
	@${RM} ${OBJECTDIR}/_ext/2097977225/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/2097977225/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2097977225/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2097977225/plib_port.o.d" -o ${OBJECTDIR}/_ext/2097977225/plib_port.o ../src/config/sam_d21_xpro/peripheral/port/plib_port.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o: ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1499407027" 
	@${RM} ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o: ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1625846887" 
	@${RM} ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d" -o ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o: ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1136425057" 
	@${RM} ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/869718558/plib_systick.o: ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/869718558" 
	@${RM} ${OBJECTDIR}/_ext/869718558/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/869718558/plib_systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/869718558/plib_systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/869718558/plib_systick.o.d" -o ${OBJECTDIR}/_ext/869718558/plib_systick.o ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/480497801/plib_tc3.o: ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/480497801" 
	@${RM} ${OBJECTDIR}/_ext/480497801/plib_tc3.o.d 
	@${RM} ${OBJECTDIR}/_ext/480497801/plib_tc3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/480497801/plib_tc3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/480497801/plib_tc3.o.d" -o ${OBJECTDIR}/_ext/480497801/plib_tc3.o ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1497164574/xc32_monitor.o: ../src/config/sam_d21_xpro/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1497164574" 
	@${RM} ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o ../src/config/sam_d21_xpro/stdio/xc32_monitor.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/221584075/sys_command.o: ../src/config/sam_d21_xpro/system/command/src/sys_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/221584075" 
	@${RM} ${OBJECTDIR}/_ext/221584075/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/221584075/sys_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/221584075/sys_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/221584075/sys_command.o.d" -o ${OBJECTDIR}/_ext/221584075/sys_command.o ../src/config/sam_d21_xpro/system/command/src/sys_command.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/235128105/sys_console.o: ../src/config/sam_d21_xpro/system/console/src/sys_console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/235128105" 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/235128105/sys_console.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/235128105/sys_console.o.d" -o ${OBJECTDIR}/_ext/235128105/sys_console.o ../src/config/sam_d21_xpro/system/console/src/sys_console.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/235128105/sys_console_uart.o: ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/235128105" 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console_uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/235128105/sys_console_uart.o ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2025987491/sys_dma.o: ../src/config/sam_d21_xpro/system/dma/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2025987491" 
	@${RM} ${OBJECTDIR}/_ext/2025987491/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/2025987491/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2025987491/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2025987491/sys_dma.o.d" -o ${OBJECTDIR}/_ext/2025987491/sys_dma.o ../src/config/sam_d21_xpro/system/dma/sys_dma.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2050482443/ff.o: ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2050482443" 
	@${RM} ${OBJECTDIR}/_ext/2050482443/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/2050482443/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2050482443/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2050482443/ff.o.d" -o ${OBJECTDIR}/_ext/2050482443/ff.o ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2050482443/diskio.o: ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2050482443" 
	@${RM} ${OBJECTDIR}/_ext/2050482443/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2050482443/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2050482443/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2050482443/diskio.o.d" -o ${OBJECTDIR}/_ext/2050482443/diskio.o ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/920642281/sys_fs.o: ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/920642281" 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/920642281/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/920642281/sys_fs.o.d" -o ${OBJECTDIR}/_ext/920642281/sys_fs.o ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o: ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/920642281" 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/189042961/sys_int.o: ../src/config/sam_d21_xpro/system/int/src/sys_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/189042961" 
	@${RM} ${OBJECTDIR}/_ext/189042961/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/189042961/sys_int.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/189042961/sys_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/189042961/sys_int.o.d" -o ${OBJECTDIR}/_ext/189042961/sys_int.o ../src/config/sam_d21_xpro/system/int/src/sys_int.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/130570711/sys_time.o: ../src/config/sam_d21_xpro/system/time/src/sys_time.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/130570711" 
	@${RM} ${OBJECTDIR}/_ext/130570711/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/130570711/sys_time.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/130570711/sys_time.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/130570711/sys_time.o.d" -o ${OBJECTDIR}/_ext/130570711/sys_time.o ../src/config/sam_d21_xpro/system/time/src/sys_time.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/initialization.o: ../src/config/sam_d21_xpro/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/initialization.o.d" -o ${OBJECTDIR}/_ext/128142748/initialization.o ../src/config/sam_d21_xpro/initialization.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/interrupts.o: ../src/config/sam_d21_xpro/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/interrupts.o.d" -o ${OBJECTDIR}/_ext/128142748/interrupts.o ../src/config/sam_d21_xpro/interrupts.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/exceptions.o: ../src/config/sam_d21_xpro/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/exceptions.o.d" -o ${OBJECTDIR}/_ext/128142748/exceptions.o ../src/config/sam_d21_xpro/exceptions.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/startup_xc32.o: ../src/config/sam_d21_xpro/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/128142748/startup_xc32.o ../src/config/sam_d21_xpro/startup_xc32.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/libc_syscalls.o: ../src/config/sam_d21_xpro/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/128142748/libc_syscalls.o ../src/config/sam_d21_xpro/libc_syscalls.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/tasks.o: ../src/config/sam_d21_xpro/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/tasks.o.d" -o ${OBJECTDIR}/_ext/128142748/tasks.o ../src/config/sam_d21_xpro/tasks.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_mxt.o: ../src/app_mxt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mxt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mxt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_mxt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_mxt.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_mxt.o ../src/app_mxt.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1011596308/bsp.o: ../src/config/sam_d21_xpro/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1011596308" 
	@${RM} ${OBJECTDIR}/_ext/1011596308/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1011596308/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1011596308/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1011596308/bsp.o.d" -o ${OBJECTDIR}/_ext/1011596308/bsp.o ../src/config/sam_d21_xpro/bsp/bsp.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi_plib_interface.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_plib_interface.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o: ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/283281740" 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o.d" -o ${OBJECTDIR}/_ext/283281740/drv_sdspi_file_system.o ../src/config/sam_d21_xpro/driver/sdspi/src/drv_sdspi_file_system.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/600686086/plib_clock.o: ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/600686086" 
	@${RM} ${OBJECTDIR}/_ext/600686086/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/600686086/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/600686086/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/600686086/plib_clock.o.d" -o ${OBJECTDIR}/_ext/600686086/plib_clock.o ../src/config/sam_d21_xpro/peripheral/clock/plib_clock.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2010544706/plib_dsu.o: ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2010544706" 
	@${RM} ${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d 
	@${RM} ${OBJECTDIR}/_ext/2010544706/plib_dsu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2010544706/plib_dsu.o.d" -o ${OBJECTDIR}/_ext/2010544706/plib_dsu.o ../src/config/sam_d21_xpro/peripheral/dsu/plib_dsu.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/602835572/plib_evsys.o: ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/602835572" 
	@${RM} ${OBJECTDIR}/_ext/602835572/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/602835572/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/602835572/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/602835572/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/602835572/plib_evsys.o ../src/config/sam_d21_xpro/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2097924074/plib_nvic.o: ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2097924074" 
	@${RM} ${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2097924074/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2097924074/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/2097924074/plib_nvic.o ../src/config/sam_d21_xpro/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o: ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1104193656" 
	@${RM} ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1104193656/plib_nvmctrl.o ../src/config/sam_d21_xpro/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2010533750/plib_pac.o: ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2010533750" 
	@${RM} ${OBJECTDIR}/_ext/2010533750/plib_pac.o.d 
	@${RM} ${OBJECTDIR}/_ext/2010533750/plib_pac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2010533750/plib_pac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2010533750/plib_pac.o.d" -o ${OBJECTDIR}/_ext/2010533750/plib_pac.o ../src/config/sam_d21_xpro/peripheral/pac/plib_pac.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2097977225/plib_port.o: ../src/config/sam_d21_xpro/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2097977225" 
	@${RM} ${OBJECTDIR}/_ext/2097977225/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/2097977225/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2097977225/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2097977225/plib_port.o.d" -o ${OBJECTDIR}/_ext/2097977225/plib_port.o ../src/config/sam_d21_xpro/peripheral/port/plib_port.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o: ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1499407027" 
	@${RM} ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/1499407027/plib_sercom2_i2c_master.o ../src/config/sam_d21_xpro/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o: ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1625846887" 
	@${RM} ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o.d" -o ${OBJECTDIR}/_ext/1625846887/plib_sercom0_spi.o ../src/config/sam_d21_xpro/peripheral/sercom/spim/plib_sercom0_spi.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o: ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1136425057" 
	@${RM} ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/1136425057/plib_sercom3_usart.o ../src/config/sam_d21_xpro/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/869718558/plib_systick.o: ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/869718558" 
	@${RM} ${OBJECTDIR}/_ext/869718558/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/869718558/plib_systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/869718558/plib_systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/869718558/plib_systick.o.d" -o ${OBJECTDIR}/_ext/869718558/plib_systick.o ../src/config/sam_d21_xpro/peripheral/systick/plib_systick.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/480497801/plib_tc3.o: ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/480497801" 
	@${RM} ${OBJECTDIR}/_ext/480497801/plib_tc3.o.d 
	@${RM} ${OBJECTDIR}/_ext/480497801/plib_tc3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/480497801/plib_tc3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/480497801/plib_tc3.o.d" -o ${OBJECTDIR}/_ext/480497801/plib_tc3.o ../src/config/sam_d21_xpro/peripheral/tc/plib_tc3.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1497164574/xc32_monitor.o: ../src/config/sam_d21_xpro/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1497164574" 
	@${RM} ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1497164574/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1497164574/xc32_monitor.o ../src/config/sam_d21_xpro/stdio/xc32_monitor.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/221584075/sys_command.o: ../src/config/sam_d21_xpro/system/command/src/sys_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/221584075" 
	@${RM} ${OBJECTDIR}/_ext/221584075/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/221584075/sys_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/221584075/sys_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/221584075/sys_command.o.d" -o ${OBJECTDIR}/_ext/221584075/sys_command.o ../src/config/sam_d21_xpro/system/command/src/sys_command.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/235128105/sys_console.o: ../src/config/sam_d21_xpro/system/console/src/sys_console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/235128105" 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/235128105/sys_console.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/235128105/sys_console.o.d" -o ${OBJECTDIR}/_ext/235128105/sys_console.o ../src/config/sam_d21_xpro/system/console/src/sys_console.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/235128105/sys_console_uart.o: ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/235128105" 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/235128105/sys_console_uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/235128105/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/235128105/sys_console_uart.o ../src/config/sam_d21_xpro/system/console/src/sys_console_uart.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2025987491/sys_dma.o: ../src/config/sam_d21_xpro/system/dma/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2025987491" 
	@${RM} ${OBJECTDIR}/_ext/2025987491/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/2025987491/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2025987491/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2025987491/sys_dma.o.d" -o ${OBJECTDIR}/_ext/2025987491/sys_dma.o ../src/config/sam_d21_xpro/system/dma/sys_dma.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2050482443/ff.o: ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2050482443" 
	@${RM} ${OBJECTDIR}/_ext/2050482443/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/2050482443/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2050482443/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2050482443/ff.o.d" -o ${OBJECTDIR}/_ext/2050482443/ff.o ../src/config/sam_d21_xpro/system/fs/fat_fs/src/ff.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2050482443/diskio.o: ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2050482443" 
	@${RM} ${OBJECTDIR}/_ext/2050482443/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2050482443/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2050482443/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/2050482443/diskio.o.d" -o ${OBJECTDIR}/_ext/2050482443/diskio.o ../src/config/sam_d21_xpro/system/fs/fat_fs/src/diskio.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/920642281/sys_fs.o: ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/920642281" 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/920642281/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/920642281/sys_fs.o.d" -o ${OBJECTDIR}/_ext/920642281/sys_fs.o ../src/config/sam_d21_xpro/system/fs/src/sys_fs.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o: ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/920642281" 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/920642281/sys_fs_media_manager.o ../src/config/sam_d21_xpro/system/fs/src/sys_fs_media_manager.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/189042961/sys_int.o: ../src/config/sam_d21_xpro/system/int/src/sys_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/189042961" 
	@${RM} ${OBJECTDIR}/_ext/189042961/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/189042961/sys_int.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/189042961/sys_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/189042961/sys_int.o.d" -o ${OBJECTDIR}/_ext/189042961/sys_int.o ../src/config/sam_d21_xpro/system/int/src/sys_int.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/130570711/sys_time.o: ../src/config/sam_d21_xpro/system/time/src/sys_time.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/130570711" 
	@${RM} ${OBJECTDIR}/_ext/130570711/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/130570711/sys_time.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/130570711/sys_time.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/130570711/sys_time.o.d" -o ${OBJECTDIR}/_ext/130570711/sys_time.o ../src/config/sam_d21_xpro/system/time/src/sys_time.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/initialization.o: ../src/config/sam_d21_xpro/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/initialization.o.d" -o ${OBJECTDIR}/_ext/128142748/initialization.o ../src/config/sam_d21_xpro/initialization.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/interrupts.o: ../src/config/sam_d21_xpro/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/interrupts.o.d" -o ${OBJECTDIR}/_ext/128142748/interrupts.o ../src/config/sam_d21_xpro/interrupts.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/exceptions.o: ../src/config/sam_d21_xpro/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/exceptions.o.d" -o ${OBJECTDIR}/_ext/128142748/exceptions.o ../src/config/sam_d21_xpro/exceptions.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/startup_xc32.o: ../src/config/sam_d21_xpro/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/128142748/startup_xc32.o ../src/config/sam_d21_xpro/startup_xc32.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/libc_syscalls.o: ../src/config/sam_d21_xpro/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/128142748/libc_syscalls.o ../src/config/sam_d21_xpro/libc_syscalls.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/128142748/tasks.o: ../src/config/sam_d21_xpro/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/128142748" 
	@${RM} ${OBJECTDIR}/_ext/128142748/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/128142748/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/128142748/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/128142748/tasks.o.d" -o ${OBJECTDIR}/_ext/128142748/tasks.o ../src/config/sam_d21_xpro/tasks.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_mxt.o: ../src/app_mxt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mxt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mxt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_mxt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"../src" -I"../src/config/sam_d21_xpro" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_mxt.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_mxt.o ../src/app_mxt.c    -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1548,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}/samd21a
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_d21_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1548,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}/samd21a
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/sam_d21_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sam_d21_xpro
	${RM} -r dist/sam_d21_xpro

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
