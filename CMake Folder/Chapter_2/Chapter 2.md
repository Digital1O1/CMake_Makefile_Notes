# [Chapter 2](https://www.youtube.com/watch?v=DDHCEE_PHOU&list=PLalVdRk2RC6o5GHu618ARWh0VO0bFlif4&index=2)

# New Item in CMakeLists

```Cmake
cmake_minimum_required(VERSION 3.0)

project(MyBasicCMakeProject)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# Add the executable
add_executable(MyExecutable main.cpp)

# NEW ITEM
# What does it do : Create executiable 
# 'Syntax' : install(TARGETS Has_To_Be_Executible_Name DESINATION Where_It's_Going_To_Be_Installed)
# When specifying location, it'll create a folder in the same folder directory you're currently in
# So instead of cd'ing in to the executible, you can just type in the name of the exec file to run it : ./MyExecutable
install(TARGETS MyExecutable DESTINATION bin)
```


# Librariesc