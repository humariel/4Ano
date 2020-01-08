cmake_minimum_required(VERSION 2.8.12)

project(object_detection)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(object_detection object_detection.cpp)
target_link_libraries(object_detection ${OpenCV_LIBS})
