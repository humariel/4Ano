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
	std::string file;
	cv::Mat image;
	cv::Mat clone;
	file = argv[1];
	// Read an image from file

	// Note the flag : IMREAD_UNCHANGED

	// Question : which other flags can be used ?

	image = cv::imread( file, cv::IMREAD_UNCHANGED );
	clone = image.clone();

	int height = image.size().height;
	int width = image.size().width;
	
	for(int i=0; i<height; i++){
		for(int j=0; j<width; j++){
			if(clone.at<uchar>(i, j) < 128){
				clone.at<uchar>(i, j) = 0;
			}	
		}		
	}

	if( image.empty() )
	{
	    // NOT SUCCESSFUL : the data attribute is empty

	    std::cout << "Image file could not be open !!" << std::endl;

	    return -1;
	}

	// Create a window to display the image

    // WINDOW_AUTOSIZE : image size determines window size

	// Question : can the window be resized by the user ?

	// Question : which other flags can be used ?

	cv::namedWindow( "Display window", cv::WINDOW_NORMAL );

    // Display the image

    	cv::imshow( "Display window", clone );

    // Wait for a pressed key

    	cv::waitKey( 0 );

	// Destroy the window --- Actually not needed in such a simple program

	cv::destroyWindow( "Display window" );

	return 0;
}
