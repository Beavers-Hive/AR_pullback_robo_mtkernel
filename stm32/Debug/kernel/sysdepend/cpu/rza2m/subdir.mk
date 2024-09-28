################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/sysdepend/cpu/rza2m/ttb_ini.c 

S_UPPER_SRCS += \
../kernel/sysdepend/cpu/rza2m/sf_boot.S 

OBJS += \
./kernel/sysdepend/cpu/rza2m/sf_boot.o \
./kernel/sysdepend/cpu/rza2m/ttb_ini.o 

S_UPPER_DEPS += \
./kernel/sysdepend/cpu/rza2m/sf_boot.d 

C_DEPS += \
./kernel/sysdepend/cpu/rza2m/ttb_ini.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/sysdepend/cpu/rza2m/%.o: ../kernel/sysdepend/cpu/rza2m/%.S kernel/sysdepend/cpu/rza2m/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -Wa,-W -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@" "$<"
kernel/sysdepend/cpu/rza2m/%.o kernel/sysdepend/cpu/rza2m/%.su kernel/sysdepend/cpu/rza2m/%.cyclo: ../kernel/sysdepend/cpu/rza2m/%.c kernel/sysdepend/cpu/rza2m/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-sysdepend-2f-cpu-2f-rza2m

clean-kernel-2f-sysdepend-2f-cpu-2f-rza2m:
	-$(RM) ./kernel/sysdepend/cpu/rza2m/sf_boot.d ./kernel/sysdepend/cpu/rza2m/sf_boot.o ./kernel/sysdepend/cpu/rza2m/ttb_ini.cyclo ./kernel/sysdepend/cpu/rza2m/ttb_ini.d ./kernel/sysdepend/cpu/rza2m/ttb_ini.o ./kernel/sysdepend/cpu/rza2m/ttb_ini.su

.PHONY: clean-kernel-2f-sysdepend-2f-cpu-2f-rza2m

