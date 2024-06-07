#include <CycleCounter.h>
#include <CycleCounter.h>
#include "app.h"
#include "usart.h"


#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_allocator.h"
#include "tensorflow/lite/micro/system_setup.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "q8fmnist.h"
#include "data.h"
// User code -Begin
//Since C++ supports name mangling when compiling, while C does not
//We need to tell the C++ compiler to use C linkage for the functions declared in the header.
extern "C" {
#include "CycleCounter.h"
}
// End- User code

// Declaration and initialization of global variables
tflite::ErrorReporter* error_reporter = nullptr;
const tflite::Model* nn = nullptr;
tflite::MicroInterpreter* interpreter = nullptr;
TfLiteTensor* nn_input = nullptr;
TfLiteTensor* nn_output = nullptr;
constexpr size_t kTensorArenaSize = 60*1024;  // a contiguous blocks of memory used for tensors
uint8_t tensor_arena[kTensorArenaSize];


int application(void)
{
	// Setup code
//	MicroPrintf("Hello there");
	TfLiteStatus tflite_status;
	tflite::InitializeTarget();
	// Set up logging (modify tensorflow/lite/micro/debug_log.cc)
	static tflite::MicroErrorReporter micro_error_reporter;
	error_reporter = &micro_error_reporter;

	// Map the model into a usable data structure
	nn = tflite::GetModel(q8fmnist);
	if (nn->version() != TFLITE_SCHEMA_VERSION)
	{
		error_reporter->Report("Model version does not match Schema\n");
	}

	static tflite::AllOpsResolver micro_op_resolver;

	static tflite::MicroAllocator *micro_allocator;
	micro_allocator = tflite::MicroAllocator::Create(tensor_arena, kTensorArenaSize, error_reporter);
	// Build an interpreter to run the model with.
	static tflite::MicroInterpreter static_interpreter(
			nn, micro_op_resolver, micro_allocator, error_reporter);
	interpreter = &static_interpreter;

	// Allocate memory from the tensor_arena for the model's tensors.
	tflite_status = interpreter->AllocateTensors();  // -> is the member access operator
	if (tflite_status != kTfLiteOk){
		error_reporter->Report("AllocateTensors() failed\n");
	}

	// Retrieve the address of the input/output tensor
	// 0 is the index of the input/output tensor
	TfLiteTensor* nn_input = interpreter->input(0);
	TfLiteTensor* nn_output = interpreter->output(0);


	while(1){
		// User code -Begin
		ResetTimer();
		StartTimer();
		// -End User code
		// receive an image
		// nn_input->data.int8 is the member where input data is going to be stored after receiving them via USART
		HAL_USART_Receive(&husart1, (uint8_t*)nn_input->data.int8, 28*28*1, HAL_MAX_DELAY);
		HAL_Delay(1000);
		// send the image back to show that MCU received it properly
		HAL_USART_Transmit(&husart1, (uint8_t*)nn_input->data.int8, 28*28*1, HAL_MAX_DELAY);
		HAL_Delay(1000);
		// start inference (the model is already trained on your laptop)
		tflite_status = interpreter->Invoke();
		if(tflite_status != kTfLiteOk){
			error_reporter->Report("Invoke failed");
		}
		// send the result
		HAL_USART_Transmit(&husart1, (uint8_t*)nn_output->data.int8, 10, HAL_MAX_DELAY);
		// User code -Begin
		StopTimer();
		unsigned int cycle = getCycles();
		printf("Num of cycles per inference step:%i\n", cycle);
		// -End User code
	}
}

// for log debugging
void DebugLog(const char* s)
{
//	return;
	HAL_USART_Transmit(&husart1, (uint8_t*)s, strlen(s), 100);
}
