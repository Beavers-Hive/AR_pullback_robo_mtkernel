################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/ser/sysdepend/rx65n/ser_rx65n.c 

OBJS += \
./device/ser/sysdepend/rx65n/ser_rx65n.o 

C_DEPS += \
./device/ser/sysdepend/rx65n/ser_rx65n.d 


# Each subdirectory must supply rules for building sources it contributes
device/ser/sysdepend/rx65n/%.o device/ser/sysdepend/rx65n/%.su device/ser/sysdepend/rx65n/%.cyclo: ../device/ser/sysdepend/rx65n/%.c device/ser/sysdepend/rx65n/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-device-2f-ser-2f-sysdepend-2f-rx65n

clean-device-2f-ser-2f-sysdepend-2f-rx65n:
	-$(RM) ./device/ser/sysdepend/rx65n/ser_rx65n.cyclo ./device/ser/sysdepend/rx65n/ser_rx65n.d ./device/ser/sysdepend/rx65n/ser_rx65n.o ./device/ser/sysdepend/rx65n/ser_rx65n.su

.PHONY: clean-device-2f-ser-2f-sysdepend-2f-rx65n

