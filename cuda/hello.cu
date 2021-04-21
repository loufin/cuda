#include <stdio.h>

__device__ const char *STR = "HELLO WORLD!";
const char STR_LENGTH = 12;

__global__ void hello()
{
	printf("%d %c\n", blockIdx.x, STR[threadIdx.x % STR_LENGTH]);
}

int main(void)
{
	int num_threads = STR_LENGTH;
	int num_blocks = 2;
  // 2*12 = 24 threads
	hello<<<num_blocks,num_threads>>>();
	cudaDeviceSynchronize();

	return 0;
}

