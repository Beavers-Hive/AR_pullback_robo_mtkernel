################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/iote_rx231/cpu_clock.c \
../kernel/sysdepend/iote_rx231/devinit.c \
../kernel/sysdepend/iote_rx231/hw_setting.c \
../kernel/sysdepend/iote_rx231/power_save.c 

OBJS += \
./kernel/sysdepend/iote_rx231/cpu_clock.o \
./kernel/sysdepend/iote_rx231/devinit.o \
./kernel/sysdepend/iote_rx231/hw_setting.o \
./kernel/sysdepend/iote_rx231/power_save.o 

C_DEPS += \
./kernel/sysdepend/iote_rx231/cpu_clock.d \
./kernel/sysdepend/iote_rx231/devinit.d \
./kernel/sysdepend/iote_rx231/hw_setting.d \
./kernel/sysdepend/iote_rx231/power_save.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/iote_rx231/%.o kernel/sysdepend/iote_rx231/%.su kernel/sysdepend/iote_rx231/%.cyclo: ../kernel/sysdepend/iote_rx231/%.c kernel/sysdepend/iote_rx231/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-iote_rx231

clean-kernel-2f-sysdepend-2f-iote_rx231:
	-$(RM) ./kernel/sysdepend/iote_rx231/cpu_clock.cyclo ./kernel/sysdepend/iote_rx231/cpu_clock.d ./kernel/sysdepend/iote_rx231/cpu_clock.o ./kernel/sysdepend/iote_rx231/cpu_clock.su ./kernel/sysdepend/iote_rx231/devinit.cyclo ./kernel/sysdepend/iote_rx231/devinit.d ./kernel/sysdepend/iote_rx231/devinit.o ./kernel/sysdepend/iote_rx231/devinit.su ./kernel/sysdepend/iote_rx231/hw_setting.cyclo ./kernel/sysdepend/iote_rx231/hw_setting.d ./kernel/sysdepend/iote_rx231/hw_setting.o ./kernel/sysdepend/iote_rx231/hw_setting.su ./kernel/sysdepend/iote_rx231/power_save.cyclo ./kernel/sysdepend/iote_rx231/power_save.d ./kernel/sysdepend/iote_rx231/power_save.o ./kernel/sysdepend/iote_rx231/power_save.su

.PHONY: clean-kernel-2f-sysdepend-2f-iote_rx231

