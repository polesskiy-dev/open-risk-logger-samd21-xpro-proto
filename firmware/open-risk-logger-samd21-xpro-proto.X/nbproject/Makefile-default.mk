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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../src/sht3x_actor/sht3x_actor.c ../src/sht3x_actor/sht3x_fsm.c ../src/config/default/bsp/bsp.c ../src/config/default/driver/i2c/src/drv_i2c.c ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c ../src/config/default/peripheral/clock/plib_clock.c ../src/config/default/peripheral/eic/plib_eic.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/default/peripheral/port/plib_port.c ../src/config/default/peripheral/rtc/plib_rtc_clock.c ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c ../src/config/default/peripheral/tc/plib_tc3.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/system/console/src/sys_console.c ../src/config/default/system/console/src/sys_console_usb_cdc.c ../src/config/default/system/debug/src/sys_debug.c ../src/config/default/system/int/src/sys_int.c ../src/config/default/system/time/src/sys_time.c ../src/config/default/usb/src/usb_device.c ../src/config/default/usb/src/usb_device_cdc.c ../src/config/default/usb/src/usb_device_cdc_acm.c ../src/config/default/usb/src/usb_device_msd.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../src/config/default/startup_xc32.c ../src/config/default/libc_syscalls.c ../src/config/default/usb_device_init_data.c ../src/config/default/tasks.c ../src/main.c ../src/config/default/diskImage.c ../src/state_machine_management/event/event.c ../src/state_machine_management/queue/queue.c ../src/state_machine_management/fsm.c ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c ../src/config/default/library/cryptoauthlib/atca_cfgs.c ../src/config/default/library/cryptoauthlib/atca_debug.c ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c ../src/config/default/library/cryptoauthlib/atca_helpers.c ../src/config/default/library/cryptoauthlib/atca_basic.c ../src/config/default/library/cryptoauthlib/atca_iface.c ../src/config/default/library/cryptoauthlib/atca_device.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c ../src/config/default/library/cryptoauthlib/calib/calib_info.c ../src/config/default/library/cryptoauthlib/calib/calib_random.c ../src/config/default/library/cryptoauthlib/calib/calib_verify.c ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c ../src/config/default/library/cryptoauthlib/calib/calib_execution.c ../src/config/default/library/cryptoauthlib/calib/calib_read.c ../src/config/default/library/cryptoauthlib/calib/calib_sign.c ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c ../src/config/default/library/cryptoauthlib/calib/calib_command.c ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c ../src/config/default/library/cryptoauthlib/calib/calib_sha.c ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c ../src/config/default/library/cryptoauthlib/calib/calib_basic.c ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c ../src/config/default/library/cryptoauthlib/calib/calib_lock.c ../src/config/default/library/cryptoauthlib/calib/calib_write.c ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c ../src/config/default/library/cryptoauthlib/calib/calib_counter.c ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c ../src/config/default/library/cryptoauthlib/calib/calib_mac.c ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c ../src/config/default/library/cryptoauthlib/calib/calib_aes.c ../src/config/default/library/cryptoauthlib/host/atca_host.c ../src/config/default/library/cryptoauthlib/hal/atca_hal.c ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c ../src/config/default/driver/memory/src/drv_memory.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1210054560/sht3x_actor.o ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o ${OBJECTDIR}/_ext/1434821282/bsp.o ${OBJECTDIR}/_ext/158385033/drv_i2c.o ${OBJECTDIR}/_ext/675273573/drv_at25df.o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ${OBJECTDIR}/_ext/60167341/plib_eic.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ${OBJECTDIR}/_ext/1865521619/plib_port.o ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o ${OBJECTDIR}/_ext/829342655/plib_tc3.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1832805299/sys_console.o ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/944882569/sys_debug.o ${OBJECTDIR}/_ext/1881668453/sys_int.o ${OBJECTDIR}/_ext/101884895/sys_time.o ${OBJECTDIR}/_ext/308758920/usb_device.o ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/308758920/usb_device_msd.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o ${OBJECTDIR}/_ext/1171490990/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1171490990/diskImage.o ${OBJECTDIR}/_ext/1927247122/event.o ${OBJECTDIR}/_ext/1916194459/queue.o ${OBJECTDIR}/_ext/1520445795/fsm.o ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o ${OBJECTDIR}/_ext/2017208766/sha1_routines.o ${OBJECTDIR}/_ext/2017208766/sha2_routines.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o ${OBJECTDIR}/_ext/1390034497/atca_jwt.o ${OBJECTDIR}/_ext/701127929/atca_cfgs.o ${OBJECTDIR}/_ext/701127929/atca_debug.o ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o ${OBJECTDIR}/_ext/701127929/atca_helpers.o ${OBJECTDIR}/_ext/701127929/atca_basic.o ${OBJECTDIR}/_ext/701127929/atca_iface.o ${OBJECTDIR}/_ext/701127929/atca_device.o ${OBJECTDIR}/_ext/35538813/atcacert_client.o ${OBJECTDIR}/_ext/35538813/atcacert_date.o ${OBJECTDIR}/_ext/35538813/atcacert_def.o ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o ${OBJECTDIR}/_ext/35538813/atcacert_pem.o ${OBJECTDIR}/_ext/35538813/atcacert_der.o ${OBJECTDIR}/_ext/95446945/calib_info.o ${OBJECTDIR}/_ext/95446945/calib_random.o ${OBJECTDIR}/_ext/95446945/calib_verify.o ${OBJECTDIR}/_ext/95446945/calib_privwrite.o ${OBJECTDIR}/_ext/95446945/calib_execution.o ${OBJECTDIR}/_ext/95446945/calib_read.o ${OBJECTDIR}/_ext/95446945/calib_sign.o ${OBJECTDIR}/_ext/95446945/calib_selftest.o ${OBJECTDIR}/_ext/95446945/calib_nonce.o ${OBJECTDIR}/_ext/95446945/calib_hmac.o ${OBJECTDIR}/_ext/95446945/calib_command.o ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o ${OBJECTDIR}/_ext/95446945/calib_sha.o ${OBJECTDIR}/_ext/95446945/calib_ecdh.o ${OBJECTDIR}/_ext/95446945/calib_helpers.o ${OBJECTDIR}/_ext/95446945/calib_basic.o ${OBJECTDIR}/_ext/95446945/calib_kdf.o ${OBJECTDIR}/_ext/95446945/calib_gendig.o ${OBJECTDIR}/_ext/95446945/calib_secureboot.o ${OBJECTDIR}/_ext/95446945/calib_lock.o ${OBJECTDIR}/_ext/95446945/calib_write.o ${OBJECTDIR}/_ext/95446945/calib_genkey.o ${OBJECTDIR}/_ext/95446945/calib_counter.o ${OBJECTDIR}/_ext/95446945/calib_derivekey.o ${OBJECTDIR}/_ext/95446945/calib_mac.o ${OBJECTDIR}/_ext/95446945/calib_checkmac.o ${OBJECTDIR}/_ext/95446945/calib_updateextra.o ${OBJECTDIR}/_ext/95446945/calib_aes.o ${OBJECTDIR}/_ext/141463632/atca_host.o ${OBJECTDIR}/_ext/1390037109/atca_hal.o ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o ${OBJECTDIR}/_ext/992804092/drv_memory.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1210054560/sht3x_actor.o.d ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o.d ${OBJECTDIR}/_ext/1434821282/bsp.o.d ${OBJECTDIR}/_ext/158385033/drv_i2c.o.d ${OBJECTDIR}/_ext/675273573/drv_at25df.o.d ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o.d ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o.d ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d ${OBJECTDIR}/_ext/60167341/plib_eic.o.d ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/1865521619/plib_port.o.d ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o.d ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o.d ${OBJECTDIR}/_ext/829342655/plib_tc3.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1832805299/sys_console.o.d ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o.d ${OBJECTDIR}/_ext/944882569/sys_debug.o.d ${OBJECTDIR}/_ext/1881668453/sys_int.o.d ${OBJECTDIR}/_ext/101884895/sys_time.o.d ${OBJECTDIR}/_ext/308758920/usb_device.o.d ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o.d ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o.d ${OBJECTDIR}/_ext/308758920/usb_device_msd.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o.d ${OBJECTDIR}/_ext/1171490990/tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1171490990/diskImage.o.d ${OBJECTDIR}/_ext/1927247122/event.o.d ${OBJECTDIR}/_ext/1916194459/queue.o.d ${OBJECTDIR}/_ext/1520445795/fsm.o.d ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o.d ${OBJECTDIR}/_ext/2017208766/sha1_routines.o.d ${OBJECTDIR}/_ext/2017208766/sha2_routines.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o.d ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o.d ${OBJECTDIR}/_ext/1390034497/atca_jwt.o.d ${OBJECTDIR}/_ext/701127929/atca_cfgs.o.d ${OBJECTDIR}/_ext/701127929/atca_debug.o.d ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o.d ${OBJECTDIR}/_ext/701127929/atca_helpers.o.d ${OBJECTDIR}/_ext/701127929/atca_basic.o.d ${OBJECTDIR}/_ext/701127929/atca_iface.o.d ${OBJECTDIR}/_ext/701127929/atca_device.o.d ${OBJECTDIR}/_ext/35538813/atcacert_client.o.d ${OBJECTDIR}/_ext/35538813/atcacert_date.o.d ${OBJECTDIR}/_ext/35538813/atcacert_def.o.d ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o.d ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o.d ${OBJECTDIR}/_ext/35538813/atcacert_pem.o.d ${OBJECTDIR}/_ext/35538813/atcacert_der.o.d ${OBJECTDIR}/_ext/95446945/calib_info.o.d ${OBJECTDIR}/_ext/95446945/calib_random.o.d ${OBJECTDIR}/_ext/95446945/calib_verify.o.d ${OBJECTDIR}/_ext/95446945/calib_privwrite.o.d ${OBJECTDIR}/_ext/95446945/calib_execution.o.d ${OBJECTDIR}/_ext/95446945/calib_read.o.d ${OBJECTDIR}/_ext/95446945/calib_sign.o.d ${OBJECTDIR}/_ext/95446945/calib_selftest.o.d ${OBJECTDIR}/_ext/95446945/calib_nonce.o.d ${OBJECTDIR}/_ext/95446945/calib_hmac.o.d ${OBJECTDIR}/_ext/95446945/calib_command.o.d ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o.d ${OBJECTDIR}/_ext/95446945/calib_sha.o.d ${OBJECTDIR}/_ext/95446945/calib_ecdh.o.d ${OBJECTDIR}/_ext/95446945/calib_helpers.o.d ${OBJECTDIR}/_ext/95446945/calib_basic.o.d ${OBJECTDIR}/_ext/95446945/calib_kdf.o.d ${OBJECTDIR}/_ext/95446945/calib_gendig.o.d ${OBJECTDIR}/_ext/95446945/calib_secureboot.o.d ${OBJECTDIR}/_ext/95446945/calib_lock.o.d ${OBJECTDIR}/_ext/95446945/calib_write.o.d ${OBJECTDIR}/_ext/95446945/calib_genkey.o.d ${OBJECTDIR}/_ext/95446945/calib_counter.o.d ${OBJECTDIR}/_ext/95446945/calib_derivekey.o.d ${OBJECTDIR}/_ext/95446945/calib_mac.o.d ${OBJECTDIR}/_ext/95446945/calib_checkmac.o.d ${OBJECTDIR}/_ext/95446945/calib_updateextra.o.d ${OBJECTDIR}/_ext/95446945/calib_aes.o.d ${OBJECTDIR}/_ext/141463632/atca_host.o.d ${OBJECTDIR}/_ext/1390037109/atca_hal.o.d ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o.d ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o.d ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o.d ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o.d ${OBJECTDIR}/_ext/992804092/drv_memory.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1210054560/sht3x_actor.o ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o ${OBJECTDIR}/_ext/1434821282/bsp.o ${OBJECTDIR}/_ext/158385033/drv_i2c.o ${OBJECTDIR}/_ext/675273573/drv_at25df.o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ${OBJECTDIR}/_ext/60167341/plib_eic.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ${OBJECTDIR}/_ext/1865521619/plib_port.o ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o ${OBJECTDIR}/_ext/829342655/plib_tc3.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1832805299/sys_console.o ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o ${OBJECTDIR}/_ext/944882569/sys_debug.o ${OBJECTDIR}/_ext/1881668453/sys_int.o ${OBJECTDIR}/_ext/101884895/sys_time.o ${OBJECTDIR}/_ext/308758920/usb_device.o ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o ${OBJECTDIR}/_ext/308758920/usb_device_msd.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o ${OBJECTDIR}/_ext/1171490990/tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1171490990/diskImage.o ${OBJECTDIR}/_ext/1927247122/event.o ${OBJECTDIR}/_ext/1916194459/queue.o ${OBJECTDIR}/_ext/1520445795/fsm.o ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o ${OBJECTDIR}/_ext/2017208766/sha1_routines.o ${OBJECTDIR}/_ext/2017208766/sha2_routines.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o ${OBJECTDIR}/_ext/1390034497/atca_jwt.o ${OBJECTDIR}/_ext/701127929/atca_cfgs.o ${OBJECTDIR}/_ext/701127929/atca_debug.o ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o ${OBJECTDIR}/_ext/701127929/atca_helpers.o ${OBJECTDIR}/_ext/701127929/atca_basic.o ${OBJECTDIR}/_ext/701127929/atca_iface.o ${OBJECTDIR}/_ext/701127929/atca_device.o ${OBJECTDIR}/_ext/35538813/atcacert_client.o ${OBJECTDIR}/_ext/35538813/atcacert_date.o ${OBJECTDIR}/_ext/35538813/atcacert_def.o ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o ${OBJECTDIR}/_ext/35538813/atcacert_pem.o ${OBJECTDIR}/_ext/35538813/atcacert_der.o ${OBJECTDIR}/_ext/95446945/calib_info.o ${OBJECTDIR}/_ext/95446945/calib_random.o ${OBJECTDIR}/_ext/95446945/calib_verify.o ${OBJECTDIR}/_ext/95446945/calib_privwrite.o ${OBJECTDIR}/_ext/95446945/calib_execution.o ${OBJECTDIR}/_ext/95446945/calib_read.o ${OBJECTDIR}/_ext/95446945/calib_sign.o ${OBJECTDIR}/_ext/95446945/calib_selftest.o ${OBJECTDIR}/_ext/95446945/calib_nonce.o ${OBJECTDIR}/_ext/95446945/calib_hmac.o ${OBJECTDIR}/_ext/95446945/calib_command.o ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o ${OBJECTDIR}/_ext/95446945/calib_sha.o ${OBJECTDIR}/_ext/95446945/calib_ecdh.o ${OBJECTDIR}/_ext/95446945/calib_helpers.o ${OBJECTDIR}/_ext/95446945/calib_basic.o ${OBJECTDIR}/_ext/95446945/calib_kdf.o ${OBJECTDIR}/_ext/95446945/calib_gendig.o ${OBJECTDIR}/_ext/95446945/calib_secureboot.o ${OBJECTDIR}/_ext/95446945/calib_lock.o ${OBJECTDIR}/_ext/95446945/calib_write.o ${OBJECTDIR}/_ext/95446945/calib_genkey.o ${OBJECTDIR}/_ext/95446945/calib_counter.o ${OBJECTDIR}/_ext/95446945/calib_derivekey.o ${OBJECTDIR}/_ext/95446945/calib_mac.o ${OBJECTDIR}/_ext/95446945/calib_checkmac.o ${OBJECTDIR}/_ext/95446945/calib_updateextra.o ${OBJECTDIR}/_ext/95446945/calib_aes.o ${OBJECTDIR}/_ext/141463632/atca_host.o ${OBJECTDIR}/_ext/1390037109/atca_hal.o ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o ${OBJECTDIR}/_ext/992804092/drv_memory.o

