################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/ser/ser.c 

OBJS += \
./device/ser/ser.o 

C_DEPS += \
./device/ser/ser.d 


# Each subdirectory must supply rules for building sources it contributes
device/ser/%.o device/ser/%.su device/ser/%.cyclo: ../device/ser/%.c device/ser/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-device-2f-ser

clean-device-2f-ser:
	-$(RM) ./device/ser/ser.cyclo ./device/ser/ser.d ./device/ser/ser.o ./device/ser/ser.su

.PHONY: clean-device-2f-ser

