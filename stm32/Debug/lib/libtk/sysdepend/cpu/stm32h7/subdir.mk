################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.c \
../lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.c 

OBJS += \
./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.o \
./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.o 

C_DEPS += \
./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.d \
./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtk/sysdepend/cpu/stm32h7/%.o lib/libtk/sysdepend/cpu/stm32h7/%.su lib/libtk/sysdepend/cpu/stm32h7/%.cyclo: ../lib/libtk/sysdepend/cpu/stm32h7/%.c lib/libtk/sysdepend/cpu/stm32h7/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-stm32h7

clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-stm32h7:
	-$(RM) ./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.cyclo ./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.d ./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.o ./lib/libtk/sysdepend/cpu/stm32h7/int_stm32h7.su ./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.cyclo ./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.d ./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.o ./lib/libtk/sysdepend/cpu/stm32h7/ptimer_stm32h7.su

.PHONY: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-stm32h7

