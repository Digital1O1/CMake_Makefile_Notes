# [Episode 1](https://www.youtube.com/watch?v=nlKcXPUJGwA&list=PLalVdRk2RC6o5GHu618ARWh0VO0bFlif4)

# CMake Turns into MakeFile

# To run CMake
Gotta tell it where
- Your build folder is at
- Where your source is
- Don't put build folder in source folder

# Command
Need to at least use this command
- cmake [options] -S < path-to-source > -B < path-to-build >
- You can run this command where ever
    - It just has to know where the source and build path is at

# What most people do
Make build directory 
- Build everything there
    - Use this command cmake [options] -S < path-to-source > -B < path-to-build >
    - No G++ commands are used in this 
- This is what's generated in the build folder

![image](https://github.com/Digital1O1/4_DOF_Robotic_Arm/assets/39348633/c73a4643-2103-4f77-93a2-a1a5eefc2594)


# Basic CMake Outline

```bash 
cmake_minimum_required(VERSION 3.0)  # Minimum required CMake version

project(MyProject)  # Name of your project

# Set the C++ standard (optional)
set(CMAKE_CXX_STANDARD 11)

# Add executable(s) and their source files
# Change MyExecutable to whatever you want to call your executable 
# You could also use add_executable(${PROJECT_NAME} main.cpp)
add_executable(MyExecutable main.cpp)

# Specify any additional include directories
target_include_directories(MyExecutable PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Specify any additional libraries to link against
# target_link_libraries(MyExecutable PRIVATE some_library)

# You can add more targets, libraries, etc. here
```
## Breakdown of the mentioned Cmake file
	1. cmake_minimum_required(VERSION 3.0): 
		a. This sets the minimum required version of CMake. 
		b. You can adjust the version number as needed.
	2. project(MyProject): 
		a. This defines the project name. 
		b. Replace "MyProject" with your actual project name.
	3. set(CMAKE_CXX_STANDARD 11): This sets the C++ standard to use. 
		a. Replace "11" with your desired C++ standard (e.g., "17", "20").
	4. add_executable(MyExecutable main.cpp): 
		a. This adds an executable target named "MyExecutable" 
		b. And specifies that its source code is located in "main.cpp".
	5. target_include_directories(MyExecutable PRIVATE ${CMAKE_SOURCE_DIR}/include): 
		a. This adds an include directory to the target. 
		b. Replace "${CMAKE_SOURCE_DIR}/include" with the actual path to your include directory.
	6. target_link_libraries(MyExecutable PRIVATE some_library): 
		a. This would be used to link your executable against any external libraries you might be using.

