################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/tstdlib/bitop.c \
../kernel/tstdlib/string.c 

OBJS += \
./kernel/tstdlib/bitop.o \
./kernel/tstdlib/string.o 

C_DEPS += \
./kernel/tstdlib/bitop.d \
./kernel/tstdlib/string.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/tstdlib/%.o kernel/tstdlib/%.su kernel/tstdlib/%.cyclo: ../kernel/tstdlib/%.c kernel/tstdlib/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-tstdlib

clean-kernel-2f-tstdlib:
	-$(RM) ./kernel/tstdlib/bitop.cyclo ./kernel/tstdlib/bitop.d ./kernel/tstdlib/bitop.o ./kernel/tstdlib/bitop.su ./kernel/tstdlib/string.cyclo ./kernel/tstdlib/string.d ./kernel/tstdlib/string.o ./kernel/tstdlib/string.su

.PHONY: clean-kernel-2f-tstdlib

