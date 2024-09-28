################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.c 

OBJS += \
./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.o 

C_DEPS += \
./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libbsp/sysdepend/cpu/rp2040/%.o lib/libbsp/sysdepend/cpu/rp2040/%.su lib/libbsp/sysdepend/cpu/rp2040/%.cyclo: ../lib/libbsp/sysdepend/cpu/rp2040/%.c lib/libbsp/sysdepend/cpu/rp2040/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libbsp-2f-sysdepend-2f-cpu-2f-rp2040

clean-lib-2f-libbsp-2f-sysdepend-2f-cpu-2f-rp2040:
	-$(RM) ./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.cyclo ./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.d ./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.o ./lib/libbsp/sysdepend/cpu/rp2040/libbsp_pwm.su

.PHONY: clean-lib-2f-libbsp-2f-sysdepend-2f-cpu-2f-rp2040

