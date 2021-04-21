#include <iostream>
#include <time.h>
#include <stdio.h>
#include "opencv2/opencv.hpp"
using namespace cv;
using namespace std;

#define RED_SIZE 3 
// 5:34 pm

__global__ void redKernel(uchar3 * const d_in, uchar3 * const d_out, 
								uint imgheight, uint imgwidth)
{
	const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;  // column
    const unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;  // row

	if (idx < imgwidth && idy < imgheight) {
		int pixVal1 = 0;
		int pixVal2 = 0;
		int pixVal3 = 0;
		int pixel_index = 0;
		int redPixel =0;

		// Get the average of the surrounding BLUR_SIZE x BLUR_SIZE box
		for (int redrow = -RED_SIZE; redrow < RED_SIZE + 1; ++redrow) {
			for (int redcol = -RED_SIZE; redcol < RED_SIZE + 1; ++redcol) {
				int currow = idy + redrow;
				int curcol = idx + redcol;

				// Verify we have a valid image pixel
				if (currow > -1 && currow < imgheight && curcol > -1 && curcol < imgwidth) {
					
					pixVal1 = d_in[currow * imgwidth + curcol].x;
					pixVal2 = d_in[currow * imgwidth + curcol].y;
					pixVal3 = d_in[currow * imgwidth + curcol].z;

					if(pixVal1 > redPixel){
						redPixel = pixVal1;
					}

					pixel_index++;
				}
			}
		}
		// Write our new pixel value out
		d_out[idy * imgwidth + idx].x = (unsigned char)(redPixel);
		d_out[idy * imgwidth + idx].y = (unsigned char)(pixVal2);
		d_out[idy * imgwidth + idx].z = (unsigned char)(pixVal3);
	}
}
int main(void)
{
    Mat srcImage = imread("input_images/lenna.png");
    const uint imgheight = srcImage.rows;
    const uint imgwidth = srcImage.cols;


    uchar3 *d_in;

    cudaMalloc((void**)&d_in, imgheight*imgwidth*sizeof(uchar3));

    cudaMemcpy(d_in, srcImage.data, imgheight*imgwidth*sizeof(uchar3), cudaMemcpyHostToDevice);
    
    dim3 threadsPerBlock(32, 32);
    dim3 blocksPerGrid((imgwidth + threadsPerBlock.x - 1) / threadsPerBlock.x,
         (imgheight + threadsPerBlock.y - 1) / threadsPerBlock.y);
  
	Mat redImage(imgheight, imgwidth, CV_8UC3);
	uchar3 *d_out2;
	cudaMalloc((void**)&d_out2, imgheight*imgwidth*sizeof(uchar3));
	redKernel<< <blocksPerGrid, threadsPerBlock>> >(d_in, d_out2, imgheight, imgwidth);
	cudaMemcpy(redImage.data, d_out2, imgheight*imgwidth*sizeof(uchar3), cudaMemcpyDeviceToHost);
	cudaFree(d_in);
	cudaFree(d_out2);
	imwrite("output_images/lennaRedImage.jpg",redImage);
	
    return 0;

}
