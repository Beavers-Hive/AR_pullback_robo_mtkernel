################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/pico_rp2040/cpu_clock.c \
../kernel/sysdepend/pico_rp2040/devinit.c \
../kernel/sysdepend/pico_rp2040/hw_setting.c \
../kernel/sysdepend/pico_rp2040/power_save.c 

OBJS += \
./kernel/sysdepend/pico_rp2040/cpu_clock.o \
./kernel/sysdepend/pico_rp2040/devinit.o \
./kernel/sysdepend/pico_rp2040/hw_setting.o \
./kernel/sysdepend/pico_rp2040/power_save.o 

C_DEPS += \
./kernel/sysdepend/pico_rp2040/cpu_clock.d \
./kernel/sysdepend/pico_rp2040/devinit.d \
./kernel/sysdepend/pico_rp2040/hw_setting.d \
./kernel/sysdepend/pico_rp2040/power_save.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/pico_rp2040/%.o kernel/sysdepend/pico_rp2040/%.su kernel/sysdepend/pico_rp2040/%.cyclo: ../kernel/sysdepend/pico_rp2040/%.c kernel/sysdepend/pico_rp2040/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-pico_rp2040

clean-kernel-2f-sysdepend-2f-pico_rp2040:
	-$(RM) ./kernel/sysdepend/pico_rp2040/cpu_clock.cyclo ./kernel/sysdepend/pico_rp2040/cpu_clock.d ./kernel/sysdepend/pico_rp2040/cpu_clock.o ./kernel/sysdepend/pico_rp2040/cpu_clock.su ./kernel/sysdepend/pico_rp2040/devinit.cyclo ./kernel/sysdepend/pico_rp2040/devinit.d ./kernel/sysdepend/pico_rp2040/devinit.o ./kernel/sysdepend/pico_rp2040/devinit.su ./kernel/sysdepend/pico_rp2040/hw_setting.cyclo ./kernel/sysdepend/pico_rp2040/hw_setting.d ./kernel/sysdepend/pico_rp2040/hw_setting.o ./kernel/sysdepend/pico_rp2040/hw_setting.su ./kernel/sysdepend/pico_rp2040/power_save.cyclo ./kernel/sysdepend/pico_rp2040/power_save.d ./kernel/sysdepend/pico_rp2040/power_save.o ./kernel/sysdepend/pico_rp2040/power_save.su

.PHONY: clean-kernel-2f-sysdepend-2f-pico_rp2040

