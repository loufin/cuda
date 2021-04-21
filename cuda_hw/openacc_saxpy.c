#include <stdio.h>
#include <openacc.h>

#define N 1000000

#pragma acc routine seq
extern "C" float cuda_saxpy_dev(float, float, float);

//compile: pgcc -acc program_name.c
//compile option 2:  pgcc -acc -Minfo=accel -ta=tesla:cc70 -o prog program_name.c

void populate_array(float arr[], float multiple) {
	int i;
	for(i=0;i<N;i++) {
		arr[i] = ( (float)i + 1.0)*multiple;
	}
}

void print_array(float arr[]) {
	int i;
	for(i=0;i<10;i++) {
		printf("%f,",arr[i]);
	}
	printf("...");
	for(i=N-5;i<N;i++) {
		printf(",%f",arr[i]);
	}
	printf("\n");
}

void saxpy(int n, float a, float *x, float *y)
{  
    #pragma acc parallel loop
    for (int i = 0; i < n; ++i){     
        y[i] = a*x[i] + y[i];
    }
}

void saxpy_2(int n, float a, float *x, float *y)
{
    #pragma acc parallel loop copyout(y[0:N], x[0:N])
    for (int i = 0; i < n; ++i)
    {     
        y[i] = cuda_saxpy_dev(a, x[i], y[i]);
    }
}

int main(int argc, char* argv[]) {
    float x[N], y[N];

	populate_array(x, 0.9);
	populate_array(y, 1);

    print_array(x);
    print_array(y);

    saxpy_2(N, 2.0, x, y);
	print_array(y);

	return 0;
}
