cmake_minimum_required(VERSION 2.8.12)

project(OpenCV_ex_12)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(OpenCV_ex_12 OpenCV_ex_12.cpp)
target_link_libraries(OpenCV_ex_12 ${OpenCV_LIBS})
