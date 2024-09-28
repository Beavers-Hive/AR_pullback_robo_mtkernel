################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/rp2040/boot_2nd.c \
../kernel/sysdepend/cpu/rp2040/vector_tbl.c 

OBJS += \
./kernel/sysdepend/cpu/rp2040/boot_2nd.o \
./kernel/sysdepend/cpu/rp2040/vector_tbl.o 

C_DEPS += \
./kernel/sysdepend/cpu/rp2040/boot_2nd.d \
./kernel/sysdepend/cpu/rp2040/vector_tbl.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/rp2040/%.o kernel/sysdepend/cpu/rp2040/%.su kernel/sysdepend/cpu/rp2040/%.cyclo: ../kernel/sysdepend/cpu/rp2040/%.c kernel/sysdepend/cpu/rp2040/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-rp2040

clean-kernel-2f-sysdepend-2f-cpu-2f-rp2040:
	-$(RM) ./kernel/sysdepend/cpu/rp2040/boot_2nd.cyclo ./kernel/sysdepend/cpu/rp2040/boot_2nd.d ./kernel/sysdepend/cpu/rp2040/boot_2nd.o ./kernel/sysdepend/cpu/rp2040/boot_2nd.su ./kernel/sysdepend/cpu/rp2040/vector_tbl.cyclo ./kernel/sysdepend/cpu/rp2040/vector_tbl.d ./kernel/sysdepend/cpu/rp2040/vector_tbl.o ./kernel/sysdepend/cpu/rp2040/vector_tbl.su

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-rp2040

