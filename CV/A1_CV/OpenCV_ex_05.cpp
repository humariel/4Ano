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

	image = cv::imread( file, cv::IMREAD_UNCHANGED );
	cv::cvtColor(image, image, CV_RGB2GRAY, 0);
	if(image.empty())
	{
	    std::cout << "Image file could not be open !!" << std::endl;
	    return -1;
	}

	cv::namedWindow("Display window", cv::WINDOW_NORMAL);
    cv::imshow("Display window", image);

    cv::waitKey( 0 );

	cv::destroyWindow( "Display window" );

	return 0;
}
