################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/micro/kernels/testdata/%.o tensorflow_lite/tensorflow/lite/micro/kernels/testdata/%.su tensorflow_lite/tensorflow/lite/micro/kernels/testdata/%.cyclo: ../tensorflow_lite/tensorflow/lite/micro/kernels/testdata/%.cc tensorflow_lite/tensorflow/lite/micro/kernels/testdata/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Core/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/PrivateInclude" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/flatbuffers/include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/gemmlowp" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/ruy" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-testdata

clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-testdata:
	-$(RM) ./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.cyclo ./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.d ./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.o ./tensorflow_lite/tensorflow/lite/micro/kernels/testdata/conv_test_data.su

.PHONY: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-testdata

