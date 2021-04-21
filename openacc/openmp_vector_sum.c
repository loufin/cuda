#include <stdio.h>
#include <omp.h>
#define N 20000

// compile: gcc -fopenmp -o ompvec openmp_vector_sum.c
// run:  ./ompvec

void populate_array(int arr[], int multiple) {
	int i;
	for(i=0;i<N;i++) {
		arr[i] = (i+1)*multiple;
	}
}

void openmp_vector_sum(int a[], int b[], int c[]) {
	int i;
	# pragma omp parallel for
	for(i=0;i<N;i++) {
		c[i] = a[i]+b[i];
	}
}

void openmp_vector_sum2(int a[], int b[], int c[], int thread_count) {
	int i;
	# pragma omp parallel for num_threads(thread_count) default(none) shared(a,b,c) private(i)
	for(i=0;i<N;i++) {
		c[i] = a[i]+b[i];
	}
}

void print_array(int arr[]) {
	int i;
	for(i=0;i<10;i++) {
		printf("%d,",arr[i]);
	}
	printf("...");
	for(i=N-5;i<N;i++) {
		printf(",%d",arr[i]);
	}
	printf("\n");
}

int main(int argc, char* argv[]) {

	int a[N], b[N], c[N];
	populate_array(a, 4);
	populate_array(b, 9);

	openmp_vector_sum2(a,b,c,4);
	// openmp_vector_sum2(a,b,c,1024);

	print_array(a);
	print_array(b);
	print_array(c);

	return 0;
}