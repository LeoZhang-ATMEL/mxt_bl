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
ifeq "$(wildcard nbproject/Makefile-local-info4_board.mk)" "nbproject/Makefile-local-info4_board.mk"
include nbproject/Makefile-local-info4_board.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=info4_board
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c ../src/config/info4_board/peripheral/evsys/plib_evsys.c ../src/config/info4_board/peripheral/port/plib_port.c ../src/config/info4_board/peripheral/clock/plib_clock.c ../src/config/info4_board/peripheral/nvic/plib_nvic.c ../src/config/info4_board/peripheral/pac/plib_pac.c ../src/config/info4_board/bootloader/bootloader.c ../src/main.c ../src/config/info4_board/startup_xc32.c ../src/config/info4_board/initialization.c ../src/config/info4_board/peripheral/dsu/plib_dsu.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o ${OBJECTDIR}/_ext/476923134/plib_evsys.o ${OBJECTDIR}/_ext/538483777/plib_port.o ${OBJECTDIR}/_ext/474773648/plib_clock.o ${OBJECTDIR}/_ext/538536928/plib_nvic.o ${OBJECTDIR}/_ext/1229555092/plib_pac.o ${OBJECTDIR}/_ext/462598118/bootloader.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1381149338/startup_xc32.o ${OBJECTDIR}/_ext/1381149338/initialization.o ${OBJECTDIR}/_ext/1229544136/plib_dsu.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d ${OBJECTDIR}/_ext/476923134/plib_evsys.o.d ${OBJECTDIR}/_ext/538483777/plib_port.o.d ${OBJECTDIR}/_ext/474773648/plib_clock.o.d ${OBJECTDIR}/_ext/538536928/plib_nvic.o.d ${OBJECTDIR}/_ext/1229555092/plib_pac.o.d ${OBJECTDIR}/_ext/462598118/bootloader.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d ${OBJECTDIR}/_ext/1381149338/initialization.o.d ${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o ${OBJECTDIR}/_ext/476923134/plib_evsys.o ${OBJECTDIR}/_ext/538483777/plib_port.o ${OBJECTDIR}/_ext/474773648/plib_clock.o ${OBJECTDIR}/_ext/538536928/plib_nvic.o ${OBJECTDIR}/_ext/1229555092/plib_pac.o ${OBJECTDIR}/_ext/462598118/bootloader.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1381149338/startup_xc32.o ${OBJECTDIR}/_ext/1381149338/initialization.o ${OBJECTDIR}/_ext/1229544136/plib_dsu.o

# Source Files
SOURCEFILES=../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c ../src/config/info4_board/peripheral/evsys/plib_evsys.c ../src/config/info4_board/peripheral/port/plib_port.c ../src/config/info4_board/peripheral/clock/plib_clock.c ../src/config/info4_board/peripheral/nvic/plib_nvic.c ../src/config/info4_board/peripheral/pac/plib_pac.c ../src/config/info4_board/bootloader/bootloader.c ../src/main.c ../src/config/info4_board/startup_xc32.c ../src/config/info4_board/initialization.c ../src/config/info4_board/peripheral/dsu/plib_dsu.c

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
	${MAKE}  -f nbproject/Makefile-info4_board.mk dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMDA1J16B
MP_LINKER_FILE_OPTION=,--script="..\src\config\info4_board\btl.ld"
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
${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o: ../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1846962286" 
	@${RM} ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o ../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o: ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/189263678" 
	@${RM} ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d" -o ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/476923134/plib_evsys.o: ../src/config/info4_board/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/476923134" 
	@${RM} ${OBJECTDIR}/_ext/476923134/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/476923134/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/476923134/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/476923134/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/476923134/plib_evsys.o ../src/config/info4_board/peripheral/evsys/plib_evsys.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/538483777/plib_port.o: ../src/config/info4_board/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538483777" 
	@${RM} ${OBJECTDIR}/_ext/538483777/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/538483777/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538483777/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/538483777/plib_port.o.d" -o ${OBJECTDIR}/_ext/538483777/plib_port.o ../src/config/info4_board/peripheral/port/plib_port.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/474773648/plib_clock.o: ../src/config/info4_board/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/474773648" 
	@${RM} ${OBJECTDIR}/_ext/474773648/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/474773648/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/474773648/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/474773648/plib_clock.o.d" -o ${OBJECTDIR}/_ext/474773648/plib_clock.o ../src/config/info4_board/peripheral/clock/plib_clock.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/538536928/plib_nvic.o: ../src/config/info4_board/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538536928" 
	@${RM} ${OBJECTDIR}/_ext/538536928/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/538536928/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538536928/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/538536928/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/538536928/plib_nvic.o ../src/config/info4_board/peripheral/nvic/plib_nvic.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1229555092/plib_pac.o: ../src/config/info4_board/peripheral/pac/plib_pac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1229555092" 
	@${RM} ${OBJECTDIR}/_ext/1229555092/plib_pac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1229555092/plib_pac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1229555092/plib_pac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1229555092/plib_pac.o.d" -o ${OBJECTDIR}/_ext/1229555092/plib_pac.o ../src/config/info4_board/peripheral/pac/plib_pac.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/462598118/bootloader.o: ../src/config/info4_board/bootloader/bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/462598118" 
	@${RM} ${OBJECTDIR}/_ext/462598118/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/462598118/bootloader.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462598118/bootloader.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/462598118/bootloader.o.d" -o ${OBJECTDIR}/_ext/462598118/bootloader.o ../src/config/info4_board/bootloader/bootloader.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1381149338/startup_xc32.o: ../src/config/info4_board/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381149338" 
	@${RM} ${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381149338/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1381149338/startup_xc32.o ../src/config/info4_board/startup_xc32.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1381149338/initialization.o: ../src/config/info4_board/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381149338" 
	@${RM} ${OBJECTDIR}/_ext/1381149338/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381149338/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381149338/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1381149338/initialization.o.d" -o ${OBJECTDIR}/_ext/1381149338/initialization.o ../src/config/info4_board/initialization.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1229544136/plib_dsu.o: ../src/config/info4_board/peripheral/dsu/plib_dsu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1229544136" 
	@${RM} ${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1229544136/plib_dsu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d" -o ${OBJECTDIR}/_ext/1229544136/plib_dsu.o ../src/config/info4_board/peripheral/dsu/plib_dsu.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o: ../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1846962286" 
	@${RM} ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1846962286/plib_nvmctrl.o ../src/config/info4_board/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o: ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/189263678" 
	@${RM} ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o.d" -o ${OBJECTDIR}/_ext/189263678/plib_sercom1_i2c_slave.o ../src/config/info4_board/peripheral/sercom/i2c_slave/plib_sercom1_i2c_slave.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/476923134/plib_evsys.o: ../src/config/info4_board/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/476923134" 
	@${RM} ${OBJECTDIR}/_ext/476923134/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/476923134/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/476923134/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/476923134/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/476923134/plib_evsys.o ../src/config/info4_board/peripheral/evsys/plib_evsys.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/538483777/plib_port.o: ../src/config/info4_board/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538483777" 
	@${RM} ${OBJECTDIR}/_ext/538483777/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/538483777/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538483777/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/538483777/plib_port.o.d" -o ${OBJECTDIR}/_ext/538483777/plib_port.o ../src/config/info4_board/peripheral/port/plib_port.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/474773648/plib_clock.o: ../src/config/info4_board/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/474773648" 
	@${RM} ${OBJECTDIR}/_ext/474773648/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/474773648/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/474773648/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/474773648/plib_clock.o.d" -o ${OBJECTDIR}/_ext/474773648/plib_clock.o ../src/config/info4_board/peripheral/clock/plib_clock.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/538536928/plib_nvic.o: ../src/config/info4_board/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538536928" 
	@${RM} ${OBJECTDIR}/_ext/538536928/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/538536928/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538536928/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/538536928/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/538536928/plib_nvic.o ../src/config/info4_board/peripheral/nvic/plib_nvic.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1229555092/plib_pac.o: ../src/config/info4_board/peripheral/pac/plib_pac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1229555092" 
	@${RM} ${OBJECTDIR}/_ext/1229555092/plib_pac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1229555092/plib_pac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1229555092/plib_pac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1229555092/plib_pac.o.d" -o ${OBJECTDIR}/_ext/1229555092/plib_pac.o ../src/config/info4_board/peripheral/pac/plib_pac.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/462598118/bootloader.o: ../src/config/info4_board/bootloader/bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/462598118" 
	@${RM} ${OBJECTDIR}/_ext/462598118/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/462598118/bootloader.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462598118/bootloader.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/462598118/bootloader.o.d" -o ${OBJECTDIR}/_ext/462598118/bootloader.o ../src/config/info4_board/bootloader/bootloader.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1381149338/startup_xc32.o: ../src/config/info4_board/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381149338" 
	@${RM} ${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381149338/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1381149338/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1381149338/startup_xc32.o ../src/config/info4_board/startup_xc32.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1381149338/initialization.o: ../src/config/info4_board/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381149338" 
	@${RM} ${OBJECTDIR}/_ext/1381149338/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381149338/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381149338/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1381149338/initialization.o.d" -o ${OBJECTDIR}/_ext/1381149338/initialization.o ../src/config/info4_board/initialization.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1229544136/plib_dsu.o: ../src/config/info4_board/peripheral/dsu/plib_dsu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1229544136" 
	@${RM} ${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1229544136/plib_dsu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O2 -I"../src" -I"../src/config/info4_board" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1229544136/plib_dsu.o.d" -o ${OBJECTDIR}/_ext/1229544136/plib_dsu.o ../src/config/info4_board/peripheral/dsu/plib_dsu.c    -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/info4_board/btl.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",-DROM_ORIGIN=0x800,-DROM_LENGTH=0xf800,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/info4_board/btl.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_info4_board=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",-DROM_ORIGIN=0x800,-DROM_LENGTH=0xf800,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/info4_board.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/info4_board
	${RM} -r dist/info4_board

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
