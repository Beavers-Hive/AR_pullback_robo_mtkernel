################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/adc/sysdepend/rza2m/adc_rza2m.c 

OBJS += \
./device/adc/sysdepend/rza2m/adc_rza2m.o 

C_DEPS += \
./device/adc/sysdepend/rza2m/adc_rza2m.d 


# Each subdirectory must supply rules for building sources it contributes
device/adc/sysdepend/rza2m/%.o device/adc/sysdepend/rza2m/%.su device/adc/sysdepend/rza2m/%.cyclo: ../device/adc/sysdepend/rza2m/%.c device/adc/sysdepend/rza2m/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-device-2f-adc-2f-sysdepend-2f-rza2m

clean-device-2f-adc-2f-sysdepend-2f-rza2m:
	-$(RM) ./device/adc/sysdepend/rza2m/adc_rza2m.cyclo ./device/adc/sysdepend/rza2m/adc_rza2m.d ./device/adc/sysdepend/rza2m/adc_rza2m.o ./device/adc/sysdepend/rza2m/adc_rza2m.su

.PHONY: clean-device-2f-adc-2f-sysdepend-2f-rza2m

