################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/ser/sysdepend/rp2040/ser_rp2040.c 

OBJS += \
./device/ser/sysdepend/rp2040/ser_rp2040.o 

C_DEPS += \
./device/ser/sysdepend/rp2040/ser_rp2040.d 


# Each subdirectory must supply rules for building sources it contributes
device/ser/sysdepend/rp2040/%.o device/ser/sysdepend/rp2040/%.su device/ser/sysdepend/rp2040/%.cyclo: ../device/ser/sysdepend/rp2040/%.c device/ser/sysdepend/rp2040/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-device-2f-ser-2f-sysdepend-2f-rp2040

clean-device-2f-ser-2f-sysdepend-2f-rp2040:
	-$(RM) ./device/ser/sysdepend/rp2040/ser_rp2040.cyclo ./device/ser/sysdepend/rp2040/ser_rp2040.d ./device/ser/sysdepend/rp2040/ser_rp2040.o ./device/ser/sysdepend/rp2040/ser_rp2040.su

.PHONY: clean-device-2f-ser-2f-sysdepend-2f-rp2040

