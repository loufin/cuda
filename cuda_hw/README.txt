Comiling and running problem 1 
nvcc imageRed.cu -o red `pkg-config opencv --cflags --libs`
./red
output will be lennaRedImage.jpg in output_images/

compiling and running problem 2 
nvcc imageRotate.cu -o rotate `pkg-config opencv --cflags --libs`
./rotate
output will be lennaRotateImage.jpg in output_images/

Compiling openacc program - first need to compule cuda kernel then openacc c file 
nvcc -rdc true -c saxpyKernel.cu
pgcc -acc -Minfo=accel -ta=tesla:rdc,cc70 -o saxpy openacc_saxpy.c saxpyKernel.o 
./saxpy

For just an openacc saxpy implementation
pgcc -acc -ta=tesla:cc70 -Minfo=accel -o saxpy2 openacc_saxpy2.c 
./saxpy2