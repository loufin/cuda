#include "opencv2/opencv.hpp"
#include<stdio.h>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
 // Read the image file
 Mat image = imread("e1.jpg");

 const uint imgheight = image.rows;
 const uint imgwidth = image.cols;
 
 cout<<imgheight<<endl;
 cout<<imgwidth<<endl; 
 cout<<image.size();
 
 Mat grayImage(imgheight, imgwidth, CV_8UC1, Scalar(0));
 
 // iterate over each pixel in the image, computing the dem point
    for( int y=0; y<image.rows; y++ ){
      for( int x=0; x<image.cols; x++ ){
          //cout<< image.at<cv::Vec3b>(0,x) <<" ";
          Vec3b v = image.at<cv::Vec3b>( y, x);
          
          grayImage.data[ image.cols * y + x ] =  0.299f * v[0] + 0.587f * v[1] + 0.114f * v[2];
      }
    }
    //So Vec3bVar[0] might be the blue color part, [1] green and [2] red.
   
    imwrite("greyImage.jpg",grayImage); 
    
    return 0;
}