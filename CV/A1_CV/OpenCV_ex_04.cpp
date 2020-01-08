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


// If you want to "simplify" code writing, you might want to use:

// using namespace cv;

// using namespace std;

void on_mouse( int event, int x, int y, int flags, void *img ){

	if (event == cv::EVENT_RBUTTONDOWN) {
		cv::Mat i = *(cv::Mat*)img;
		cv::circle(i, cv::Point(x, y), 25, CV_RGB(0, 255, 0), cv::FILLED);
		cv::imshow("Display window", i);
	}
}


int main( int argc, char** argv )
{
	std::string file;
	cv::Mat image;
	file = argv[1];

	image = cv::imread( file, cv::IMREAD_UNCHANGED );

	if( image.empty() )
	{
	    std::cout << "Image file could not be open !!" << std::endl;
	    return -1;
	}

	cv::namedWindow( "Display window", cv::WINDOW_NORMAL );
    cv::imshow( "Display window", image );

	setMouseCallback( "Display window", on_mouse, &image);

    cv::waitKey( 0 );

	cv::destroyWindow( "Display window" );

	return 0;
}
