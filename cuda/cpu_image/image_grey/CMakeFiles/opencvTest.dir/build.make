# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pdc_shared/Instructor/gpu/cuda/image_grey

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pdc_shared/Instructor/gpu/cuda/image_grey

# Include any dependencies generated for this target.
include CMakeFiles/opencvTest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/opencvTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/opencvTest.dir/flags.make

CMakeFiles/opencvTest.dir/opencv.cpp.o: CMakeFiles/opencvTest.dir/flags.make
CMakeFiles/opencvTest.dir/opencv.cpp.o: opencv.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pdc_shared/Instructor/gpu/cuda/image_grey/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/opencvTest.dir/opencv.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/opencvTest.dir/opencv.cpp.o -c /home/pdc_shared/Instructor/gpu/cuda/image_grey/opencv.cpp

CMakeFiles/opencvTest.dir/opencv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opencvTest.dir/opencv.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pdc_shared/Instructor/gpu/cuda/image_grey/opencv.cpp > CMakeFiles/opencvTest.dir/opencv.cpp.i

CMakeFiles/opencvTest.dir/opencv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opencvTest.dir/opencv.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pdc_shared/Instructor/gpu/cuda/image_grey/opencv.cpp -o CMakeFiles/opencvTest.dir/opencv.cpp.s

CMakeFiles/opencvTest.dir/opencv.cpp.o.requires:
.PHONY : CMakeFiles/opencvTest.dir/opencv.cpp.o.requires

CMakeFiles/opencvTest.dir/opencv.cpp.o.provides: CMakeFiles/opencvTest.dir/opencv.cpp.o.requires
	$(MAKE) -f CMakeFiles/opencvTest.dir/build.make CMakeFiles/opencvTest.dir/opencv.cpp.o.provides.build
.PHONY : CMakeFiles/opencvTest.dir/opencv.cpp.o.provides

CMakeFiles/opencvTest.dir/opencv.cpp.o.provides.build: CMakeFiles/opencvTest.dir/opencv.cpp.o

# Object files for target opencvTest
opencvTest_OBJECTS = \
"CMakeFiles/opencvTest.dir/opencv.cpp.o"

# External object files for target opencvTest
opencvTest_EXTERNAL_OBJECTS =

opencvTest: CMakeFiles/opencvTest.dir/opencv.cpp.o
opencvTest: CMakeFiles/opencvTest.dir/build.make
opencvTest: /usr/lib64/libopencv_calib3d.so
opencvTest: /usr/lib64/libopencv_contrib.so
opencvTest: /usr/lib64/libopencv_core.so
opencvTest: /usr/lib64/libopencv_features2d.so
opencvTest: /usr/lib64/libopencv_flann.so
opencvTest: /usr/lib64/libopencv_highgui.so
opencvTest: /usr/lib64/libopencv_imgproc.so
opencvTest: /usr/lib64/libopencv_legacy.so
opencvTest: /usr/lib64/libopencv_ml.so
opencvTest: /usr/lib64/libopencv_objdetect.so
opencvTest: /usr/lib64/libopencv_photo.so
opencvTest: /usr/lib64/libopencv_stitching.so
opencvTest: /usr/lib64/libopencv_superres.so
opencvTest: /usr/lib64/libopencv_ts.so
opencvTest: /usr/lib64/libopencv_video.so
opencvTest: /usr/lib64/libopencv_videostab.so
opencvTest: CMakeFiles/opencvTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable opencvTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opencvTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/opencvTest.dir/build: opencvTest
.PHONY : CMakeFiles/opencvTest.dir/build

CMakeFiles/opencvTest.dir/requires: CMakeFiles/opencvTest.dir/opencv.cpp.o.requires
.PHONY : CMakeFiles/opencvTest.dir/requires

CMakeFiles/opencvTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/opencvTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/opencvTest.dir/clean

CMakeFiles/opencvTest.dir/depend:
	cd /home/pdc_shared/Instructor/gpu/cuda/image_grey && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pdc_shared/Instructor/gpu/cuda/image_grey /home/pdc_shared/Instructor/gpu/cuda/image_grey /home/pdc_shared/Instructor/gpu/cuda/image_grey /home/pdc_shared/Instructor/gpu/cuda/image_grey /home/pdc_shared/Instructor/gpu/cuda/image_grey/CMakeFiles/opencvTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/opencvTest.dir/depend

