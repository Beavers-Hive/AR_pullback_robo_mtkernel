################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app_program/app_main.c 

OBJS += \
./app_program/app_main.o 

C_DEPS += \
./app_program/app_main.d 


# Each subdirectory must supply rules for building sources it contributes
app_program/%.o app_program/%.su app_program/%.cyclo: ../app_program/%.c app_program/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-app_program

clean-app_program:
	-$(RM) ./app_program/app_main.cyclo ./app_program/app_main.d ./app_program/app_main.o ./app_program/app_main.su

.PHONY: clean-app_program

