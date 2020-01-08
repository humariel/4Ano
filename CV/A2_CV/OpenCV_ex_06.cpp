/*
 * OpenCV_ex_01.cpp
 *
 * Simple example - Opening and displaying an image
 *
 * J. Madeira - Nov 2012 + Nov 2017
 */




// The remaining #includes

#include <iostream>
#include <string>
// Basic OpenCV functionalities

#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <opencv/cv.hpp>

int main( int argc, char** argv )
{
	std::string file;
	cv::Mat image;
	file = argv[1];

    cv::Scalar color;

	image = cv::imread( file, cv::IMREAD_UNCHANGED );
	
	if(image.empty())
	{
	    std::cout << "Image file could not be open !!" << std::endl;
	    return -1;
	}

    if(image.channels() > 1){
        color = CV_RGB(255, 0, 0);
    }else{
        color = CV_RGB(100, 100, 100);
    }

    //draw the rows
    for(int i=0; i<image.size().width; i+=20){
        cv::line(image, cv::Point(i, 0), cv::Point(i, image.size().height), color);
    }
    //draw the cols
    for(int j=0; j<image.size().height; j+=20){
        cv::line(image, cv::Point(0, j), cv::Point(image.size().width, j), color);
    }
	cv::namedWindow("Display window", cv::WINDOW_NORMAL);
    cv::imshow("Display window", image);
    
    cv::imwrite("createImg.jpg", image);

    cv::waitKey( 0 );

	cv::destroyWindow( "Display window" );

	return 0;
}