# Source Files
SOURCEFILES=../src/sht3x_actor/sht3x_actor.c ../src/sht3x_actor/sht3x_fsm.c ../src/config/default/bsp/bsp.c ../src/config/default/driver/i2c/src/drv_i2c.c ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c ../src/config/default/peripheral/clock/plib_clock.c ../src/config/default/peripheral/eic/plib_eic.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/default/peripheral/port/plib_port.c ../src/config/default/peripheral/rtc/plib_rtc_clock.c ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c ../src/config/default/peripheral/tc/plib_tc3.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/system/console/src/sys_console.c ../src/config/default/system/console/src/sys_console_usb_cdc.c ../src/config/default/system/debug/src/sys_debug.c ../src/config/default/system/int/src/sys_int.c ../src/config/default/system/time/src/sys_time.c ../src/config/default/usb/src/usb_device.c ../src/config/default/usb/src/usb_device_cdc.c ../src/config/default/usb/src/usb_device_cdc_acm.c ../src/config/default/usb/src/usb_device_msd.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../src/config/default/startup_xc32.c ../src/config/default/libc_syscalls.c ../src/config/default/usb_device_init_data.c ../src/config/default/tasks.c ../src/main.c ../src/config/default/diskImage.c ../src/state_machine_management/event/event.c ../src/state_machine_management/queue/queue.c ../src/state_machine_management/fsm.c ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c ../src/config/default/library/cryptoauthlib/atca_cfgs.c ../src/config/default/library/cryptoauthlib/atca_debug.c ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c ../src/config/default/library/cryptoauthlib/atca_helpers.c ../src/config/default/library/cryptoauthlib/atca_basic.c ../src/config/default/library/cryptoauthlib/atca_iface.c ../src/config/default/library/cryptoauthlib/atca_device.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c ../src/config/default/library/cryptoauthlib/calib/calib_info.c ../src/config/default/library/cryptoauthlib/calib/calib_random.c ../src/config/default/library/cryptoauthlib/calib/calib_verify.c ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c ../src/config/default/library/cryptoauthlib/calib/calib_execution.c ../src/config/default/library/cryptoauthlib/calib/calib_read.c ../src/config/default/library/cryptoauthlib/calib/calib_sign.c ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c ../src/config/default/library/cryptoauthlib/calib/calib_command.c ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c ../src/config/default/library/cryptoauthlib/calib/calib_sha.c ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c ../src/config/default/library/cryptoauthlib/calib/calib_basic.c ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c ../src/config/default/library/cryptoauthlib/calib/calib_lock.c ../src/config/default/library/cryptoauthlib/calib/calib_write.c ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c ../src/config/default/library/cryptoauthlib/calib/calib_counter.c ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c ../src/config/default/library/cryptoauthlib/calib/calib_mac.c ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c ../src/config/default/library/cryptoauthlib/calib/calib_aes.c ../src/config/default/library/cryptoauthlib/host/atca_host.c ../src/config/default/library/cryptoauthlib/hal/atca_hal.c ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c ../src/config/default/driver/memory/src/drv_memory.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMD21J18A
MP_LINKER_FILE_OPTION=,--script="../src/config/default/ATSAMD21J18A.ld"
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
${OBJECTDIR}/_ext/1210054560/sht3x_actor.o: ../src/sht3x_actor/sht3x_actor.c  .generated_files/flags/default/f6eb521743cdacd8a2c375fe3824f37ea6a80a9f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1210054560" 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1210054560/sht3x_actor.o.d" -o ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o ../src/sht3x_actor/sht3x_actor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o: ../src/sht3x_actor/sht3x_fsm.c  .generated_files/flags/default/3a778b0c5244bbda7dc287c32cd982696fd33bf .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1210054560" 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o.d" -o ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o ../src/sht3x_actor/sht3x_fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1434821282/bsp.o: ../src/config/default/bsp/bsp.c  .generated_files/flags/default/6e5830469aa27c26397ab3a61c106c908502686 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1434821282" 
	@${RM} ${OBJECTDIR}/_ext/1434821282/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1434821282/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1434821282/bsp.o.d" -o ${OBJECTDIR}/_ext/1434821282/bsp.o ../src/config/default/bsp/bsp.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/158385033/drv_i2c.o: ../src/config/default/driver/i2c/src/drv_i2c.c  .generated_files/flags/default/98d8e457f455c57ea33e50cdc0f12211eec11ece .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/158385033" 
	@${RM} ${OBJECTDIR}/_ext/158385033/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/158385033/drv_i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/158385033/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/158385033/drv_i2c.o ../src/config/default/driver/i2c/src/drv_i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/675273573/drv_at25df.o: ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c  .generated_files/flags/default/7a312b92b4bb1e572708002394dc1e9fa8119b79 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/675273573" 
	@${RM} ${OBJECTDIR}/_ext/675273573/drv_at25df.o.d 
	@${RM} ${OBJECTDIR}/_ext/675273573/drv_at25df.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/675273573/drv_at25df.o.d" -o ${OBJECTDIR}/_ext/675273573/drv_at25df.o ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o: ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c  .generated_files/flags/default/2e023f595b6b76505113238d772b083585569374 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/818654064" 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o.d 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o.d" -o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o: ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c  .generated_files/flags/default/9238e5d0766f83a7decd241a8cd7fb8fd3a4f5a5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/818654064" 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o.d" -o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1984496892/plib_clock.o: ../src/config/default/peripheral/clock/plib_clock.c  .generated_files/flags/default/20f5dcff00605d6de1bea5404bc420282bd42e1a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1984496892" 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ../src/config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60167341/plib_eic.o: ../src/config/default/peripheral/eic/plib_eic.c  .generated_files/flags/default/7846d22241eda59e95579d1a8d3cb1de98374fc9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/60167341" 
	@${RM} ${OBJECTDIR}/_ext/60167341/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60167341/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60167341/plib_eic.o.d" -o ${OBJECTDIR}/_ext/60167341/plib_eic.o ../src/config/default/peripheral/eic/plib_eic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  .generated_files/flags/default/e98cec0d2af64137497ffd892559f7c33259dfd .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  .generated_files/flags/default/ccbcda2863f7a39e2c0b12a81de2cc639e48ab33 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o: ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/default/638681c11d21b90569168f36a0b26548204dd96a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1593096446" 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865521619/plib_port.o: ../src/config/default/peripheral/port/plib_port.c  .generated_files/flags/default/ab8e90fc3f401c3f44d522fa267cc367d375e999 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1865521619" 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" -o ${OBJECTDIR}/_ext/1865521619/plib_port.o ../src/config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o: ../src/config/default/peripheral/rtc/plib_rtc_clock.c  .generated_files/flags/default/c01f9a5f60e8704ed3787e94a80d23a2cfdb6ced .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/60180175" 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o.d" -o ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o ../src/config/default/peripheral/rtc/plib_rtc_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o: ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/default/12752eca47f32d577d7423d24194da8c7e355d15 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/508257091" 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o: ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c  .generated_files/flags/default/4f8f7a02ea8b71802186436721c1f493760b40a5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/17022449" 
	@${RM} ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o.d" -o ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/829342655/plib_tc3.o: ../src/config/default/peripheral/tc/plib_tc3.c  .generated_files/flags/default/1e87ff7d0047406ea16650766628f8fd188aeb71 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/829342655" 
	@${RM} ${OBJECTDIR}/_ext/829342655/plib_tc3.o.d 
	@${RM} ${OBJECTDIR}/_ext/829342655/plib_tc3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/829342655/plib_tc3.o.d" -o ${OBJECTDIR}/_ext/829342655/plib_tc3.o ../src/config/default/peripheral/tc/plib_tc3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/d5837a566da15d9a49eced3257eea7d2b898764 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1832805299/sys_console.o: ../src/config/default/system/console/src/sys_console.c  .generated_files/flags/default/63dfa26b3350d7888d18f2bd7bd20988c883ff47 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1832805299" 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1832805299/sys_console.o.d" -o ${OBJECTDIR}/_ext/1832805299/sys_console.o ../src/config/default/system/console/src/sys_console.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o: ../src/config/default/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/default/406cba8ef4a0e9fb758a1666bbb85398383e348c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1832805299" 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o ../src/config/default/system/console/src/sys_console_usb_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/944882569/sys_debug.o: ../src/config/default/system/debug/src/sys_debug.c  .generated_files/flags/default/6e27fc7a68478a972af00ce32306f64a16f7b421 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/944882569" 
	@${RM} ${OBJECTDIR}/_ext/944882569/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/944882569/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/944882569/sys_debug.o.d" -o ${OBJECTDIR}/_ext/944882569/sys_debug.o ../src/config/default/system/debug/src/sys_debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1881668453/sys_int.o: ../src/config/default/system/int/src/sys_int.c  .generated_files/flags/default/b5730fc4713be0376a1f37ffdd992e761d64a625 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1881668453" 
	@${RM} ${OBJECTDIR}/_ext/1881668453/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1881668453/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1881668453/sys_int.o.d" -o ${OBJECTDIR}/_ext/1881668453/sys_int.o ../src/config/default/system/int/src/sys_int.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101884895/sys_time.o: ../src/config/default/system/time/src/sys_time.c  .generated_files/flags/default/7b19da963cb69efb449c82dc2b0d2cb6137ea900 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/101884895" 
	@${RM} ${OBJECTDIR}/_ext/101884895/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/101884895/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/101884895/sys_time.o.d" -o ${OBJECTDIR}/_ext/101884895/sys_time.o ../src/config/default/system/time/src/sys_time.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device.o: ../src/config/default/usb/src/usb_device.c  .generated_files/flags/default/7cf4f26ff5a79668f9b005a416cfe265a3420b3d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device.o ../src/config/default/usb/src/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_cdc.o: ../src/config/default/usb/src/usb_device_cdc.c  .generated_files/flags/default/b0be91b7fc34482e4a5f74ff1c6663bf3bf0de8e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o ../src/config/default/usb/src/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o: ../src/config/default/usb/src/usb_device_cdc_acm.c  .generated_files/flags/default/97da0f3d1581c0a4279aa36aa51cbf4100b074be .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o ../src/config/default/usb/src/usb_device_cdc_acm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_msd.o: ../src/config/default/usb/src/usb_device_msd.c  .generated_files/flags/default/d8b45ca5164450766d2f565dea165c236836b46a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_msd.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_msd.o ../src/config/default/usb/src/usb_device_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/939dbc43a2fab9a54394f9123d74e5897eff0cea .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/5692aebe58f66c911738435f1fa05a959e31a1f0 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/d9d5f2dc6046a93d781ef6321a734963a9c99405 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  .generated_files/flags/default/5e80e362527ab2f3dda6f534a2e989fb87cd313c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  .generated_files/flags/default/c47f6d77b7c146511dbfe77b0ed01a88b1364ffe .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o: ../src/config/default/usb_device_init_data.c  .generated_files/flags/default/fdade678673dce5988ef1227f77341e83c0a8608 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o ../src/config/default/usb_device_init_data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/tasks.o: ../src/config/default/tasks.c  .generated_files/flags/default/62631f3cb6554fdf16ffd8ffd0fbb629f5cf6f45 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/tasks.o.d" -o ${OBJECTDIR}/_ext/1171490990/tasks.o ../src/config/default/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/aad989ebffea84b97cd32ccb3d4cc43ddaf210e5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/diskImage.o: ../src/config/default/diskImage.c  .generated_files/flags/default/df1608c43f30805fa465553044cb074c2beaa401 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/diskImage.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/diskImage.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/diskImage.o.d" -o ${OBJECTDIR}/_ext/1171490990/diskImage.o ../src/config/default/diskImage.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1927247122/event.o: ../src/state_machine_management/event/event.c  .generated_files/flags/default/95c9246dbbb9144f4d3ab413058c4b636f4954cb .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1927247122" 
	@${RM} ${OBJECTDIR}/_ext/1927247122/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927247122/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927247122/event.o.d" -o ${OBJECTDIR}/_ext/1927247122/event.o ../src/state_machine_management/event/event.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1916194459/queue.o: ../src/state_machine_management/queue/queue.c  .generated_files/flags/default/f2b401dca0260a5f6832d35a5f38965195695a02 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1916194459" 
	@${RM} ${OBJECTDIR}/_ext/1916194459/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1916194459/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1916194459/queue.o.d" -o ${OBJECTDIR}/_ext/1916194459/queue.o ../src/state_machine_management/queue/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1520445795/fsm.o: ../src/state_machine_management/fsm.c  .generated_files/flags/default/e7a547939ca8e678a98fa8a6100311488ee3d9e5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1520445795" 
	@${RM} ${OBJECTDIR}/_ext/1520445795/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520445795/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1520445795/fsm.o.d" -o ${OBJECTDIR}/_ext/1520445795/fsm.o ../src/state_machine_management/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/ATECC608_0.o: ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c  .generated_files/flags/default/21814fe2343e308aa9966e85d99e5b33b9318d27 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/ATECC608_0.o.d" -o ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2017208766/sha1_routines.o: ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c  .generated_files/flags/default/7b87dd128e72c7e4e279adc8e9bb1cd4b12e1673 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/2017208766" 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha1_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2017208766/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/2017208766/sha1_routines.o ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2017208766/sha2_routines.o: ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c  .generated_files/flags/default/2c3dfa23ef20eddaea69e1258b39e65de466b908 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/2017208766" 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha2_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2017208766/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/2017208766/sha2_routines.o ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c  .generated_files/flags/default/514efe7116f446921921d787c8eb19cd6e704536 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c  .generated_files/flags/default/3a0dbd4a7ebdbdae61da63116dd87d6430038cdb .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c  .generated_files/flags/default/ecb4d5a92472ea1d83ec1b016ea279e1e48ea111 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c  .generated_files/flags/default/30baa698e7d20c9fc8fb9762fce35984952be26d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c  .generated_files/flags/default/e2e7860e7647b99f694dc837bbd8858c525e04ea .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c  .generated_files/flags/default/24af72ef8538950d887352bbc7663773edc08c1e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c  .generated_files/flags/default/17b5772167980bc29fe98a87b03197ff9e8da8bb .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c  .generated_files/flags/default/acb1f38cbdf6da3d15be2edf9833b45218aaccb4 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c  .generated_files/flags/default/22f47d6d61df4f937944f8c74ebe6bdcf0170628 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390034497/atca_jwt.o: ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c  .generated_files/flags/default/f776335073fbd10898ad14f62c8eb82178a34d5c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390034497" 
	@${RM} ${OBJECTDIR}/_ext/1390034497/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390034497/atca_jwt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390034497/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1390034497/atca_jwt.o ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_cfgs.o: ../src/config/default/library/cryptoauthlib/atca_cfgs.c  .generated_files/flags/default/7412fbdf30714870875432096538c9922984ab7 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_cfgs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_cfgs.o ../src/config/default/library/cryptoauthlib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_debug.o: ../src/config/default/library/cryptoauthlib/atca_debug.c  .generated_files/flags/default/24494ddbb6ec5987c845a94ddbfab971a7c43974 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_debug.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_debug.o ../src/config/default/library/cryptoauthlib/atca_debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o: ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c  .generated_files/flags/default/302c60ce07ae4bd002318feb2efaa9a56e8fab11 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_helpers.o: ../src/config/default/library/cryptoauthlib/atca_helpers.c  .generated_files/flags/default/5eaff36ad373a8db1f010eb053e6c33c18942b25 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_helpers.o ../src/config/default/library/cryptoauthlib/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_basic.o: ../src/config/default/library/cryptoauthlib/atca_basic.c  .generated_files/flags/default/f5e7a621c4d0acad0060b613937e5edb0655a2f2 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_basic.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_basic.o ../src/config/default/library/cryptoauthlib/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_iface.o: ../src/config/default/library/cryptoauthlib/atca_iface.c  .generated_files/flags/default/d4def577c0532a0eac474aae6dbc1e0aed505c93 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_iface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_iface.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_iface.o ../src/config/default/library/cryptoauthlib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_device.o: ../src/config/default/library/cryptoauthlib/atca_device.c  .generated_files/flags/default/45170bc605d18cf2d0f576bf987000b47879b62a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_device.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_device.o ../src/config/default/library/cryptoauthlib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_client.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c  .generated_files/flags/default/3fe9fe6dffa1bbafbb91a1ae2ca0739798eadb35 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_client.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_client.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_date.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c  .generated_files/flags/default/cd234152e380166e7d2586d7bef89a8653dfbe1 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_date.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_date.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_def.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c  .generated_files/flags/default/d01016a68949f2bdb38157f242b44437c8d1b1e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_def.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_def.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c  .generated_files/flags/default/fc7144cc4f22dd487fdeefa0a87e07d436fdf05 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c  .generated_files/flags/default/fdf89a22bd7cef24e168d4fa0e1f92e9d3c342c9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_pem.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c  .generated_files/flags/default/a6f7372cd071327cc3a129f546c642bdf5bf382b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_pem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_pem.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_der.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c  .generated_files/flags/default/30b3016dbb16dbdc7e5fcfe59c2c812063aba266 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_der.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_der.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_info.o: ../src/config/default/library/cryptoauthlib/calib/calib_info.c  .generated_files/flags/default/7f8976d77276a5697960ba8496e347326b5cb0ed .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_info.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_info.o ../src/config/default/library/cryptoauthlib/calib/calib_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_random.o: ../src/config/default/library/cryptoauthlib/calib/calib_random.c  .generated_files/flags/default/d88b4f18207d0da87434d57c9e2a44826fb2988c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_random.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_random.o ../src/config/default/library/cryptoauthlib/calib/calib_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_verify.o: ../src/config/default/library/cryptoauthlib/calib/calib_verify.c  .generated_files/flags/default/c3177cbef5c4b8f35985ef5f937eeff4680603fc .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_verify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_verify.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_verify.o ../src/config/default/library/cryptoauthlib/calib/calib_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_privwrite.o: ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c  .generated_files/flags/default/e687627c67202034a66904d6409ae21e5fa03b67 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_privwrite.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_privwrite.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_privwrite.o ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_execution.o: ../src/config/default/library/cryptoauthlib/calib/calib_execution.c  .generated_files/flags/default/d0ad831005b9fb029a910ad332b4140784635ecd .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_execution.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_execution.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_execution.o ../src/config/default/library/cryptoauthlib/calib/calib_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_read.o: ../src/config/default/library/cryptoauthlib/calib/calib_read.c  .generated_files/flags/default/7927032715e261e40f9f5dba7adb24cdeec80f79 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_read.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_read.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_read.o ../src/config/default/library/cryptoauthlib/calib/calib_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_sign.o: ../src/config/default/library/cryptoauthlib/calib/calib_sign.c  .generated_files/flags/default/4f01ec99e8ff102fad96db62fe2fffbf050d6d8a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sign.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_sign.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_sign.o ../src/config/default/library/cryptoauthlib/calib/calib_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_selftest.o: ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c  .generated_files/flags/default/d7a136a99a3f661e61a7998444e8f450c074f3fc .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_selftest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_selftest.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_selftest.o ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_nonce.o: ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c  .generated_files/flags/default/f5a67ba04dde148f5f1ba2b681b1c4566cd61672 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_nonce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_nonce.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_nonce.o ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_hmac.o: ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c  .generated_files/flags/default/bf742d44e2a42c8fbe4322f5abc0c202bfa41cd3 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_hmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_hmac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_hmac.o ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_command.o: ../src/config/default/library/cryptoauthlib/calib/calib_command.c  .generated_files/flags/default/d82a1d95a24cfb71670a19bc0198f1ad94f91a93 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_command.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_command.o ../src/config/default/library/cryptoauthlib/calib/calib_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o: ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c  .generated_files/flags/default/7a6ea1d0b88007b77863adb91864386f989caaf9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_sha.o: ../src/config/default/library/cryptoauthlib/calib/calib_sha.c  .generated_files/flags/default/eaf01b0f2fbd12b50f9429f72e8e710bf4952ad2 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sha.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_sha.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_sha.o ../src/config/default/library/cryptoauthlib/calib/calib_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_ecdh.o: ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c  .generated_files/flags/default/af92a8bd87c21fab02d5ce1dac9f9ad54e451bed .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_ecdh.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_ecdh.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_ecdh.o ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_helpers.o: ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c  .generated_files/flags/default/ef2550ddeaa1233f1c18aa15b0d7d435a3a7108 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_helpers.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_helpers.o ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_basic.o: ../src/config/default/library/cryptoauthlib/calib/calib_basic.c  .generated_files/flags/default/d28c8fc07384cc1e38debdf03a7463f759f9523d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_basic.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_basic.o ../src/config/default/library/cryptoauthlib/calib/calib_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_kdf.o: ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c  .generated_files/flags/default/b6b944ab0edbed679987bd2687c5fc1524ee1e2e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_kdf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_kdf.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_kdf.o ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_gendig.o: ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c  .generated_files/flags/default/df7145938275b18a0148a999b724d74368322c3 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_gendig.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_gendig.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_gendig.o ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_secureboot.o: ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c  .generated_files/flags/default/2cb545d248bfe4f7b09eefeb76a88dbb22ece5da .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_secureboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_secureboot.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_secureboot.o ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_lock.o: ../src/config/default/library/cryptoauthlib/calib/calib_lock.c  .generated_files/flags/default/2525229dee41060d105c6ecaee9d2dc545f1182f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_lock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_lock.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_lock.o ../src/config/default/library/cryptoauthlib/calib/calib_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_write.o: ../src/config/default/library/cryptoauthlib/calib/calib_write.c  .generated_files/flags/default/825cef2bd0c6629c88f041fefa6944226d78ecde .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_write.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_write.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_write.o ../src/config/default/library/cryptoauthlib/calib/calib_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_genkey.o: ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c  .generated_files/flags/default/8168c2bd83215772b2e7d62758366d1fcd1c5380 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_genkey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_genkey.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_genkey.o ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_counter.o: ../src/config/default/library/cryptoauthlib/calib/calib_counter.c  .generated_files/flags/default/4dc36e12cd31737faff5fbc31fec3dc4d6304539 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_counter.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_counter.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_counter.o ../src/config/default/library/cryptoauthlib/calib/calib_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_derivekey.o: ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c  .generated_files/flags/default/46a8a266d88d460aa023079f6d7252ba092d0aaa .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_derivekey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_derivekey.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_derivekey.o ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_mac.o: ../src/config/default/library/cryptoauthlib/calib/calib_mac.c  .generated_files/flags/default/25b6b70b391cbbc2e0a899ed5c1a3a7ddf730514 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_mac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_mac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_mac.o ../src/config/default/library/cryptoauthlib/calib/calib_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_checkmac.o: ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c  .generated_files/flags/default/27bfe7c067b30489be86572fc60fed63281f41b4 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_checkmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_checkmac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_checkmac.o ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_updateextra.o: ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c  .generated_files/flags/default/99567da03a2fcd491b3d7e090e1e871ced207c20 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_updateextra.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_updateextra.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_updateextra.o ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_aes.o: ../src/config/default/library/cryptoauthlib/calib/calib_aes.c  .generated_files/flags/default/50ff38dbb1f1c546158a6a5709e44481b377a8d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_aes.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_aes.o ../src/config/default/library/cryptoauthlib/calib/calib_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/141463632/atca_host.o: ../src/config/default/library/cryptoauthlib/host/atca_host.c  .generated_files/flags/default/655614298aabf7f991957f6f81301790a122a69a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/141463632" 
	@${RM} ${OBJECTDIR}/_ext/141463632/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/141463632/atca_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/141463632/atca_host.o.d" -o ${OBJECTDIR}/_ext/141463632/atca_host.o ../src/config/default/library/cryptoauthlib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/atca_hal.o: ../src/config/default/library/cryptoauthlib/hal/atca_hal.c  .generated_files/flags/default/c67084553e7b38650d504e732fe948fd3d2a7246 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/atca_hal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1390037109/atca_hal.o ../src/config/default/library/cryptoauthlib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o: ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c  .generated_files/flags/default/4f7ccf591b10fa928422465548a32b8d6f991d7c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o: ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c  .generated_files/flags/default/fad5a68cb4578390c854d3173edf9f98ebac7dbb .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o: ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c  .generated_files/flags/default/9fc55e6ec4d096cfd1ad0899ba263e086153b9a3 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o: ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c  .generated_files/flags/default/e7da23fa0969081fa1583f28d36dbf5a7e00d695 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/992804092/drv_memory.o: ../src/config/default/driver/memory/src/drv_memory.c  .generated_files/flags/default/6f335e9685b41b52ca874ca6015e7288c50a2c10 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/992804092" 
	@${RM} ${OBJECTDIR}/_ext/992804092/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/992804092/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/992804092/drv_memory.o.d" -o ${OBJECTDIR}/_ext/992804092/drv_memory.o ../src/config/default/driver/memory/src/drv_memory.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1210054560/sht3x_actor.o: ../src/sht3x_actor/sht3x_actor.c  .generated_files/flags/default/e5cbcd851268394a73eeeed03ebfc32f6e23e088 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1210054560" 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1210054560/sht3x_actor.o.d" -o ${OBJECTDIR}/_ext/1210054560/sht3x_actor.o ../src/sht3x_actor/sht3x_actor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o: ../src/sht3x_actor/sht3x_fsm.c  .generated_files/flags/default/f301d79bc7e3b8781375d3473ae9b217310f3c1c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1210054560" 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o.d" -o ${OBJECTDIR}/_ext/1210054560/sht3x_fsm.o ../src/sht3x_actor/sht3x_fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1434821282/bsp.o: ../src/config/default/bsp/bsp.c  .generated_files/flags/default/c337d5b73e5f8138e9ed97e7a7254d158e7fb03f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1434821282" 
	@${RM} ${OBJECTDIR}/_ext/1434821282/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1434821282/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1434821282/bsp.o.d" -o ${OBJECTDIR}/_ext/1434821282/bsp.o ../src/config/default/bsp/bsp.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/158385033/drv_i2c.o: ../src/config/default/driver/i2c/src/drv_i2c.c  .generated_files/flags/default/e984beac54d9835eb857def9c1b4a61d3708806b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/158385033" 
	@${RM} ${OBJECTDIR}/_ext/158385033/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/158385033/drv_i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/158385033/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/158385033/drv_i2c.o ../src/config/default/driver/i2c/src/drv_i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/675273573/drv_at25df.o: ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c  .generated_files/flags/default/682d803b2d1b455e142c1cb4b7393a426eb61d61 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/675273573" 
	@${RM} ${OBJECTDIR}/_ext/675273573/drv_at25df.o.d 
	@${RM} ${OBJECTDIR}/_ext/675273573/drv_at25df.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/675273573/drv_at25df.o.d" -o ${OBJECTDIR}/_ext/675273573/drv_at25df.o ../src/config/default/driver/spi_flash/at25df/src/drv_at25df.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o: ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c  .generated_files/flags/default/b3e41fb4d66485d9aa3c852ca36c2399e1b77bd7 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/818654064" 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o.d 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o.d" -o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1.o ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o: ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c  .generated_files/flags/default/571eb955e7a877533fff8b238d4ef74e10fe9674 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/818654064" 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o.d" -o ${OBJECTDIR}/_ext/818654064/drv_usbfsv1_device.o ../src/config/default/driver/usb/usbfsv1/src/drv_usbfsv1_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1984496892/plib_clock.o: ../src/config/default/peripheral/clock/plib_clock.c  .generated_files/flags/default/24ef3b4ab7dab0004733ce83c60df55bf2ab838b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1984496892" 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ../src/config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60167341/plib_eic.o: ../src/config/default/peripheral/eic/plib_eic.c  .generated_files/flags/default/e7d503615c4a6e3f6fdd6cc3ffac8f781ec50fed .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/60167341" 
	@${RM} ${OBJECTDIR}/_ext/60167341/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/60167341/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60167341/plib_eic.o.d" -o ${OBJECTDIR}/_ext/60167341/plib_eic.o ../src/config/default/peripheral/eic/plib_eic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  .generated_files/flags/default/68def1897102fec183812fd4c4a92f1b5444bf29 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  .generated_files/flags/default/7bf148539fea318df69e6d2b5cbf79e506cdea9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o: ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/default/ade764da5718a38512a5d6a54540da7a0d046d2f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1593096446" 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865521619/plib_port.o: ../src/config/default/peripheral/port/plib_port.c  .generated_files/flags/default/1d4d54b2c963220655e43fbeea505f77cde50ff6 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1865521619" 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" -o ${OBJECTDIR}/_ext/1865521619/plib_port.o ../src/config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o: ../src/config/default/peripheral/rtc/plib_rtc_clock.c  .generated_files/flags/default/d684f78b12f80b7fc58e25683365d42ca2a1f7be .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/60180175" 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o.d" -o ${OBJECTDIR}/_ext/60180175/plib_rtc_clock.o ../src/config/default/peripheral/rtc/plib_rtc_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o: ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  .generated_files/flags/default/8eda75009bc494c8cfd873452451c98faa1c79de .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/508257091" 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o: ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c  .generated_files/flags/default/bf5f1700da92d6b3740d5d87f5023b7882f6bd65 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/17022449" 
	@${RM} ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o.d" -o ${OBJECTDIR}/_ext/17022449/plib_sercom5_spi_master.o ../src/config/default/peripheral/sercom/spi_master/plib_sercom5_spi_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/829342655/plib_tc3.o: ../src/config/default/peripheral/tc/plib_tc3.c  .generated_files/flags/default/dffdeb693251c86ac44db940e422a972ae3043c5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/829342655" 
	@${RM} ${OBJECTDIR}/_ext/829342655/plib_tc3.o.d 
	@${RM} ${OBJECTDIR}/_ext/829342655/plib_tc3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/829342655/plib_tc3.o.d" -o ${OBJECTDIR}/_ext/829342655/plib_tc3.o ../src/config/default/peripheral/tc/plib_tc3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/bfc4b6da4ea0c16fb665861ff5f5328659dff496 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1832805299/sys_console.o: ../src/config/default/system/console/src/sys_console.c  .generated_files/flags/default/2352249ad2bb045e16ae992950778a830b768ed9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1832805299" 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1832805299/sys_console.o.d" -o ${OBJECTDIR}/_ext/1832805299/sys_console.o ../src/config/default/system/console/src/sys_console.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o: ../src/config/default/system/console/src/sys_console_usb_cdc.c  .generated_files/flags/default/958ce008f86693049fd407fc7cd484c872315a1f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1832805299" 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o.d" -o ${OBJECTDIR}/_ext/1832805299/sys_console_usb_cdc.o ../src/config/default/system/console/src/sys_console_usb_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/944882569/sys_debug.o: ../src/config/default/system/debug/src/sys_debug.c  .generated_files/flags/default/b05490e876902985125a93385db937e205dbb72 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/944882569" 
	@${RM} ${OBJECTDIR}/_ext/944882569/sys_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/944882569/sys_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/944882569/sys_debug.o.d" -o ${OBJECTDIR}/_ext/944882569/sys_debug.o ../src/config/default/system/debug/src/sys_debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1881668453/sys_int.o: ../src/config/default/system/int/src/sys_int.c  .generated_files/flags/default/d294c95957549d7f9402393ea9566f52db692795 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1881668453" 
	@${RM} ${OBJECTDIR}/_ext/1881668453/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1881668453/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1881668453/sys_int.o.d" -o ${OBJECTDIR}/_ext/1881668453/sys_int.o ../src/config/default/system/int/src/sys_int.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101884895/sys_time.o: ../src/config/default/system/time/src/sys_time.c  .generated_files/flags/default/22c2828dd2709bcd1e315f993ef368dc05a3e9fd .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/101884895" 
	@${RM} ${OBJECTDIR}/_ext/101884895/sys_time.o.d 
	@${RM} ${OBJECTDIR}/_ext/101884895/sys_time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/101884895/sys_time.o.d" -o ${OBJECTDIR}/_ext/101884895/sys_time.o ../src/config/default/system/time/src/sys_time.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device.o: ../src/config/default/usb/src/usb_device.c  .generated_files/flags/default/e8539077a4d2d31f1875db8406ae07988b5e6bd9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device.o ../src/config/default/usb/src/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_cdc.o: ../src/config/default/usb/src/usb_device_cdc.c  .generated_files/flags/default/5023cdf2f8306c964990d5fc1059e58da6208e1d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_cdc.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_cdc.o ../src/config/default/usb/src/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o: ../src/config/default/usb/src/usb_device_cdc_acm.c  .generated_files/flags/default/e0f961e3401968ffc1e53fc818440eced63f39d4 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_cdc_acm.o ../src/config/default/usb/src/usb_device_cdc_acm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/308758920/usb_device_msd.o: ../src/config/default/usb/src/usb_device_msd.c  .generated_files/flags/default/a7bf9920a5c2d0d50998469dc95e1fa5cc30cf9a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/308758920" 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/308758920/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308758920/usb_device_msd.o.d" -o ${OBJECTDIR}/_ext/308758920/usb_device_msd.o ../src/config/default/usb/src/usb_device_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/f58d8fcb21c274439ff63150275690499e2f6488 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/d70f84f479160a9bce6730fe1e88544a07c31125 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/3ac857d998cbc865d4673e91f72b402ec6e4daa .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  .generated_files/flags/default/1c3d24fe39707502408ee3932448c09cb5681b17 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  .generated_files/flags/default/8edfe1395e7b41ff8f21fc8d68ea377fad2ac68a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o: ../src/config/default/usb_device_init_data.c  .generated_files/flags/default/c5bade8fd7aadab1b1f86735349a3da3b088cc7d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o.d" -o ${OBJECTDIR}/_ext/1171490990/usb_device_init_data.o ../src/config/default/usb_device_init_data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/tasks.o: ../src/config/default/tasks.c  .generated_files/flags/default/f1956e58bec25ea4eb446a10c6912a4ede62f118 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/tasks.o.d" -o ${OBJECTDIR}/_ext/1171490990/tasks.o ../src/config/default/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/afdd9bce9acba7acf33508167e0b37e0bab94e01 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/diskImage.o: ../src/config/default/diskImage.c  .generated_files/flags/default/184194df00e439568379d05ffd401e1e5ac28e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/diskImage.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/diskImage.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/diskImage.o.d" -o ${OBJECTDIR}/_ext/1171490990/diskImage.o ../src/config/default/diskImage.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1927247122/event.o: ../src/state_machine_management/event/event.c  .generated_files/flags/default/648a7d51a3bf313d153bf6c54e0d7a34cecdeea .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1927247122" 
	@${RM} ${OBJECTDIR}/_ext/1927247122/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927247122/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927247122/event.o.d" -o ${OBJECTDIR}/_ext/1927247122/event.o ../src/state_machine_management/event/event.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1916194459/queue.o: ../src/state_machine_management/queue/queue.c  .generated_files/flags/default/a1f348dc88d33ef4fb33ffe8d846be702d97b076 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1916194459" 
	@${RM} ${OBJECTDIR}/_ext/1916194459/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1916194459/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1916194459/queue.o.d" -o ${OBJECTDIR}/_ext/1916194459/queue.o ../src/state_machine_management/queue/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1520445795/fsm.o: ../src/state_machine_management/fsm.c  .generated_files/flags/default/61837006070bb2df777bb7a631fb870f349fbac1 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1520445795" 
	@${RM} ${OBJECTDIR}/_ext/1520445795/fsm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520445795/fsm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1520445795/fsm.o.d" -o ${OBJECTDIR}/_ext/1520445795/fsm.o ../src/state_machine_management/fsm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/ATECC608_0.o: ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c  .generated_files/flags/default/10e33c66dc56745f40403e49dda4c15fc93db72 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/ATECC608_0.o.d" -o ${OBJECTDIR}/_ext/1390037109/ATECC608_0.o ../src/config/default/library/cryptoauthlib/hal/ATECC608_0.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2017208766/sha1_routines.o: ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c  .generated_files/flags/default/8266728811dd24878d1915cc41f63c8a78df5559 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/2017208766" 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha1_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2017208766/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/2017208766/sha1_routines.o ../src/config/default/library/cryptoauthlib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/2017208766/sha2_routines.o: ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c  .generated_files/flags/default/e174013409d44e28d4affc10c3053169060455d1 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/2017208766" 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/2017208766/sha2_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2017208766/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/2017208766/sha2_routines.o ../src/config/default/library/cryptoauthlib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c  .generated_files/flags/default/54b4b6526e58aae1975a8e1f438ef8dfab917ff7 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha1.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c  .generated_files/flags/default/daee558f3c6816a087e160f1ed179370efe14cdf .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pbkdf2.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pbkdf2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c  .generated_files/flags/default/ab5c3ea8407d167cebb7818f8141d74da0ca875f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_pad.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_pad.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c  .generated_files/flags/default/c2bc05c9d55a0d72a91c7ef634a9e1829a3f083 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_sw_sha2.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c  .generated_files/flags/default/d157b7da780297c5473c1aa0e389d10881dcdccd .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbc.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c  .generated_files/flags/default/853bb99e60939b412b9b848c98e3cc571a62e844 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ctr.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c  .generated_files/flags/default/fe77613314ce13dbb5f52a69e515c0ed520d9d96 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cmac.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c  .generated_files/flags/default/df96b9d2f865b80dcd23efc631a1f3c40366a5bd .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_ccm.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_ccm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o: ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c  .generated_files/flags/default/7d89dd2262908ccd2fc0b9be2c40c282787946d0 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1352206537" 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o.d" -o ${OBJECTDIR}/_ext/1352206537/atca_crypto_hw_aes_cbcmac.o ../src/config/default/library/cryptoauthlib/crypto/atca_crypto_hw_aes_cbcmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390034497/atca_jwt.o: ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c  .generated_files/flags/default/b2f830f80868dd2858e6dd62cfa732d94405b65d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390034497" 
	@${RM} ${OBJECTDIR}/_ext/1390034497/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390034497/atca_jwt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390034497/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1390034497/atca_jwt.o ../src/config/default/library/cryptoauthlib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_cfgs.o: ../src/config/default/library/cryptoauthlib/atca_cfgs.c  .generated_files/flags/default/65c058eebf10ad811cac89015b21a2d450ed154f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_cfgs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_cfgs.o ../src/config/default/library/cryptoauthlib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_debug.o: ../src/config/default/library/cryptoauthlib/atca_debug.c  .generated_files/flags/default/50f8c7995407f2a88dacac4b4b7f6e9ee8b0ea8c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_debug.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_debug.o ../src/config/default/library/cryptoauthlib/atca_debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o: ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c  .generated_files/flags/default/24a894e18d980d84aaccb5d02c3c9236f86eeb0a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_utils_sizes.o ../src/config/default/library/cryptoauthlib/atca_utils_sizes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_helpers.o: ../src/config/default/library/cryptoauthlib/atca_helpers.c  .generated_files/flags/default/8745e3bfde79eec4275e003f69a62a06b5a45dce .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_helpers.o ../src/config/default/library/cryptoauthlib/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_basic.o: ../src/config/default/library/cryptoauthlib/atca_basic.c  .generated_files/flags/default/de3c95c8f375e082362b2f8f689f514a384de83e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_basic.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_basic.o ../src/config/default/library/cryptoauthlib/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_iface.o: ../src/config/default/library/cryptoauthlib/atca_iface.c  .generated_files/flags/default/f7b807c1798a664801e2b661d6586a951a1a17b0 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_iface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_iface.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_iface.o ../src/config/default/library/cryptoauthlib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/701127929/atca_device.o: ../src/config/default/library/cryptoauthlib/atca_device.c  .generated_files/flags/default/d33e24aeda43cf7e97869b1096e136b26993719b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/701127929" 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/701127929/atca_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/701127929/atca_device.o.d" -o ${OBJECTDIR}/_ext/701127929/atca_device.o ../src/config/default/library/cryptoauthlib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_client.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c  .generated_files/flags/default/ad22a0b219f4f6490ecc8905e8955169a1f1420c .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_client.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_client.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_date.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c  .generated_files/flags/default/eaa51bf890ae68466c81864ea9a83d95cc6f0c4 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_date.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_date.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_def.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c  .generated_files/flags/default/f553af8d3406eb5bc975dc18c4cb04b0423de3f5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_def.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_def.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c  .generated_files/flags/default/17e1908bc09bbf590cf956e5a4009634e155e685 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_host_sw.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c  .generated_files/flags/default/1f81f9ecd2c7cfcb7774c3b23cc45ed73c30dc12 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_host_hw.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_pem.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c  .generated_files/flags/default/ca628691e9efc03f1015775a188da107b396112f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_pem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_pem.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/35538813/atcacert_der.o: ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c  .generated_files/flags/default/c7917fc6a94fc5c7d857194c6b041b8affbada11 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/35538813" 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/35538813/atcacert_der.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/35538813/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/35538813/atcacert_der.o ../src/config/default/library/cryptoauthlib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_info.o: ../src/config/default/library/cryptoauthlib/calib/calib_info.c  .generated_files/flags/default/bc0f9a139b215db9121633e9549aafab67bcab01 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_info.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_info.o ../src/config/default/library/cryptoauthlib/calib/calib_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_random.o: ../src/config/default/library/cryptoauthlib/calib/calib_random.c  .generated_files/flags/default/859ad9c5c7028b006ede09c8c72e3a0a51b02446 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_random.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_random.o ../src/config/default/library/cryptoauthlib/calib/calib_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_verify.o: ../src/config/default/library/cryptoauthlib/calib/calib_verify.c  .generated_files/flags/default/726984589745c760d7da81d5a8cdbd7adff1ff67 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_verify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_verify.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_verify.o ../src/config/default/library/cryptoauthlib/calib/calib_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_privwrite.o: ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c  .generated_files/flags/default/539b3a4ed6ae6053eb97d948aa5bf09e1853e7fa .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_privwrite.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_privwrite.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_privwrite.o ../src/config/default/library/cryptoauthlib/calib/calib_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_execution.o: ../src/config/default/library/cryptoauthlib/calib/calib_execution.c  .generated_files/flags/default/49994f00a640d0f1e637ab29e77445da82c0376d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_execution.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_execution.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_execution.o ../src/config/default/library/cryptoauthlib/calib/calib_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_read.o: ../src/config/default/library/cryptoauthlib/calib/calib_read.c  .generated_files/flags/default/72c3e12d38bb8b1824e5ea296f743ce4ed431873 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_read.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_read.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_read.o ../src/config/default/library/cryptoauthlib/calib/calib_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_sign.o: ../src/config/default/library/cryptoauthlib/calib/calib_sign.c  .generated_files/flags/default/9417ca3e44d271c9068c3d41216acd653170450b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sign.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_sign.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_sign.o ../src/config/default/library/cryptoauthlib/calib/calib_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_selftest.o: ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c  .generated_files/flags/default/ec2a94edc1fb8131455aefc1b7d62a27cf594c08 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_selftest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_selftest.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_selftest.o ../src/config/default/library/cryptoauthlib/calib/calib_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_nonce.o: ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c  .generated_files/flags/default/e5391f95dcf0740e21878a926cfb5a58980dcb27 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_nonce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_nonce.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_nonce.o ../src/config/default/library/cryptoauthlib/calib/calib_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_hmac.o: ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c  .generated_files/flags/default/cb4f3c87a1ba961be1822de17b9b04a32e957c6b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_hmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_hmac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_hmac.o ../src/config/default/library/cryptoauthlib/calib/calib_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_command.o: ../src/config/default/library/cryptoauthlib/calib/calib_command.c  .generated_files/flags/default/172121283dd38cf0e5d285f927f1cd403fccb1c9 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_command.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_command.o ../src/config/default/library/cryptoauthlib/calib/calib_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o: ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c  .generated_files/flags/default/dda3c3fadf091541d2a6caed1734ee34dfa18f2a .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_aes_gcm.o ../src/config/default/library/cryptoauthlib/calib/calib_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_sha.o: ../src/config/default/library/cryptoauthlib/calib/calib_sha.c  .generated_files/flags/default/c9b6a6e04c6cc863262bc3d1353fe3d3cff3f5c6 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_sha.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_sha.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_sha.o ../src/config/default/library/cryptoauthlib/calib/calib_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_ecdh.o: ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c  .generated_files/flags/default/de63341c23373f76749b9969758caea7e8478257 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_ecdh.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_ecdh.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_ecdh.o ../src/config/default/library/cryptoauthlib/calib/calib_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_helpers.o: ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c  .generated_files/flags/default/737c83bc0c8ced686c7a22c1019c74e5b1a8868f .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_helpers.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_helpers.o ../src/config/default/library/cryptoauthlib/calib/calib_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_basic.o: ../src/config/default/library/cryptoauthlib/calib/calib_basic.c  .generated_files/flags/default/50ed15925817debec30ded66ba332d8589581c2 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_basic.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_basic.o ../src/config/default/library/cryptoauthlib/calib/calib_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_kdf.o: ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c  .generated_files/flags/default/fd82b03c723c671dfc79038cd16a77303ac64426 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_kdf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_kdf.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_kdf.o ../src/config/default/library/cryptoauthlib/calib/calib_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_gendig.o: ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c  .generated_files/flags/default/ce8102560bd7a77b21c81bdb7e53163060aa0c5e .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_gendig.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_gendig.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_gendig.o ../src/config/default/library/cryptoauthlib/calib/calib_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_secureboot.o: ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c  .generated_files/flags/default/d919ba50073ef5526f1487babcc6b808ba0530e5 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_secureboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_secureboot.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_secureboot.o ../src/config/default/library/cryptoauthlib/calib/calib_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_lock.o: ../src/config/default/library/cryptoauthlib/calib/calib_lock.c  .generated_files/flags/default/ccb2764d644218f5c58fd73c30542bbccc5714be .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_lock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_lock.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_lock.o ../src/config/default/library/cryptoauthlib/calib/calib_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_write.o: ../src/config/default/library/cryptoauthlib/calib/calib_write.c  .generated_files/flags/default/d5b3139c2bd4dcd4114e7cbfe27d8edad72bbbfc .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_write.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_write.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_write.o ../src/config/default/library/cryptoauthlib/calib/calib_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_genkey.o: ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c  .generated_files/flags/default/85508230ced8e29431c23ffc0771d3e9f99f8b4d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_genkey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_genkey.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_genkey.o ../src/config/default/library/cryptoauthlib/calib/calib_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_counter.o: ../src/config/default/library/cryptoauthlib/calib/calib_counter.c  .generated_files/flags/default/c791930357f6b4ab48f26cd0e5a038a1664eaf1b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_counter.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_counter.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_counter.o ../src/config/default/library/cryptoauthlib/calib/calib_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_derivekey.o: ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c  .generated_files/flags/default/b9abcbb14d1047eea54a15cfdc9257a02d3160d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_derivekey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_derivekey.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_derivekey.o ../src/config/default/library/cryptoauthlib/calib/calib_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_mac.o: ../src/config/default/library/cryptoauthlib/calib/calib_mac.c  .generated_files/flags/default/8c55c944ade2799eede899f44ff8bfc9691e4a90 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_mac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_mac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_mac.o ../src/config/default/library/cryptoauthlib/calib/calib_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_checkmac.o: ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c  .generated_files/flags/default/52b2dc2781bf0e028c1727145ef1a0de421861c7 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_checkmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_checkmac.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_checkmac.o ../src/config/default/library/cryptoauthlib/calib/calib_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_updateextra.o: ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c  .generated_files/flags/default/ffece93008e8527ec3a2bd24a75d9a7b75e9cd80 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_updateextra.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_updateextra.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_updateextra.o ../src/config/default/library/cryptoauthlib/calib/calib_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/95446945/calib_aes.o: ../src/config/default/library/cryptoauthlib/calib/calib_aes.c  .generated_files/flags/default/66f64763dc072cd7095927e6a81df7c5b0abaf9b .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/95446945" 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/95446945/calib_aes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/95446945/calib_aes.o.d" -o ${OBJECTDIR}/_ext/95446945/calib_aes.o ../src/config/default/library/cryptoauthlib/calib/calib_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/141463632/atca_host.o: ../src/config/default/library/cryptoauthlib/host/atca_host.c  .generated_files/flags/default/738bb1b34d0a34319ea0b9158eef427e77e8e32d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/141463632" 
	@${RM} ${OBJECTDIR}/_ext/141463632/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/141463632/atca_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/141463632/atca_host.o.d" -o ${OBJECTDIR}/_ext/141463632/atca_host.o ../src/config/default/library/cryptoauthlib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/atca_hal.o: ../src/config/default/library/cryptoauthlib/hal/atca_hal.c  .generated_files/flags/default/249798047c83accf9d6e7fdff237c5bd08a52b9d .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/atca_hal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1390037109/atca_hal.o ../src/config/default/library/cryptoauthlib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o: ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c  .generated_files/flags/default/a71ccd96c52cb1d4cbbe637afad2ae6b1c1949e3 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_i2c_harmony.o ../src/config/default/library/cryptoauthlib/hal/hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o: ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c  .generated_files/flags/default/9af25d7e7fb0cd41137ab0358f37b0cc0ff7a0f0 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_harmony_init.o ../src/config/default/library/cryptoauthlib/hal/hal_harmony_init.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o: ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c  .generated_files/flags/default/e9e073edda889cb49668684bafb7235e5838d150 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_gpio_harmony.o ../src/config/default/library/cryptoauthlib/hal/hal_gpio_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o: ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c  .generated_files/flags/default/f99502c4ced5a6daab00b3332c6d82e2e7dc7590 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/1390037109" 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o.d" -o ${OBJECTDIR}/_ext/1390037109/hal_cortex_m_delay.o ../src/config/default/library/cryptoauthlib/hal/hal_cortex_m_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/992804092/drv_memory.o: ../src/config/default/driver/memory/src/drv_memory.c  .generated_files/flags/default/658d7ec58d7af01da123a44a96bb18026960cbf3 .generated_files/flags/default/9ead1e49ff546da3bc185e757ccc3c3e4639071e
	@${MKDIR} "${OBJECTDIR}/_ext/992804092" 
	@${RM} ${OBJECTDIR}/_ext/992804092/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/992804092/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/default" -I"../src/config/default/library/cryptoauthlib" -I"../src/config/default/library/cryptoauthlib/crypto" -I"../src/config/default/library/cryptoauthlib/pkcs11" -I"../src/packs/ATSAMD21J18A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/992804092/drv_memory.o.d" -o ${OBJECTDIR}/_ext/992804092/drv_memory.o ../src/config/default/driver/memory/src/drv_memory.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wno-switch -mdfp="${DFP_DIR}/samd21a" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/ATSAMD21J18A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/samd21a"
	
else
${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/ATSAMD21J18A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/samd21a"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/open-risk-logger-samd21-xpro-proto.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
