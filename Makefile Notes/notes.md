# Makefile Notes

## The C++ program
```cpp
#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
```

## The Makefile used to compile the program
```Makefile
##############################################################################################################
# Summary : Compiler flags
CPP := g++
# 'CPP' --> variable assigned to 'g++'
# Variables in Makefile stored in reverse compared to C++
# Example : Variable := flag
##############################################################################################################
# Summary : COMPILER_FLAGS : variable that stores compiler flags
# -std=c++11 : use C++11 standard
# -Wall : enable most of the compiler's warning messages
COMPILER_FLAGS := -std=c++11 -Wall
##############################################################################################################
# Summary : Source files
SOURCE_FILES := main.cpp
# Defines the variable SOURCE_FILES
# Stores list of source files, which in this case is just main.cpp
##############################################################################################################
# Summary : # Object files
OBJECT_FILES := $(SOURCE_FILES:.cpp=.o)
# OBJECT_FILES := $(SOURCE_FILES:.cpp=.o) --> A feature called 'Pattern substitution' in Makefiles
# Syntax for pattern subsitutions         --> $(PROGRAM_EXECUTABLE): $(OBJECT_FILES): 
# Breaking the variables down
# OBJECT_FILES                            --> Variable that's storing everything
# $(SOURCE_FILES)                         --> Variable that holds a list of source files. In this case, main.cpp
# :.cpp=.o                                --> Pattern substitution opeartion applied to each element in $(SOURCE_FILES) 
#                                             replaces each instance of .cpp in  $(SOURCE_FILES) with '.o' file. 
#                                             It'll contain main.cpp and result in main.o
##############################################################################################################
# Summary :  Target application
# Holds name of final executable
PROGRAM_EXECUTABLE := myprogram
##############################################################################################################
# Summary : Rule to compile each source file into an object file
%.o: %.cpp
	@echo "Compiling: $<"
	$(CPP) $(COMPILER_FLAGS) -c $< -o $@
# The target pattern ('%.o:') specifies the pattern for the target file, which is the '%' which matches any sequence of characters, followed by '.o'
# The colon (':') seperates the target pattern from the prerequisites 
# Prerequisite pattern ('%.cpp') specifies which pattern to look for 
# The second line : target-prerequisite declaration

# The actual command(s)
# @echo "Compiling:" prints message to consol indicating which source file is being compiled
# $< : Represents first prerequisite of the rule; which in this case is the source file being compiled
# -c : Tells compiler to generate object files; .o files, from source files w/o linking
# $< : Is an automatic variable in Make. Represents first prerequisite of the rule which in this case is the source file (%.cpp) that's being compiled
# %@ : Another automatic avariable in Make that represents the target of the rule, which in this case is the object file that's generated
##############################################################################################################
# Summary : Rule to link the object files into the final application
$(PROGRAM_EXECUTABLE): $(OBJECT_FILES)
	@echo "Linking: $@"
	$(CPP) -o $@ $(OBJECT_FILES) $(COMPILER_FLAGS)

# $(PROGRAM_EXECUTABLE): $(OBJECT_FILES):      --> This is the target-prerequisite declaration. 
# $(PROGRAM_EXECUTABLE) is the target pattern. --> represents the program executable that we want to build.
# $(OBJECT_FILES)                              --> The prerequisite pattern. 
#                                                  It represents the list of object files required to build the program executable.
# The first line : pretty much states the program executable depends on the object file listed in $(OBJECT_FILES). 
# If any object files change, the program executable needs to be rebuilt

# @echo "Linking: $@":
# Prints message to console indicating linking process is taking place
# @ --> suppressses printing of the command itself
#       only  "Linking: $(PROGRAM_EXECUTABLE)" is displayed

# $@ :
# Automatic variable that represents the target of the rule
# Which in this case is the program executable
##############################################################################################################
# Rule to clean up generated files
clean:
	@echo "Cleaning up..."
	rm -rf $(PROGRAM_EXECUTABLE) $(OBJECT_FILES)
```