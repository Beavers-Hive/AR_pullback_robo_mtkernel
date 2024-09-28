################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.c \
../lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.c 

OBJS += \
./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.o \
./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.o 

C_DEPS += \
./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.d \
./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtk/sysdepend/cpu/core/rxv2/%.o lib/libtk/sysdepend/cpu/core/rxv2/%.su lib/libtk/sysdepend/cpu/core/rxv2/%.cyclo: ../lib/libtk/sysdepend/cpu/core/rxv2/%.c lib/libtk/sysdepend/cpu/core/rxv2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-rxv2

clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-rxv2:
	-$(RM) ./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.cyclo ./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.d ./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.o ./lib/libtk/sysdepend/cpu/core/rxv2/int_rxv2.su ./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.cyclo ./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.d ./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.o ./lib/libtk/sysdepend/cpu/core/rxv2/wusec_rvx2.su

.PHONY: clean-lib-2f-libtk-2f-sysdepend-2f-cpu-2f-core-2f-rxv2

