################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../kernel/tkernel/cpuctl.c \
../kernel/tkernel/device.c \
../kernel/tkernel/deviceio.c \
../kernel/tkernel/eventflag.c \
../kernel/tkernel/int.c \
../kernel/tkernel/klock.c \
../kernel/tkernel/mailbox.c \
../kernel/tkernel/memory.c \
../kernel/tkernel/mempfix.c \
../kernel/tkernel/mempool.c \
../kernel/tkernel/messagebuf.c \
../kernel/tkernel/misc_calls.c \
../kernel/tkernel/mutex.c \
../kernel/tkernel/objname.c \
../kernel/tkernel/power.c \
../kernel/tkernel/rendezvous.c \
../kernel/tkernel/semaphore.c \
../kernel/tkernel/task.c \
../kernel/tkernel/task_manage.c \
../kernel/tkernel/task_sync.c \
../kernel/tkernel/time_calls.c \
../kernel/tkernel/timer.c \
../kernel/tkernel/tkinit.c \
../kernel/tkernel/wait.c 

OBJS += \
./kernel/tkernel/cpuctl.o \
./kernel/tkernel/device.o \
./kernel/tkernel/deviceio.o \
./kernel/tkernel/eventflag.o \
./kernel/tkernel/int.o \
./kernel/tkernel/klock.o \
./kernel/tkernel/mailbox.o \
./kernel/tkernel/memory.o \
./kernel/tkernel/mempfix.o \
./kernel/tkernel/mempool.o \
./kernel/tkernel/messagebuf.o \
./kernel/tkernel/misc_calls.o \
./kernel/tkernel/mutex.o \
./kernel/tkernel/objname.o \
./kernel/tkernel/power.o \
./kernel/tkernel/rendezvous.o \
./kernel/tkernel/semaphore.o \
./kernel/tkernel/task.o \
./kernel/tkernel/task_manage.o \
./kernel/tkernel/task_sync.o \
./kernel/tkernel/time_calls.o \
./kernel/tkernel/timer.o \
./kernel/tkernel/tkinit.o \
./kernel/tkernel/wait.o 

C_DEPS += \
./kernel/tkernel/cpuctl.d \
./kernel/tkernel/device.d \
./kernel/tkernel/deviceio.d \
./kernel/tkernel/eventflag.d \
./kernel/tkernel/int.d \
./kernel/tkernel/klock.d \
./kernel/tkernel/mailbox.d \
./kernel/tkernel/memory.d \
./kernel/tkernel/mempfix.d \
./kernel/tkernel/mempool.d \
./kernel/tkernel/messagebuf.d \
./kernel/tkernel/misc_calls.d \
./kernel/tkernel/mutex.d \
./kernel/tkernel/objname.d \
./kernel/tkernel/power.d \
./kernel/tkernel/rendezvous.d \
./kernel/tkernel/semaphore.d \
./kernel/tkernel/task.d \
./kernel/tkernel/task_manage.d \
./kernel/tkernel/task_sync.d \
./kernel/tkernel/time_calls.d \
./kernel/tkernel/timer.d \
./kernel/tkernel/tkinit.d \
./kernel/tkernel/wait.d 


# Each subdirectory must supply rules for building sources it contributes
kernel/tkernel/%.o kernel/tkernel/%.su kernel/tkernel/%.cyclo: ../kernel/tkernel/%.c kernel/tkernel/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -D_NUCLEO_H723_ -c -I"/Users/ys/mtk3_bsp/config" -I"/Users/ys/mtk3_bsp/include" -I"/Users/ys/mtk3_bsp/kernel/knlinc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -o "$@"

clean: clean-kernel-2f-tkernel

