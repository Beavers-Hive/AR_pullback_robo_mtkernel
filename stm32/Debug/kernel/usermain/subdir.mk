################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/usermain/usermain.c 

OBJS += \
./kernel/usermain/usermain.o 

C_DEPS += \
./kernel/usermain/usermain.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/usermain/%.o kernel/usermain/%.su kernel/usermain/%.cyclo: ../kernel/usermain/%.c kernel/usermain/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-usermain

clean-kernel-2f-usermain:
	-$(RM) ./kernel/usermain/usermain.cyclo ./kernel/usermain/usermain.d ./kernel/usermain/usermain.o ./kernel/usermain/usermain.su

.PHONY: clean-kernel-2f-usermain

