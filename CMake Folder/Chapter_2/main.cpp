#include <iostream>

int main()
{
    std::cout << "Hello, CMake!" << std::endl;
    return 0;
}

/*
    Notes
        - While you're in the build folder, use this command : cmake -S ..
        - Remember : cmake [options] -S < path-to-source > -B < path-to-build >
        - By default, the CMakelists.txt file will generate files for VS and NOT generate a MakeFile
            - Use this command to generate a MakeFile while in the build folder : cmake -G "Unix Makefiles" ..


*/