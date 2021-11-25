#include <iostream>
#include <cerrno>

int main(int argc, char** argv) {
    
    if(argc != 3) {
            std::cerr << "Wrong amount of arguments" << std::endl;
            exit(errno);
    }

    int n = 10000;
    std::cout <<  n << " " << n << std::endl;
    for(int i = 1; i < n; i++) {
        std::cout << i << " " << i + 1 << " " << 1 << std::endl;
    }
    
    std::cout << n  << " " << 1 << " " << 1 << std::endl;
    
    int source = atoi( argv[1] );
    int destination = atoi( argv[2] );
    
    std::cout << source << " " << destination << std::endl;

    return 0;
}
