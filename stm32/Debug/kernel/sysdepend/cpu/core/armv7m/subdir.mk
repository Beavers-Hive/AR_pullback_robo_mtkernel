################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/core/armv7m/cpu_cntl.c \
../kernel/sysdepend/cpu/core/armv7m/exc_hdr.c \
../kernel/sysdepend/cpu/core/armv7m/interrupt.c \
../kernel/sysdepend/cpu/core/armv7m/reset_hdl.c 

S_UPPER_SRCS += \
../kernel/sysdepend/cpu/core/armv7m/dispatch.S 

OBJS += \
./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.o \
./kernel/sysdepend/cpu/core/armv7m/dispatch.o \
./kernel/sysdepend/cpu/core/armv7m/exc_hdr.o \
./kernel/sysdepend/cpu/core/armv7m/interrupt.o \
./kernel/sysdepend/cpu/core/armv7m/reset_hdl.o 

S_UPPER_DEPS += \
./kernel/sysdepend/cpu/core/armv7m/dispatch.d 

C_DEPS += \
./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.d \
./kernel/sysdepend/cpu/core/armv7m/exc_hdr.d \
./kernel/sysdepend/cpu/core/armv7m/interrupt.d \
./kernel/sysdepend/cpu/core/armv7m/reset_hdl.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/core/armv7m/%.o kernel/sysdepend/cpu/core/armv7m/%.su kernel/sysdepend/cpu/core/armv7m/%.cyclo: ../kernel/sysdepend/cpu/core/armv7m/%.c kernel/sysdepend/cpu/core/armv7m/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"
kernel/sysdepend/cpu/core/armv7m/%.o: ../kernel/sysdepend/cpu/core/armv7m/%.S kernel/sysdepend/cpu/core/armv7m/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -Wa,-W -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m

clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m:
	-$(RM) ./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.cyclo ./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.d ./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.o ./kernel/sysdepend/cpu/core/armv7m/cpu_cntl.su ./kernel/sysdepend/cpu/core/armv7m/dispatch.d ./kernel/sysdepend/cpu/core/armv7m/dispatch.o ./kernel/sysdepend/cpu/core/armv7m/exc_hdr.cyclo ./kernel/sysdepend/cpu/core/armv7m/exc_hdr.d ./kernel/sysdepend/cpu/core/armv7m/exc_hdr.o ./kernel/sysdepend/cpu/core/armv7m/exc_hdr.su ./kernel/sysdepend/cpu/core/armv7m/interrupt.cyclo ./kernel/sysdepend/cpu/core/armv7m/interrupt.d ./kernel/sysdepend/cpu/core/armv7m/interrupt.o ./kernel/sysdepend/cpu/core/armv7m/interrupt.su ./kernel/sysdepend/cpu/core/armv7m/reset_hdl.cyclo ./kernel/sysdepend/cpu/core/armv7m/reset_hdl.d ./kernel/sysdepend/cpu/core/armv7m/reset_hdl.o ./kernel/sysdepend/cpu/core/armv7m/reset_hdl.su

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7m

