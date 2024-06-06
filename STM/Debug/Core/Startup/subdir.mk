################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32l475vgtx.s 

S_DEPS += \
./Core/Startup/startup_stm32l475vgtx.d 

OBJS += \
./Core/Startup/startup_stm32l475vgtx.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Core/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/NN/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/flatbuffers/include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Core/Inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32l475vgtx.d ./Core/Startup/startup_stm32l475vgtx.o

.PHONY: clean-Core-2f-Startup

