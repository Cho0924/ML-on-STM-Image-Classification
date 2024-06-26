################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.cc \
../tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.cc \
../tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.d \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.d \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.o \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.o \
./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/micro/memory_planner/%.o tensorflow_lite/tensorflow/lite/micro/memory_planner/%.su tensorflow_lite/tensorflow/lite/micro/memory_planner/%.cyclo: ../tensorflow_lite/tensorflow/lite/micro/memory_planner/%.cc tensorflow_lite/tensorflow/lite/micro/memory_planner/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Core/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/PrivateInclude" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/flatbuffers/include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/gemmlowp" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/ruy" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner

clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner:
	-$(RM) ./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.cyclo ./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.d ./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.o ./tensorflow_lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.su ./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.cyclo ./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.d ./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.o ./tensorflow_lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.su ./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.cyclo ./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.d ./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.o ./tensorflow_lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.su

.PHONY: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-memory_planner

