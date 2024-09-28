################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.c \
../lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.c 

OBJS += \
./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.o \
./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.o 

C_DEPS += \
./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.d \
./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtk/sysdepend/cpu/core/armv7a/%.o lib/libtk/sysdepend/cpu/core/armv7a/%.su lib/libtk/sysdepend/cpu/core/armv7a/%.cyclo: ../lib/libtk/sysdepend/cpu/core/armv7a/%.c lib/libtk/sysdepend/cpu/core/armv7a/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-armv7a

clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-armv7a:
	-$(RM) ./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.cyclo ./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.d ./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.o ./lib/libtk/sysdepend/cpu/core/armv7a/int_armv7a.su ./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.cyclo ./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.d ./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.o ./lib/libtk/sysdepend/cpu/core/armv7a/wusec_armv7a.su

.PHONY: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-armv7a

