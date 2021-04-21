#include <iostream>
#include <time.h>
#include <stdio.h>
#include "opencv2/opencv.hpp"
using namespace cv;
using namespace std;

//#define BLUR_SIZE 35
#define BLUR_SIZE 5

//Image.data is a uchar array or unsigned character array (8 bits) 
// Format is a long array with numbers representing RGBRGBRGB ...

int blurKernel(Mat inImage, Mat outImage, uint imgheight, uint imgwidth)
{
// idx is for column  and idy is for row
for(int idx = 0; idx < imgwidth; idx++)
{
  for(int idy = 0; idy < imgheight; idy++)
  {    
		int pixVal1 = 0;
		int pixVal2 = 0;
		int pixVal3 = 0;
		int pixels = 0;

		// Get the average of the surrounding BLUR_SIZE x BLUR_SIZE box
		for (int blurrow = -BLUR_SIZE; blurrow < BLUR_SIZE + 1; ++blurrow) {
			for (int blurcol = -BLUR_SIZE; blurcol < BLUR_SIZE + 1; ++blurcol) {
				int currow = idy + blurrow;
				int curcol = idx + blurcol;
				// Verify we have a valid image pixel
				if (currow > -1 && currow < imgheight && 
				                   curcol > -1 && curcol < imgwidth) 
				{
  				    int bIndex = 3*(currow * imgwidth + curcol);
  				    
  				    pixVal1 += inImage.data[bIndex];
  				    pixVal2 += inImage.data[bIndex + 1];
  				    pixVal3 += inImage.data[bIndex + 2];
  				    
					pixels++; // Keep track of number of pixels in the avg
				} // end if
			} // end inner  blurcol for
		} // end outer blurrow for
		
		int index = 3*((idy*imgwidth) + idx);
		outImage.data[index] = (unsigned char)(pixVal1 / pixels);
	    outImage.data[index + 1] = (unsigned char)(pixVal2 / pixels);
	    outImage.data[index + 2] = (unsigned char)(pixVal3 / pixels);
   } //end inner for idy
  }  //end outer for idx
  
  imwrite("blurOut.jpg", outImage);
  
  return 0;
}

int main()
{
    Mat image = imread("e1.jpg");
//    Mat image = imread("input2.jpg");
    const uint imgheight = image.rows;
    const uint imgwidth = image.cols;
    cout<<"Channels "<<image.channels()<<endl;
    cout<<"Image total "<<image.total()<<endl;
    cout<< "Product "<<(imgheight * imgwidth)<<endl;
    
    Mat blurImage(imgheight, imgwidth, CV_8UC3);
	
	blurKernel(image, blurImage, imgheight, imgwidth);
    
    return 0;
}