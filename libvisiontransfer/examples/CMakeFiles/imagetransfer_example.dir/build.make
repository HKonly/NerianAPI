# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer

# Include any dependencies generated for this target.
include examples/CMakeFiles/imagetransfer_example.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/imagetransfer_example.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/imagetransfer_example.dir/flags.make

examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o: examples/CMakeFiles/imagetransfer_example.dir/flags.make
examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o: examples/imagetransfer_example.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o"
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o -c /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples/imagetransfer_example.cpp

examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.i"
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples/imagetransfer_example.cpp > CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.i

examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.s"
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples/imagetransfer_example.cpp -o CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.s

# Object files for target imagetransfer_example
imagetransfer_example_OBJECTS = \
"CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o"

# External object files for target imagetransfer_example
imagetransfer_example_EXTERNAL_OBJECTS =

examples/imagetransfer_example: examples/CMakeFiles/imagetransfer_example.dir/imagetransfer_example.cpp.o
examples/imagetransfer_example: examples/CMakeFiles/imagetransfer_example.dir/build.make
examples/imagetransfer_example: lib/libvisiontransfer.so
examples/imagetransfer_example: examples/CMakeFiles/imagetransfer_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable imagetransfer_example"
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/imagetransfer_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/imagetransfer_example.dir/build: examples/imagetransfer_example

.PHONY : examples/CMakeFiles/imagetransfer_example.dir/build

examples/CMakeFiles/imagetransfer_example.dir/clean:
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples && $(CMAKE_COMMAND) -P CMakeFiles/imagetransfer_example.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/imagetransfer_example.dir/clean

examples/CMakeFiles/imagetransfer_example.dir/depend:
	cd /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples /home/parallels/work/Huawei-context-IDS-2021/data_collector/test_codes/NerianAPI/libvisiontransfer/examples/CMakeFiles/imagetransfer_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/imagetransfer_example.dir/depend

