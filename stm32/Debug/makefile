################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include lib/libtm/sysdepend/rsk_rz65n/subdir.mk
-include lib/libtm/sysdepend/pico_rp2040/subdir.mk
-include lib/libtm/sysdepend/nucleo_l476/subdir.mk
-include lib/libtm/sysdepend/nucleo_h723/subdir.mk
-include lib/libtm/sysdepend/no_device/subdir.mk
-include lib/libtm/sysdepend/iote_stm32l4/subdir.mk
-include lib/libtm/sysdepend/iote_rza2m/subdir.mk
-include lib/libtm/sysdepend/iote_rx231/subdir.mk
-include lib/libtm/sysdepend/iote_m367/subdir.mk
-include lib/libtm/subdir.mk
-include lib/libtk/sysdepend/cpu/tx03_m367/subdir.mk
-include lib/libtk/sysdepend/cpu/stm32l4/subdir.mk
-include lib/libtk/sysdepend/cpu/stm32h7/subdir.mk
-include lib/libtk/sysdepend/cpu/rza2m/subdir.mk
-include lib/libtk/sysdepend/cpu/rx65n/subdir.mk
-include lib/libtk/sysdepend/cpu/rx231/subdir.mk
-include lib/libtk/sysdepend/cpu/rp2040/subdir.mk
-include lib/libtk/sysdepend/cpu/core/rxv2/subdir.mk
-include lib/libtk/sysdepend/cpu/core/armv7m/subdir.mk
-include lib/libtk/sysdepend/cpu/core/armv7a/subdir.mk
-include lib/libtk/sysdepend/cpu/core/armv6m/subdir.mk
-include lib/libtk/subdir.mk
-include lib/libbsp/sysdepend/cpu/rp2040/subdir.mk
-include kernel/usermain/subdir.mk
-include kernel/tstdlib/subdir.mk
-include kernel/tkernel/subdir.mk
-include kernel/sysinit/subdir.mk
-include kernel/sysdepend/rtb_rx65n/subdir.mk
-include kernel/sysdepend/rsk_rx65n/subdir.mk
-include kernel/sysdepend/pico_rp2040/subdir.mk
-include kernel/sysdepend/nucleo_l476/subdir.mk
-include kernel/sysdepend/nucleo_h723/subdir.mk
-include kernel/sysdepend/iote_stm32l4/subdir.mk
-include kernel/sysdepend/iote_rza2m/subdir.mk
-include kernel/sysdepend/iote_rx231/subdir.mk
-include kernel/sysdepend/iote_m367/subdir.mk
-include kernel/sysdepend/cpu/tx03_m367/subdir.mk
-include kernel/sysdepend/cpu/stm32l4/subdir.mk
-include kernel/sysdepend/cpu/stm32h7/subdir.mk
-include kernel/sysdepend/cpu/rza2m/subdir.mk
-include kernel/sysdepend/cpu/rx65n/subdir.mk
-include kernel/sysdepend/cpu/rx231/subdir.mk
-include kernel/sysdepend/cpu/rp2040/subdir.mk
-include kernel/sysdepend/cpu/core/rxv2/subdir.mk
-include kernel/sysdepend/cpu/core/armv7m/subdir.mk
-include kernel/sysdepend/cpu/core/armv7a/subdir.mk
-include kernel/sysdepend/cpu/core/armv6m/subdir.mk
-include kernel/inittask/subdir.mk
-include device/ser/sysdepend/tx03_m367/subdir.mk
-include device/ser/sysdepend/stm32l4/subdir.mk
-include device/ser/sysdepend/stm32h7/subdir.mk
-include device/ser/sysdepend/rza2m/subdir.mk
-include device/ser/sysdepend/rx65n/subdir.mk
-include device/ser/sysdepend/rx231/subdir.mk
-include device/ser/sysdepend/rp2040/subdir.mk
-include device/ser/subdir.mk
-include device/i2c/sysdepend/tx03_m367/subdir.mk
-include device/i2c/sysdepend/stm32l4/subdir.mk
-include device/i2c/sysdepend/stm32h7/subdir.mk
-include device/i2c/sysdepend/rza2m/subdir.mk
-include device/i2c/sysdepend/rx65n/subdir.mk
-include device/i2c/sysdepend/rx231/subdir.mk
-include device/i2c/sysdepend/rp2040/subdir.mk
-include device/i2c/subdir.mk
-include device/common/drvif/subdir.mk
-include device/adc/sysdepend/tx03_m367/subdir.mk
-include device/adc/sysdepend/stm32l4/subdir.mk
-include device/adc/sysdepend/stm32h7/subdir.mk
-include device/adc/sysdepend/rza2m/subdir.mk
-include device/adc/sysdepend/rx65n/subdir.mk
-include device/adc/sysdepend/rx231/subdir.mk
-include device/adc/sysdepend/rp2040/subdir.mk
-include device/adc/subdir.mk
-include app_program/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := mtk3bsp_nucleo_stm32h723
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
mtk3bsp_nucleo_stm32h723.elf \

MAP_FILES += \
mtk3bsp_nucleo_stm32h723.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
mtk3bsp_nucleo_stm32h723.list \


# All Target
all: main-build

# Main-build Target
main-build: mtk3bsp_nucleo_stm32h723.elf secondary-outputs

# Tool invocations
mtk3bsp_nucleo_stm32h723.elf mtk3bsp_nucleo_stm32h723.map: $(OBJS) $(USER_OBJS) /Users/ys/mtk3_bsp/etc/linker/nucleo_h723/tkernel_map.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "mtk3bsp_nucleo_stm32h723.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"/Users/ys/mtk3_bsp/etc/linker/nucleo_h723/tkernel_map.ld" --specs=nosys.specs -Wl,-Map="mtk3bsp_nucleo_stm32h723.map" -nostartfiles -static --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

mtk3bsp_nucleo_stm32h723.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "mtk3bsp_nucleo_stm32h723.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout mtk3bsp_nucleo_stm32h723.elf mtk3bsp_nucleo_stm32h723.list mtk3bsp_nucleo_stm32h723.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
