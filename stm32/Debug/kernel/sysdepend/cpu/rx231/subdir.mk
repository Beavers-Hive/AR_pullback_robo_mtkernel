################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/rx231/hllint_tbl.c \
../kernel/sysdepend/cpu/rx231/intvect_tbl.c 

S_UPPER_SRCS += \
../kernel/sysdepend/cpu/rx231/hllint_ent.S 

OBJS += \
./kernel/sysdepend/cpu/rx231/hllint_ent.o \
./kernel/sysdepend/cpu/rx231/hllint_tbl.o \
./kernel/sysdepend/cpu/rx231/intvect_tbl.o 

S_UPPER_DEPS += \
./kernel/sysdepend/cpu/rx231/hllint_ent.d 

C_DEPS += \
./kernel/sysdepend/cpu/rx231/hllint_tbl.d \
./kernel/sysdepend/cpu/rx231/intvect_tbl.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/rx231/%.o: ../kernel/sysdepend/cpu/rx231/%.S kernel/sysdepend/cpu/rx231/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -Wa,-W -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@" "$<"
kernel/sysdepend/cpu/rx231/%.o kernel/sysdepend/cpu/rx231/%.su kernel/sysdepend/cpu/rx231/%.cyclo: ../kernel/sysdepend/cpu/rx231/%.c kernel/sysdepend/cpu/rx231/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-rx231

clean-kernel-2f-sysdepend-2f-cpu-2f-rx231:
	-$(RM) ./kernel/sysdepend/cpu/rx231/hllint_ent.d ./kernel/sysdepend/cpu/rx231/hllint_ent.o ./kernel/sysdepend/cpu/rx231/hllint_tbl.cyclo ./kernel/sysdepend/cpu/rx231/hllint_tbl.d ./kernel/sysdepend/cpu/rx231/hllint_tbl.o ./kernel/sysdepend/cpu/rx231/hllint_tbl.su ./kernel/sysdepend/cpu/rx231/intvect_tbl.cyclo ./kernel/sysdepend/cpu/rx231/intvect_tbl.d ./kernel/sysdepend/cpu/rx231/intvect_tbl.o ./kernel/sysdepend/cpu/rx231/intvect_tbl.su

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-rx231

