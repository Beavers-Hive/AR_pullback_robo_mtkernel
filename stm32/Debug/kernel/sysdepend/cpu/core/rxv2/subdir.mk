################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/core/rxv2/cpu_cntl.c \
../kernel/sysdepend/cpu/core/rxv2/exc_hdr.c \
../kernel/sysdepend/cpu/core/rxv2/interrupt.c \
../kernel/sysdepend/cpu/core/rxv2/reset_main.c \
../kernel/sysdepend/cpu/core/rxv2/vector_tbl.c 

S_UPPER_SRCS += \
../kernel/sysdepend/cpu/core/rxv2/dispatch.S \
../kernel/sysdepend/cpu/core/rxv2/int_asm.S \
../kernel/sysdepend/cpu/core/rxv2/reset_hdl.S 

OBJS += \
./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.o \
./kernel/sysdepend/cpu/core/rxv2/dispatch.o \
./kernel/sysdepend/cpu/core/rxv2/exc_hdr.o \
./kernel/sysdepend/cpu/core/rxv2/int_asm.o \
./kernel/sysdepend/cpu/core/rxv2/interrupt.o \
./kernel/sysdepend/cpu/core/rxv2/reset_hdl.o \
./kernel/sysdepend/cpu/core/rxv2/reset_main.o \
./kernel/sysdepend/cpu/core/rxv2/vector_tbl.o 

S_UPPER_DEPS += \
./kernel/sysdepend/cpu/core/rxv2/dispatch.d \
./kernel/sysdepend/cpu/core/rxv2/int_asm.d \
./kernel/sysdepend/cpu/core/rxv2/reset_hdl.d 

C_DEPS += \
./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.d \
./kernel/sysdepend/cpu/core/rxv2/exc_hdr.d \
./kernel/sysdepend/cpu/core/rxv2/interrupt.d \
./kernel/sysdepend/cpu/core/rxv2/reset_main.d \
./kernel/sysdepend/cpu/core/rxv2/vector_tbl.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/core/rxv2/%.o kernel/sysdepend/cpu/core/rxv2/%.su kernel/sysdepend/cpu/core/rxv2/%.cyclo: ../kernel/sysdepend/cpu/core/rxv2/%.c kernel/sysdepend/cpu/core/rxv2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"
kernel/sysdepend/cpu/core/rxv2/%.o: ../kernel/sysdepend/cpu/core/rxv2/%.S kernel/sysdepend/cpu/core/rxv2/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -Wa,-W -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-rxv2

clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-rxv2:
	-$(RM) ./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.cyclo ./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.d ./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.o ./kernel/sysdepend/cpu/core/rxv2/cpu_cntl.su ./kernel/sysdepend/cpu/core/rxv2/dispatch.d ./kernel/sysdepend/cpu/core/rxv2/dispatch.o ./kernel/sysdepend/cpu/core/rxv2/exc_hdr.cyclo ./kernel/sysdepend/cpu/core/rxv2/exc_hdr.d ./kernel/sysdepend/cpu/core/rxv2/exc_hdr.o ./kernel/sysdepend/cpu/core/rxv2/exc_hdr.su ./kernel/sysdepend/cpu/core/rxv2/int_asm.d ./kernel/sysdepend/cpu/core/rxv2/int_asm.o ./kernel/sysdepend/cpu/core/rxv2/interrupt.cyclo ./kernel/sysdepend/cpu/core/rxv2/interrupt.d ./kernel/sysdepend/cpu/core/rxv2/interrupt.o ./kernel/sysdepend/cpu/core/rxv2/interrupt.su ./kernel/sysdepend/cpu/core/rxv2/reset_hdl.d ./kernel/sysdepend/cpu/core/rxv2/reset_hdl.o ./kernel/sysdepend/cpu/core/rxv2/reset_main.cyclo ./kernel/sysdepend/cpu/core/rxv2/reset_main.d ./kernel/sysdepend/cpu/core/rxv2/reset_main.o ./kernel/sysdepend/cpu/core/rxv2/reset_main.su ./kernel/sysdepend/cpu/core/rxv2/vector_tbl.cyclo ./kernel/sysdepend/cpu/core/rxv2/vector_tbl.d ./kernel/sysdepend/cpu/core/rxv2/vector_tbl.o ./kernel/sysdepend/cpu/core/rxv2/vector_tbl.su

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-core-2f-rxv2

