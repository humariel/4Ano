#include <iostream>
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/videoio.hpp"
#include "opencv2/video/background_segm.hpp"

using namespace cv;
using namespace std;

const String user_window = "Trackbars";
Mat frame, hsv, mask, res, blur_image, fg_mask;
int h_treshold = 7.5;
int s_treshold = 75;
int v_treshold = 75;

int fg = 0;

int l_h = 0;
int l_s = 0;
int l_v = 0;
int h_h = 180;
int h_s = 255;
int h_v = 255;

void mouseEvent(int evt, int x, int y, int flags, void* param) {        

    if(evt == EVENT_LBUTTONDOWN) {

        //Mat image=frame.clone();
        Vec3b rgb=frame.at<Vec3b>(y,x);
        int B=rgb.val[0];
        int G=rgb.val[1];
        int R=rgb.val[2];

        Mat HSV;
        Mat RGB=frame(Rect(x,y,1,1));
        cvtColor(RGB, HSV, COLOR_BGR2HSV);

        Vec3b hsv=HSV.at<Vec3b>(0,0);
        int H=hsv.val[0];
        int S=hsv.val[1];
        int V=hsv.val[2];

        printf("RGB(%d, %d, %d) -> HSV(%d, %d, %d)\n", R, G, B, H, S, V);

        l_h = H - h_treshold;
        setTrackbarPos("LowH", user_window, l_h);
        h_h = H + h_treshold;
        setTrackbarPos("HighH", user_window, h_h);
        l_s = S - s_treshold;
        setTrackbarPos("LowS", user_window, l_s);
        h_s = S + s_treshold;
        setTrackbarPos("HighS", user_window, h_s);
        l_v = V - v_treshold;
        setTrackbarPos("LowV", user_window, l_v);
        h_v = V + v_treshold;
        setTrackbarPos("HighV", user_window, h_v);

    }
        
}


int main( int argc, char** argv ){

    String video = argc > 1 ? argv[1] : "";

    Rect user_rect, videos_rect;
    namedWindow(user_window, WINDOW_NORMAL);
    moveWindow(user_window, 0, 0);
    namedWindow("Live Capture", WINDOW_NORMAL );
    moveWindow("Live Capture", 380, 0);
    resizeWindow("Live Capture", 620, 480);
    namedWindow("Mask", WINDOW_NORMAL );
    moveWindow("Mask", 1010, 0);
    resizeWindow("Mask", 620, 480);
    namedWindow("Res", WINDOW_NORMAL );
    moveWindow("Res", 380, 540);
    resizeWindow("Res", 620, 480);
    namedWindow("Blured", WINDOW_NORMAL );
    moveWindow("Blured", 1010, 540);
    resizeWindow("Blured", 620, 480);

    setMouseCallback("Live Capture", mouseEvent, &frame);
    //user window hsv
    createTrackbar("LowH", user_window, &l_h, 180);
    createTrackbar("HighH", user_window, &h_h, 180);
    createTrackbar("LowS", user_window, &l_s, 255);
    createTrackbar("HighS", user_window, &h_s, 255);
    createTrackbar("LowV", user_window, &l_v, 255);
    createTrackbar("HighV", user_window, &h_v, 255);
    createTrackbar("Hue Threshold", user_window, &h_treshold, 180);
    createTrackbar("Saturation Threshold", user_window, &s_treshold, 255);
    createTrackbar("Value Threshold", user_window, &v_treshold, 255);
    createTrackbar("Foreground", user_window, &fg, 1);

    
    VideoCapture cap;

    int deviceID = 0;             // 0 = open default camera
    int apiID = CAP_ANY;      // 0 = autodetect default API

    if(video != "") {
        cap.open(video);
    } else {
        cap.open(deviceID + apiID);
    }

    if (!cap.isOpened()) {
        if(video != "") {
            cap.open(deviceID + apiID);
            if (!cap.isOpened()) {
                cerr << "ERROR! Unable to open camera\n";
                return -1;
            }
        } else {
            cerr << "ERROR! Unable to open camera\n";
            return -1;
        }
    }

    cout << "Starting Capture" << endl;
    cout << "Press any key to terminate" << endl;

    //create Background Subtractor objects
    Ptr<BackgroundSubtractor> pBackSub = createBackgroundSubtractorKNN();
    
    frame = imread("teste.jpg", IMREAD_UNCHANGED);
    while(1) {
        cap.read(frame);
        if (frame.empty()) {
            if(video != "") {
                cap.set(CAP_PROP_POS_FRAMES, 0);
                continue;
            }
            cerr << "ERROR! blank frame grabbed\n";
            break;
        }
        
        cvtColor(frame, hsv, COLOR_BGR2HSV);
        inRange(hsv, Scalar(l_h, l_s, l_v), Scalar(h_h, h_s, h_v), mask);
        
        if(fg){
            //fg mask
            pBackSub -> apply(frame, fg_mask);
            //merge foreground mask with mask to only get stuff that matches color in the front
            bitwise_and(mask, fg_mask, mask);
        }

        //clear the window first
        res.setTo(Scalar(0,0,0));
        bitwise_and(frame, frame, res, mask);

        imshow("Live Capture", frame);
        imshow("Mask", mask);
        imshow("Res", res);

	    medianBlur(res, blur_image, 15);

        imshow("Blured", blur_image);
        
        if (waitKey(5) >= 0)
            break;
    }
    // the camera will be deinitialized automatically in VideoCapture destructor
    cap.release();
    pBackSub.release();
    destroyAllWindows();
    return 0;
}