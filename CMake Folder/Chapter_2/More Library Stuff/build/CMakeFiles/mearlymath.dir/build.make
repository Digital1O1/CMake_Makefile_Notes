# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_COMMAND = C:/Users/Digital101/AppData/Roaming/Python/Python310/site-packages/cmake/data/bin/cmake.exe

# The command to remove a file.
RM = C:/Users/Digital101/AppData/Roaming/Python/Python310/site-packages/cmake/data/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build"

# Include any dependencies generated for this target.
include CMakeFiles/mearlymath.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mearlymath.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mearlymath.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mearlymath.dir/flags.make

CMakeFiles/mearlymath.dir/src/adder.cpp.obj: CMakeFiles/mearlymath.dir/flags.make
CMakeFiles/mearlymath.dir/src/adder.cpp.obj: CMakeFiles/mearlymath.dir/includes_CXX.rsp
CMakeFiles/mearlymath.dir/src/adder.cpp.obj: E:/Coding\ Folder/VsCode\ Notes/CMake\ Notes/Chapter\ 2/More\ Library\ Stuff/src/adder.cpp
CMakeFiles/mearlymath.dir/src/adder.cpp.obj: CMakeFiles/mearlymath.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mearlymath.dir/src/adder.cpp.obj"
	C:/MinGW/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/mearlymath.dir/src/adder.cpp.obj -MF CMakeFiles/mearlymath.dir/src/adder.cpp.obj.d -o CMakeFiles/mearlymath.dir/src/adder.cpp.obj -c "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/src/adder.cpp"

CMakeFiles/mearlymath.dir/src/adder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mearlymath.dir/src/adder.cpp.i"
	C:/MinGW/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/src/adder.cpp" > CMakeFiles/mearlymath.dir/src/adder.cpp.i

CMakeFiles/mearlymath.dir/src/adder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mearlymath.dir/src/adder.cpp.s"
	C:/MinGW/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/src/adder.cpp" -o CMakeFiles/mearlymath.dir/src/adder.cpp.s

# Object files for target mearlymath
mearlymath_OBJECTS = \
"CMakeFiles/mearlymath.dir/src/adder.cpp.obj"

# External object files for target mearlymath
mearlymath_EXTERNAL_OBJECTS =

libmearlymath.a: CMakeFiles/mearlymath.dir/src/adder.cpp.obj
libmearlymath.a: CMakeFiles/mearlymath.dir/build.make
libmearlymath.a: CMakeFiles/mearlymath.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmearlymath.a"
	$(CMAKE_COMMAND) -P CMakeFiles/mearlymath.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mearlymath.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mearlymath.dir/build: libmearlymath.a
.PHONY : CMakeFiles/mearlymath.dir/build

CMakeFiles/mearlymath.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mearlymath.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mearlymath.dir/clean

CMakeFiles/mearlymath.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff" "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff" "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build" "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build" "E:/Coding Folder/VsCode Notes/CMake Notes/Chapter 2/More Library Stuff/build/CMakeFiles/mearlymath.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/mearlymath.dir/depend
