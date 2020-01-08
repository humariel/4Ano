/*
 * OpenCV_ex_13.c
 *
 * AVERAGING FILTER
 *
 * J. Madeira - Dec 2012 + Nov 2017
 */

#include <iostream>


#include "opencv2/core/core.hpp"

#include "opencv2/imgproc/imgproc.hpp"

#include "opencv2/highgui/highgui.hpp"


// If you want to "simplify" code writing, you might want to use:

// using namespace cv;

// using namespace std;


// AUXILIARY  FUNCTION

void printImageFeatures( const cv::Mat &image )
{
    std::cout << std::endl;

	std::cout << "Number of rows : " << image.size().height << std::endl;

	std::cout << "Number of columns : " << image.size().width << std::endl;

	std::cout << "Number of channels : " << image.channels() << std::endl;

	std::cout << "Number of bytes per pixel : " << image.elemSize() << std::endl;

	std::cout << std::endl;
}


// MAIN

int main( int argc, char** argv )
{
    if( argc != 2 )
    {
		std::cout << "The name of the image file is missing !!" << std::endl;

        return -1;
    }

	cv::Mat originalImage;

	originalImage = cv::imread( argv[1], cv::IMREAD_UNCHANGED );

	if( originalImage.empty() )
	{
		// NOT SUCCESSFUL : the data attribute is empty

		std::cout << "Image file could not be open !!" << std::endl;

	    return -1;
	}

	if( originalImage.channels() > 1 )
	{
	    // Convert to a single-channel, intensity image

		cv::cvtColor( originalImage, originalImage, cv::COLOR_BGR2GRAY, 1 );
	}

    // Create window

	cv::namedWindow( "Original Image", cv::WINDOW_AUTOSIZE );

    // Display image

	cv::imshow( "Original Image", originalImage );

    // Print some image features

	std::cout << "ORIGINAL IMAGE" << std::endl;

    printImageFeatures( originalImage );

    // 

    cv::Mat edges_1;

	cv::Canny( originalImage, edges_1, 1, 255 );

	cv::namedWindow( "Edges - 1", cv::WINDOW_AUTOSIZE );

	cv::imshow( "Edges - 1", edges_1 );

    // 

    cv::Mat edges_2;

	cv::Canny( originalImage, edges_2, 1, 128 );

	cv::namedWindow( "Edges - 2", cv::WINDOW_AUTOSIZE );

	cv::imshow( "Edges - 2", edges_2 );

    // 

    cv::Mat edges_3;

	cv::Canny( originalImage, edges_3, 220, 225 );

	cv::namedWindow( "Edges - 3", cv::WINDOW_AUTOSIZE );

	cv::imshow( "Edges - 3", edges_3 );

    // Waiting

	cv::waitKey( 0 );

	// Destroy the windows

	cv::destroyAllWindows();

	return 0;
}
