################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/inittask/inittask.c 

OBJS += \
./kernel/inittask/inittask.o 

C_DEPS += \
./kernel/inittask/inittask.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/inittask/%.o kernel/inittask/%.su kernel/inittask/%.cyclo: ../kernel/inittask/%.c kernel/inittask/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-inittask

clean-kernel-2f-inittask:
	-$(RM) ./kernel/inittask/inittask.cyclo ./kernel/inittask/inittask.d ./kernel/inittask/inittask.o ./kernel/inittask/inittask.su

.PHONY: clean-kernel-2f-inittask

