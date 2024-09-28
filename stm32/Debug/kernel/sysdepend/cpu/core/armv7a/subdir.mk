################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/core/armv7a/cpu_cntl.c \
../kernel/sysdepend/cpu/core/armv7a/exc_hdl.c \
../kernel/sysdepend/cpu/core/armv7a/interrupt.c \
../kernel/sysdepend/cpu/core/armv7a/reset_main.c 

S_UPPER_SRCS += \
../kernel/sysdepend/cpu/core/armv7a/dispatch.S \
../kernel/sysdepend/cpu/core/armv7a/exc_entry.S \
../kernel/sysdepend/cpu/core/armv7a/int_asm.S \
../kernel/sysdepend/cpu/core/armv7a/reset_hdl.S \
../kernel/sysdepend/cpu/core/armv7a/vector_tbl.S 

OBJS += \
./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.o \
./kernel/sysdepend/cpu/core/armv7a/dispatch.o \
./kernel/sysdepend/cpu/core/armv7a/exc_entry.o \
./kernel/sysdepend/cpu/core/armv7a/exc_hdl.o \
./kernel/sysdepend/cpu/core/armv7a/int_asm.o \
./kernel/sysdepend/cpu/core/armv7a/interrupt.o \
./kernel/sysdepend/cpu/core/armv7a/reset_hdl.o \
./kernel/sysdepend/cpu/core/armv7a/reset_main.o \
./kernel/sysdepend/cpu/core/armv7a/vector_tbl.o 

S_UPPER_DEPS += \
./kernel/sysdepend/cpu/core/armv7a/dispatch.d \
./kernel/sysdepend/cpu/core/armv7a/exc_entry.d \
./kernel/sysdepend/cpu/core/armv7a/int_asm.d \
./kernel/sysdepend/cpu/core/armv7a/reset_hdl.d \
./kernel/sysdepend/cpu/core/armv7a/vector_tbl.d 

C_DEPS += \
./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.d \
./kernel/sysdepend/cpu/core/armv7a/exc_hdl.d \
./kernel/sysdepend/cpu/core/armv7a/interrupt.d \
./kernel/sysdepend/cpu/core/armv7a/reset_main.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/core/armv7a/%.o kernel/sysdepend/cpu/core/armv7a/%.su kernel/sysdepend/cpu/core/armv7a/%.cyclo: ../kernel/sysdepend/cpu/core/armv7a/%.c kernel/sysdepend/cpu/core/armv7a/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"
kernel/sysdepend/cpu/core/armv7a/%.o: ../kernel/sysdepend/cpu/core/armv7a/%.S kernel/sysdepend/cpu/core/armv7a/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -Wa,-W -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7a

clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7a:
	-$(RM) ./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.cyclo ./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.d ./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.o ./kernel/sysdepend/cpu/core/armv7a/cpu_cntl.su ./kernel/sysdepend/cpu/core/armv7a/dispatch.d ./kernel/sysdepend/cpu/core/armv7a/dispatch.o ./kernel/sysdepend/cpu/core/armv7a/exc_entry.d ./kernel/sysdepend/cpu/core/armv7a/exc_entry.o ./kernel/sysdepend/cpu/core/armv7a/exc_hdl.cyclo ./kernel/sysdepend/cpu/core/armv7a/exc_hdl.d ./kernel/sysdepend/cpu/core/armv7a/exc_hdl.o ./kernel/sysdepend/cpu/core/armv7a/exc_hdl.su ./kernel/sysdepend/cpu/core/armv7a/int_asm.d ./kernel/sysdepend/cpu/core/armv7a/int_asm.o ./kernel/sysdepend/cpu/core/armv7a/interrupt.cyclo ./kernel/sysdepend/cpu/core/armv7a/interrupt.d ./kernel/sysdepend/cpu/core/armv7a/interrupt.o ./kernel/sysdepend/cpu/core/armv7a/interrupt.su ./kernel/sysdepend/cpu/core/armv7a/reset_hdl.d ./kernel/sysdepend/cpu/core/armv7a/reset_hdl.o ./kernel/sysdepend/cpu/core/armv7a/reset_main.cyclo ./kernel/sysdepend/cpu/core/armv7a/reset_main.d ./kernel/sysdepend/cpu/core/armv7a/reset_main.o ./kernel/sysdepend/cpu/core/armv7a/reset_main.su ./kernel/sysdepend/cpu/core/armv7a/vector_tbl.d ./kernel/sysdepend/cpu/core/armv7a/vector_tbl.o

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-armv7a

