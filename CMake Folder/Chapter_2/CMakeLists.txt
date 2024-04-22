cmake_minimum_required(VERSION 3.0)

project(MyBasicCMakeProject)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# Add the executable
add_executable(MyExecutable main.cpp)

install(TARGETS MyExecutable DESTINATION Desktop)