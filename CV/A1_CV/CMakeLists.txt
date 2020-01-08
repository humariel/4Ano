cmake_minimum_required(VERSION 2.8.12)

project(OpenCV_ex_04)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(OpenCV_ex_04 OpenCV_ex_04.cpp)
target_link_libraries(OpenCV_ex_04 ${OpenCV_LIBS})
