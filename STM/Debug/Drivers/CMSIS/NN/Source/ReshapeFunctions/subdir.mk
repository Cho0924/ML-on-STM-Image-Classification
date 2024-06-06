################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.c 

C_DEPS += \
./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.d 

OBJS += \
./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Source/ReshapeFunctions/%.o Drivers/CMSIS/NN/Source/ReshapeFunctions/%.su Drivers/CMSIS/NN/Source/ReshapeFunctions/%.cyclo: ../Drivers/CMSIS/NN/Source/ReshapeFunctions/%.c Drivers/CMSIS/NN/Source/ReshapeFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/Core/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/Include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/DSP/PrivateInclude" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/flatbuffers/include" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/gemmlowp" -I"C:/Users/qianq/STM32CubeIDE/workspace_1.13.2/Ex6/tensorflow_lite/third_party/ruy" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ReshapeFunctions

clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ReshapeFunctions:
	-$(RM) ./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.cyclo ./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.d ./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.o ./Drivers/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ReshapeFunctions

