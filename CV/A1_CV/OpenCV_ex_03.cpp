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


// If you want to "simplify" code writing, you might want to use:

// using namespace cv;

// using namespace std;


int main( int argc, char** argv )
{
    // To store an image
	std::string file1, file2;
	cv::Mat image1, image2, image3;
	file1 = argv[1];
	file2 = argv[2];

	image1 = cv::imread( file1, cv::IMREAD_UNCHANGED );
	image2 = cv::imread( file2, cv::IMREAD_UNCHANGED );
	image3 = cv::imread( file1, cv::IMREAD_UNCHANGED );

	image3 = image2 - image1;

	if( image1.empty() || image2.empty())
	{
	    std::cout << "Image file could not be open !!" << std::endl;
	    return -1;
	}

	cv::namedWindow( "Display window1", cv::WINDOW_NORMAL );
    cv::imshow( "Display window1", image1 );
	cv::namedWindow( "Display window2", cv::WINDOW_NORMAL );
    cv::imshow( "Display window2", image2 );
	cv::namedWindow( "Display window3", cv::WINDOW_NORMAL );
    cv::imshow( "Display window3", image3 );

    // Wait for a pressed key

    cv::waitKey( 0 );

	// Destroy the window --- Actually not needed in such a simple program

	cv::destroyWindow( "Display window" );

	return 0;
}