clean-kernel-2f-tkernel:
	-$(RM) ./kernel/tkernel/cpuctl.cyclo ./kernel/tkernel/cpuctl.d ./kernel/tkernel/cpuctl.o ./kernel/tkernel/cpuctl.su ./kernel/tkernel/device.cyclo ./kernel/tkernel/device.d ./kernel/tkernel/device.o ./kernel/tkernel/device.su ./kernel/tkernel/deviceio.cyclo ./kernel/tkernel/deviceio.d ./kernel/tkernel/deviceio.o ./kernel/tkernel/deviceio.su ./kernel/tkernel/eventflag.cyclo ./kernel/tkernel/eventflag.d ./kernel/tkernel/eventflag.o ./kernel/tkernel/eventflag.su ./kernel/tkernel/int.cyclo ./kernel/tkernel/int.d ./kernel/tkernel/int.o ./kernel/tkernel/int.su ./kernel/tkernel/klock.cyclo ./kernel/tkernel/klock.d ./kernel/tkernel/klock.o ./kernel/tkernel/klock.su ./kernel/tkernel/mailbox.cyclo ./kernel/tkernel/mailbox.d ./kernel/tkernel/mailbox.o ./kernel/tkernel/mailbox.su ./kernel/tkernel/memory.cyclo ./kernel/tkernel/memory.d ./kernel/tkernel/memory.o ./kernel/tkernel/memory.su ./kernel/tkernel/mempfix.cyclo ./kernel/tkernel/mempfix.d ./kernel/tkernel/mempfix.o ./kernel/tkernel/mempfix.su ./kernel/tkernel/mempool.cyclo ./kernel/tkernel/mempool.d ./kernel/tkernel/mempool.o ./kernel/tkernel/mempool.su ./kernel/tkernel/messagebuf.cyclo ./kernel/tkernel/messagebuf.d ./kernel/tkernel/messagebuf.o ./kernel/tkernel/messagebuf.su ./kernel/tkernel/misc_calls.cyclo ./kernel/tkernel/misc_calls.d ./kernel/tkernel/misc_calls.o ./kernel/tkernel/misc_calls.su ./kernel/tkernel/mutex.cyclo ./kernel/tkernel/mutex.d ./kernel/tkernel/mutex.o ./kernel/tkernel/mutex.su ./kernel/tkernel/objname.cyclo ./kernel/tkernel/objname.d ./kernel/tkernel/objname.o ./kernel/tkernel/objname.su ./kernel/tkernel/power.cyclo ./kernel/tkernel/power.d ./kernel/tkernel/power.o ./kernel/tkernel/power.su ./kernel/tkernel/rendezvous.cyclo ./kernel/tkernel/rendezvous.d ./kernel/tkernel/rendezvous.o ./kernel/tkernel/rendezvous.su ./kernel/tkernel/semaphore.cyclo ./kernel/tkernel/semaphore.d ./kernel/tkernel/semaphore.o ./kernel/tkernel/semaphore.su ./kernel/tkernel/task.cyclo ./kernel/tkernel/task.d ./kernel/tkernel/task.o ./kernel/tkernel/task.su ./kernel/tkernel/task_manage.cyclo ./kernel/tkernel/task_manage.d ./kernel/tkernel/task_manage.o ./kernel/tkernel/task_manage.su ./kernel/tkernel/task_sync.cyclo ./kernel/tkernel/task_sync.d ./kernel/tkernel/task_sync.o ./kernel/tkernel/task_sync.su ./kernel/tkernel/time_calls.cyclo ./kernel/tkernel/time_calls.d ./kernel/tkernel/time_calls.o ./kernel/tkernel/time_calls.su ./kernel/tkernel/timer.cyclo ./kernel/tkernel/timer.d ./kernel/tkernel/timer.o ./kernel/tkernel/timer.su ./kernel/tkernel/tkinit.cyclo ./kernel/tkernel/tkinit.d ./kernel/tkernel/tkinit.o ./kernel/tkernel/tkinit.su ./kernel/tkernel/wait.cyclo ./kernel/tkernel/wait.d ./kernel/tkernel/wait.o ./kernel/tkernel/wait.su

.PHONY: clean-kernel-2f-tkernel

