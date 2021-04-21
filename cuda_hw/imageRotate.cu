#include <iostream>
#include <time.h>
#include <stdio.h>
#include "opencv2/opencv.hpp"
using namespace cv;
using namespace std;

__global__ void rotateKernel(uchar3 * const d_in, uchar3 * const d_out, 
								uint imgheight, uint imgwidth)
{
	const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    d_out[idx * imgheight + idy].x = d_in[idy * imgwidth + idx].x;
	d_out[idx * imgheight + idy].y = d_in[idy * imgwidth + idx].y;
	d_out[idx * imgheight + idy].z = d_in[idy * imgwidth + idx].z;
	//test 1 d_out[idx * imgheight + idy]
}
int main(void)
{
    //Mat srcImage = imread("input_images/e1.jpg");
    Mat srcImage = imread("input_images/lenna.png");

    const uint imgheight = srcImage.rows;
    const uint imgwidth = srcImage.cols;

	Mat rotateImage(imgwidth, imgheight, CV_8UC3);
    uchar3 *d_in;
    unsigned char *d_out;

    cudaMalloc((void**)&d_in, imgheight*imgwidth*sizeof(uchar3));
    cudaMemcpy(d_in, srcImage.data, imgheight*imgwidth*sizeof(uchar3), cudaMemcpyHostToDevice);
    
    dim3 threadsPerBlock(32, 32);
    dim3 blocksPerGrid((imgwidth + threadsPerBlock.x - 1) / threadsPerBlock.x,
         (imgheight + threadsPerBlock.y - 1) / threadsPerBlock.y);

	uchar3 *d_out2;
	cudaMalloc((void**)&d_out2, imgheight*imgwidth*sizeof(uchar3));
	rotateKernel<< <blocksPerGrid, threadsPerBlock>> >(d_in, d_out2, imgheight, imgwidth);
	cudaMemcpy(rotateImage.data, d_out2, imgheight*imgwidth*sizeof(uchar3), cudaMemcpyDeviceToHost);
	cudaFree(d_in);
	cudaFree(d_out2);
	imwrite("output_images/lennaRotateImage.jpg",rotateImage);
	
    return 0;

}
