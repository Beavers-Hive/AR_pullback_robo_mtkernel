################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/rtb_rx65n/cpu_clock.c \
../kernel/sysdepend/rtb_rx65n/devinit.c \
../kernel/sysdepend/rtb_rx65n/hw_setting.c \
../kernel/sysdepend/rtb_rx65n/power_save.c 

OBJS += \
./kernel/sysdepend/rtb_rx65n/cpu_clock.o \
./kernel/sysdepend/rtb_rx65n/devinit.o \
./kernel/sysdepend/rtb_rx65n/hw_setting.o \
./kernel/sysdepend/rtb_rx65n/power_save.o 

C_DEPS += \
./kernel/sysdepend/rtb_rx65n/cpu_clock.d \
./kernel/sysdepend/rtb_rx65n/devinit.d \
./kernel/sysdepend/rtb_rx65n/hw_setting.d \
./kernel/sysdepend/rtb_rx65n/power_save.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/rtb_rx65n/%.o kernel/sysdepend/rtb_rx65n/%.su kernel/sysdepend/rtb_rx65n/%.cyclo: ../kernel/sysdepend/rtb_rx65n/%.c kernel/sysdepend/rtb_rx65n/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-rtb_rx65n

clean-kernel-2f-sysdepend-2f-rtb_rx65n:
	-$(RM) ./kernel/sysdepend/rtb_rx65n/cpu_clock.cyclo ./kernel/sysdepend/rtb_rx65n/cpu_clock.d ./kernel/sysdepend/rtb_rx65n/cpu_clock.o ./kernel/sysdepend/rtb_rx65n/cpu_clock.su ./kernel/sysdepend/rtb_rx65n/devinit.cyclo ./kernel/sysdepend/rtb_rx65n/devinit.d ./kernel/sysdepend/rtb_rx65n/devinit.o ./kernel/sysdepend/rtb_rx65n/devinit.su ./kernel/sysdepend/rtb_rx65n/hw_setting.cyclo ./kernel/sysdepend/rtb_rx65n/hw_setting.d ./kernel/sysdepend/rtb_rx65n/hw_setting.o ./kernel/sysdepend/rtb_rx65n/hw_setting.su ./kernel/sysdepend/rtb_rx65n/power_save.cyclo ./kernel/sysdepend/rtb_rx65n/power_save.d ./kernel/sysdepend/rtb_rx65n/power_save.o ./kernel/sysdepend/rtb_rx65n/power_save.su

.PHONY: clean-kernel-2f-sysdepend-2f-rtb_rx65n

