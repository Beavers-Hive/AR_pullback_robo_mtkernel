################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtk/sysdepend/cpu/rx231/int_rx231.c \
../lib/libtk/sysdepend/cpu/rx231/ipr_rx231.c \
../lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.c 

OBJS += \
./lib/libtk/sysdepend/cpu/rx231/int_rx231.o \
./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.o \
./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.o 

C_DEPS += \
./lib/libtk/sysdepend/cpu/rx231/int_rx231.d \
./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.d \
./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtk/sysdepend/cpu/rx231/%.o lib/libtk/sysdepend/cpu/rx231/%.su lib/libtk/sysdepend/cpu/rx231/%.cyclo: ../lib/libtk/sysdepend/cpu/rx231/%.c lib/libtk/sysdepend/cpu/rx231/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-rx231

clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-rx231:
	-$(RM) ./lib/libtk/sysdepend/cpu/rx231/int_rx231.cyclo ./lib/libtk/sysdepend/cpu/rx231/int_rx231.d ./lib/libtk/sysdepend/cpu/rx231/int_rx231.o ./lib/libtk/sysdepend/cpu/rx231/int_rx231.su ./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.cyclo ./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.d ./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.o ./lib/libtk/sysdepend/cpu/rx231/ipr_rx231.su ./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.cyclo ./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.d ./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.o ./lib/libtk/sysdepend/cpu/rx231/ptimer_rx231.su

.PHONY: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-rx231

