################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/common/drvif/msdrvif.c 

OBJS += \
./device/common/drvif/msdrvif.o 

C_DEPS += \
./device/common/drvif/msdrvif.d 


# Each subdirectory must supply rules for building sources it contributes
device/common/drvif/%.o device/common/drvif/%.su device/common/drvif/%.cyclo: ../device/common/drvif/%.c device/common/drvif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-device-2f-common-2f-drvif

clean-device-2f-common-2f-drvif:
	-$(RM) ./device/common/drvif/msdrvif.cyclo ./device/common/drvif/msdrvif.d ./device/common/drvif/msdrvif.o ./device/common/drvif/msdrvif.su

.PHONY: clean-device-2f-common-2f-drvif

