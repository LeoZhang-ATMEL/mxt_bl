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
ifeq "$(wildcard nbproject/Makefile-local-sam_da1_xpro.mk)" "nbproject/Makefile-local-sam_da1_xpro.mk"
include nbproject/Makefile-local-sam_da1_xpro.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_da1_xpro
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c ../src/main_d2x.c ../src/config/sam_da1_xpro/initialization.c ../src/config/sam_da1_xpro/interrupts.c ../src/config/sam_da1_xpro/exceptions.c ../src/config/sam_da1_xpro/stdio/xc32_monitor.c ../src/config/sam_da1_xpro/peripheral/port/plib_port.c ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c ../src/config/sam_da1_xpro/startup_xc32.c ../src/config/sam_da1_xpro/libc_syscalls.c ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o ${OBJECTDIR}/_ext/1748485477/plib_evsys.o ${OBJECTDIR}/_ext/1360937237/main_d2x.o ${OBJECTDIR}/_ext/1365142701/initialization.o ${OBJECTDIR}/_ext/1365142701/interrupts.o ${OBJECTDIR}/_ext/1365142701/exceptions.o ${OBJECTDIR}/_ext/592125133/xc32_monitor.o ${OBJECTDIR}/_ext/472365688/plib_port.o ${OBJECTDIR}/_ext/1746335991/plib_clock.o ${OBJECTDIR}/_ext/472312537/plib_nvic.o ${OBJECTDIR}/_ext/588212371/plib_systick.o ${OBJECTDIR}/_ext/1365142701/startup_xc32.o ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o ${OBJECTDIR}/_ext/863060404/plib_pm.o ${OBJECTDIR}/_ext/985058152/plib_eic.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d ${OBJECTDIR}/_ext/1360937237/main_d2x.o.d ${OBJECTDIR}/_ext/1365142701/initialization.o.d ${OBJECTDIR}/_ext/1365142701/interrupts.o.d ${OBJECTDIR}/_ext/1365142701/exceptions.o.d ${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d ${OBJECTDIR}/_ext/472365688/plib_port.o.d ${OBJECTDIR}/_ext/1746335991/plib_clock.o.d ${OBJECTDIR}/_ext/472312537/plib_nvic.o.d ${OBJECTDIR}/_ext/588212371/plib_systick.o.d ${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d ${OBJECTDIR}/_ext/863060404/plib_pm.o.d ${OBJECTDIR}/_ext/985058152/plib_eic.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o ${OBJECTDIR}/_ext/1748485477/plib_evsys.o ${OBJECTDIR}/_ext/1360937237/main_d2x.o ${OBJECTDIR}/_ext/1365142701/initialization.o ${OBJECTDIR}/_ext/1365142701/interrupts.o ${OBJECTDIR}/_ext/1365142701/exceptions.o ${OBJECTDIR}/_ext/592125133/xc32_monitor.o ${OBJECTDIR}/_ext/472365688/plib_port.o ${OBJECTDIR}/_ext/1746335991/plib_clock.o ${OBJECTDIR}/_ext/472312537/plib_nvic.o ${OBJECTDIR}/_ext/588212371/plib_systick.o ${OBJECTDIR}/_ext/1365142701/startup_xc32.o ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o ${OBJECTDIR}/_ext/863060404/plib_pm.o ${OBJECTDIR}/_ext/985058152/plib_eic.o

# Source Files
SOURCEFILES=../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c ../src/main_d2x.c ../src/config/sam_da1_xpro/initialization.c ../src/config/sam_da1_xpro/interrupts.c ../src/config/sam_da1_xpro/exceptions.c ../src/config/sam_da1_xpro/stdio/xc32_monitor.c ../src/config/sam_da1_xpro/peripheral/port/plib_port.c ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c ../src/config/sam_da1_xpro/startup_xc32.c ../src/config/sam_da1_xpro/libc_syscalls.c ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c

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
	${MAKE}  -f nbproject/Makefile-sam_da1_xpro.mk dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMDA1J16B
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
${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o: ../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828697202" 
	@${RM} ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o ../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o: ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/353737273" 
	@${RM} ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1748485477/plib_evsys.o: ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1748485477" 
	@${RM} ${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1748485477/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1748485477/plib_evsys.o ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main_d2x.o: ../src/main_d2x.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_d2x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_d2x.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main_d2x.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_d2x.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_d2x.o ../src/main_d2x.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/initialization.o: ../src/config/sam_da1_xpro/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/initialization.o.d" -o ${OBJECTDIR}/_ext/1365142701/initialization.o ../src/config/sam_da1_xpro/initialization.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/interrupts.o: ../src/config/sam_da1_xpro/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/interrupts.o.d" -o ${OBJECTDIR}/_ext/1365142701/interrupts.o ../src/config/sam_da1_xpro/interrupts.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/exceptions.o: ../src/config/sam_da1_xpro/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/exceptions.o.d" -o ${OBJECTDIR}/_ext/1365142701/exceptions.o ../src/config/sam_da1_xpro/exceptions.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/592125133/xc32_monitor.o: ../src/config/sam_da1_xpro/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/592125133" 
	@${RM} ${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/592125133/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/592125133/xc32_monitor.o ../src/config/sam_da1_xpro/stdio/xc32_monitor.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/472365688/plib_port.o: ../src/config/sam_da1_xpro/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/472365688" 
	@${RM} ${OBJECTDIR}/_ext/472365688/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/472365688/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/472365688/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/472365688/plib_port.o.d" -o ${OBJECTDIR}/_ext/472365688/plib_port.o ../src/config/sam_da1_xpro/peripheral/port/plib_port.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1746335991/plib_clock.o: ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1746335991" 
	@${RM} ${OBJECTDIR}/_ext/1746335991/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1746335991/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1746335991/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1746335991/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1746335991/plib_clock.o ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/472312537/plib_nvic.o: ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/472312537" 
	@${RM} ${OBJECTDIR}/_ext/472312537/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/472312537/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/472312537/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/472312537/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/472312537/plib_nvic.o ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/588212371/plib_systick.o: ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/588212371" 
	@${RM} ${OBJECTDIR}/_ext/588212371/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/588212371/plib_systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/588212371/plib_systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/588212371/plib_systick.o.d" -o ${OBJECTDIR}/_ext/588212371/plib_systick.o ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/startup_xc32.o: ../src/config/sam_da1_xpro/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1365142701/startup_xc32.o ../src/config/sam_da1_xpro/startup_xc32.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/libc_syscalls.o: ../src/config/sam_da1_xpro/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o ../src/config/sam_da1_xpro/libc_syscalls.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/863060404/plib_pm.o: ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863060404" 
	@${RM} ${OBJECTDIR}/_ext/863060404/plib_pm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863060404/plib_pm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/863060404/plib_pm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/863060404/plib_pm.o.d" -o ${OBJECTDIR}/_ext/863060404/plib_pm.o ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/985058152/plib_eic.o: ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/985058152" 
	@${RM} ${OBJECTDIR}/_ext/985058152/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/985058152/plib_eic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/985058152/plib_eic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/985058152/plib_eic.o.d" -o ${OBJECTDIR}/_ext/985058152/plib_eic.o ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o: ../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828697202" 
	@${RM} ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/1828697202/plib_sercom3_usart.o ../src/config/sam_da1_xpro/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o: ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/353737273" 
	@${RM} ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/353737273/plib_nvmctrl.o ../src/config/sam_da1_xpro/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1748485477/plib_evsys.o: ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1748485477" 
	@${RM} ${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1748485477/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1748485477/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1748485477/plib_evsys.o ../src/config/sam_da1_xpro/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main_d2x.o: ../src/main_d2x.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_d2x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_d2x.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main_d2x.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_d2x.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_d2x.o ../src/main_d2x.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/initialization.o: ../src/config/sam_da1_xpro/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/initialization.o.d" -o ${OBJECTDIR}/_ext/1365142701/initialization.o ../src/config/sam_da1_xpro/initialization.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/interrupts.o: ../src/config/sam_da1_xpro/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/interrupts.o.d" -o ${OBJECTDIR}/_ext/1365142701/interrupts.o ../src/config/sam_da1_xpro/interrupts.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/exceptions.o: ../src/config/sam_da1_xpro/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/exceptions.o.d" -o ${OBJECTDIR}/_ext/1365142701/exceptions.o ../src/config/sam_da1_xpro/exceptions.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/592125133/xc32_monitor.o: ../src/config/sam_da1_xpro/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/592125133" 
	@${RM} ${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/592125133/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/592125133/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/592125133/xc32_monitor.o ../src/config/sam_da1_xpro/stdio/xc32_monitor.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/472365688/plib_port.o: ../src/config/sam_da1_xpro/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/472365688" 
	@${RM} ${OBJECTDIR}/_ext/472365688/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/472365688/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/472365688/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/472365688/plib_port.o.d" -o ${OBJECTDIR}/_ext/472365688/plib_port.o ../src/config/sam_da1_xpro/peripheral/port/plib_port.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1746335991/plib_clock.o: ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1746335991" 
	@${RM} ${OBJECTDIR}/_ext/1746335991/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1746335991/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1746335991/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1746335991/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1746335991/plib_clock.o ../src/config/sam_da1_xpro/peripheral/clock/plib_clock.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/472312537/plib_nvic.o: ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/472312537" 
	@${RM} ${OBJECTDIR}/_ext/472312537/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/472312537/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/472312537/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/472312537/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/472312537/plib_nvic.o ../src/config/sam_da1_xpro/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/588212371/plib_systick.o: ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/588212371" 
	@${RM} ${OBJECTDIR}/_ext/588212371/plib_systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/588212371/plib_systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/588212371/plib_systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/588212371/plib_systick.o.d" -o ${OBJECTDIR}/_ext/588212371/plib_systick.o ../src/config/sam_da1_xpro/peripheral/systick/plib_systick.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/startup_xc32.o: ../src/config/sam_da1_xpro/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1365142701/startup_xc32.o ../src/config/sam_da1_xpro/startup_xc32.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1365142701/libc_syscalls.o: ../src/config/sam_da1_xpro/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1365142701" 
	@${RM} ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1365142701/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1365142701/libc_syscalls.o ../src/config/sam_da1_xpro/libc_syscalls.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/863060404/plib_pm.o: ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863060404" 
	@${RM} ${OBJECTDIR}/_ext/863060404/plib_pm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863060404/plib_pm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/863060404/plib_pm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/863060404/plib_pm.o.d" -o ${OBJECTDIR}/_ext/863060404/plib_pm.o ../src/config/sam_da1_xpro/peripheral/pm/plib_pm.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/985058152/plib_eic.o: ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/985058152" 
	@${RM} ${OBJECTDIR}/_ext/985058152/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/985058152/plib_eic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/985058152/plib_eic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_da1_xpro" -I"../src/packs/ATSAMDA1J16B_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/985058152/plib_eic.o.d" -o ${OBJECTDIR}/_ext/985058152/plib_eic.o ../src/config/sam_da1_xpro/peripheral/eic/plib_eic.c    -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR} ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_da1_xpro=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/sam_da1_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sam_da1_xpro
	${RM} -r dist/sam_da1_xpro

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
