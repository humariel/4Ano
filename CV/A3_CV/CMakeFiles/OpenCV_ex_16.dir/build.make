# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gabriel/UA/4Ano/CV/A3_CV

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gabriel/UA/4Ano/CV/A3_CV

# Include any dependencies generated for this target.
include CMakeFiles/OpenCV_ex_16.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OpenCV_ex_16.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OpenCV_ex_16.dir/flags.make

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o: CMakeFiles/OpenCV_ex_16.dir/flags.make
CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o: OpenCV_ex_16.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gabriel/UA/4Ano/CV/A3_CV/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o -c /home/gabriel/UA/4Ano/CV/A3_CV/OpenCV_ex_16.cpp

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gabriel/UA/4Ano/CV/A3_CV/OpenCV_ex_16.cpp > CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.i

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gabriel/UA/4Ano/CV/A3_CV/OpenCV_ex_16.cpp -o CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.s

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.requires:

.PHONY : CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.requires

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.provides: CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.requires
	$(MAKE) -f CMakeFiles/OpenCV_ex_16.dir/build.make CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.provides.build
.PHONY : CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.provides

CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.provides.build: CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o


# Object files for target OpenCV_ex_16
OpenCV_ex_16_OBJECTS = \
"CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o"

# External object files for target OpenCV_ex_16
OpenCV_ex_16_EXTERNAL_OBJECTS =

OpenCV_ex_16: CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o
OpenCV_ex_16: CMakeFiles/OpenCV_ex_16.dir/build.make
OpenCV_ex_16: /usr/local/lib/libopencv_gapi.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_stitching.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_aruco.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_bgsegm.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_bioinspired.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_ccalib.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_dnn_objdetect.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_dnn_superres.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_dpm.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_face.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_freetype.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_fuzzy.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_hdf.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_hfs.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_img_hash.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_line_descriptor.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_quality.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_reg.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_rgbd.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_saliency.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_stereo.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_structured_light.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_superres.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_surface_matching.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_tracking.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_videostab.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_viz.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_xfeatures2d.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_xobjdetect.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_xphoto.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_shape.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_highgui.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_datasets.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_plot.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_text.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_dnn.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_ml.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_phase_unwrapping.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_optflow.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_ximgproc.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_video.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_videoio.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_imgcodecs.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_objdetect.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_calib3d.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_features2d.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_flann.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_photo.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_imgproc.so.4.1.2
OpenCV_ex_16: /usr/local/lib/libopencv_core.so.4.1.2
OpenCV_ex_16: CMakeFiles/OpenCV_ex_16.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gabriel/UA/4Ano/CV/A3_CV/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable OpenCV_ex_16"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OpenCV_ex_16.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OpenCV_ex_16.dir/build: OpenCV_ex_16

.PHONY : CMakeFiles/OpenCV_ex_16.dir/build

CMakeFiles/OpenCV_ex_16.dir/requires: CMakeFiles/OpenCV_ex_16.dir/OpenCV_ex_16.cpp.o.requires

.PHONY : CMakeFiles/OpenCV_ex_16.dir/requires

CMakeFiles/OpenCV_ex_16.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OpenCV_ex_16.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OpenCV_ex_16.dir/clean

CMakeFiles/OpenCV_ex_16.dir/depend:
	cd /home/gabriel/UA/4Ano/CV/A3_CV && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gabriel/UA/4Ano/CV/A3_CV /home/gabriel/UA/4Ano/CV/A3_CV /home/gabriel/UA/4Ano/CV/A3_CV /home/gabriel/UA/4Ano/CV/A3_CV /home/gabriel/UA/4Ano/CV/A3_CV/CMakeFiles/OpenCV_ex_16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OpenCV_ex_16.dir/depend

