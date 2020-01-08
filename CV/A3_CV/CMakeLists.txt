cmake_minimum_required(VERSION 2.8.12)

project(OpenCV_ex_18)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(OpenCV_ex_18 OpenCV_ex_18.cpp)
target_link_libraries(OpenCV_ex_18 ${OpenCV_LIBS})
