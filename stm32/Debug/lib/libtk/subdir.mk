################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/libtk/fastlock.c \
../lib/libtk/fastmlock.c \
../lib/libtk/kmalloc.c 

OBJS += \
./lib/libtk/fastlock.o \
./lib/libtk/fastmlock.o \
./lib/libtk/kmalloc.o 

C_DEPS += \
./lib/libtk/fastlock.d \
./lib/libtk/fastmlock.d \
./lib/libtk/kmalloc.d 


# Each subdirectory must supply rules for building sources it contributes
lib/libtk/%.o lib/libtk/%.su lib/libtk/%.cyclo: ../lib/libtk/%.c lib/libtk/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-lib-2f-libtk

clean-lib-2f-libtk:
	-$(RM) ./lib/libtk/fastlock.cyclo ./lib/libtk/fastlock.d ./lib/libtk/fastlock.o ./lib/libtk/fastlock.su ./lib/libtk/fastmlock.cyclo ./lib/libtk/fastmlock.d ./lib/libtk/fastmlock.o ./lib/libtk/fastmlock.su ./lib/libtk/kmalloc.cyclo ./lib/libtk/kmalloc.d ./lib/libtk/kmalloc.o ./lib/libtk/kmalloc.su

.PHONY: clean-lib-2f-libtk

