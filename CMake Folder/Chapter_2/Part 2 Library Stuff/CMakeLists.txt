cmake_minimum_required(VERSION 3.0)

project(testing_math)

add_library(mearlymath adder.cpp)
# Add the executable
add_executable(testing_math main.cpp adder.cpp)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# Include the current directory for header files
target_include_directories(testing_math PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

set_target_properties(mearlymath PROPERTIES PUBLIC_HEADER adder.h)

install(TARGETS testing_math LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include)