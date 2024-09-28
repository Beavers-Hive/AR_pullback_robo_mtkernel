################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtm/libtm.c \
../lib/libtm/libtm_printf.c 

OBJS += \
./lib/libtm/libtm.o \
./lib/libtm/libtm_printf.o 

C_DEPS += \
./lib/libtm/libtm.d \
./lib/libtm/libtm_printf.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtm/%.o lib/libtm/%.su lib/libtm/%.cyclo: ../lib/libtm/%.c lib/libtm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtm

clean-lib-2f-libtm:
	-$(RM) ./lib/libtm/libtm.cyclo ./lib/libtm/libtm.d ./lib/libtm/libtm.o ./lib/libtm/libtm.su ./lib/libtm/libtm_printf.cyclo ./lib/libtm/libtm_printf.d ./lib/libtm/libtm_printf.o ./lib/libtm/libtm_printf.su

.PHONY: clean-lib-2f-libtm

