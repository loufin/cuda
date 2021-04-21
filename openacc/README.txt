README

To compile the openacc vector sum code
pgcc -acc -ta=tesla:cc60 -o oacvec openacc_vector_sum.c

To run it
./oacvec


To compile the openmp vector sum code
gcc -fopenmp -o ompvec openmp_vector_sum.c

To run it
./ompvec
