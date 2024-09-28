################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysinit/sysinit.c 

OBJS += \
./kernel/sysinit/sysinit.o 

C_DEPS += \
./kernel/sysinit/sysinit.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysinit/%.o kernel/sysinit/%.su kernel/sysinit/%.cyclo: ../kernel/sysinit/%.c kernel/sysinit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysinit

clean-kernel-2f-sysinit:
	-$(RM) ./kernel/sysinit/sysinit.cyclo ./kernel/sysinit/sysinit.d ./kernel/sysinit/sysinit.o ./kernel/sysinit/sysinit.su

.PHONY: clean-kernel-2f-sysinit

