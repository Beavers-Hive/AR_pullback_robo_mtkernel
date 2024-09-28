################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtm/sysdepend/iote_m367/tm_com.c 

OBJS += \
./lib/libtm/sysdepend/iote_m367/tm_com.o 

C_DEPS += \
./lib/libtm/sysdepend/iote_m367/tm_com.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtm/sysdepend/iote_m367/%.o lib/libtm/sysdepend/iote_m367/%.su lib/libtm/sysdepend/iote_m367/%.cyclo: ../lib/libtm/sysdepend/iote_m367/%.c lib/libtm/sysdepend/iote_m367/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtm-2f-sysdepend-2f-iote_m367

clean-lib-2f-libtm-2f-sysdepend-2f-iote_m367:
	-$(RM) ./lib/libtm/sysdepend/iote_m367/tm_com.cyclo ./lib/libtm/sysdepend/iote_m367/tm_com.d ./lib/libtm/sysdepend/iote_m367/tm_com.o ./lib/libtm/sysdepend/iote_m367/tm_com.su

.PHONY: clean-lib-2f-libtm-2f-sysdepend-2f-iote_m367

