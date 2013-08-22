project(keyscale_icip)

cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
SET(CMAKE_BUILD_TYPE Release)
INCLUDE_DIRECTORIES(/usr/include/opencv)
find_package(PCL 1.6 REQUIRED)
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable(scalesextract scalesextract.cpp  rply.c)
target_link_libraries (scalesextract ${PCL_LIBRARIES} opencv_core opencv_imgproc opencv_calib3d opencv_video opencv_features2d opencv_ml opencv_highgui opencv_objdetect opencv_contrib opencv_legacy)

