# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES

# Include any dependencies generated for this target.
include CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/flags.make

CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o: CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/flags.make
CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o: /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP/MyFile.cpp
CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o: CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o -MF CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o.d -o CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o -c /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP/MyFile.cpp

CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP/MyFile.cpp > CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.i

CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP/MyFile.cpp -o CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.s

# Object files for target MY_CPP_PROJECT_CMAKE.exe
MY_CPP_PROJECT_CMAKE_exe_OBJECTS = \
"CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o"

# External object files for target MY_CPP_PROJECT_CMAKE.exe
MY_CPP_PROJECT_CMAKE_exe_EXTERNAL_OBJECTS =

MY_CPP_PROJECT_CMAKE.exe: CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/MyFile.cpp.o
MY_CPP_PROJECT_CMAKE.exe: CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/build.make
MY_CPP_PROJECT_CMAKE.exe: /usr/lib/libsfml-network.so.2.5.1
MY_CPP_PROJECT_CMAKE.exe: /usr/lib/libsfml-graphics.so.2.5.1
MY_CPP_PROJECT_CMAKE.exe: /usr/lib/libsfml-window.so.2.5.1
MY_CPP_PROJECT_CMAKE.exe: /usr/lib/libsfml-system.so.2.5.1
MY_CPP_PROJECT_CMAKE.exe: CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable MY_CPP_PROJECT_CMAKE.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/build: MY_CPP_PROJECT_CMAKE.exe
.PHONY : CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/build

CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/clean

CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/depend:
	cd /home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP /home/matthewalgo/Projects/ProjectSkeletonForCXX/SOURCE_CPP /home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES /home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES /home/matthewalgo/Projects/ProjectSkeletonForCXX/CMAKE_BUILD_AND_BINARY_FILES/CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MY_CPP_PROJECT_CMAKE.exe.dir/depend
