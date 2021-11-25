#include <iostream>
#include <cerrno>

int main(int argc, char** argv) {

	if(argc != 3) {
            std::cerr << "Wrong amount of arguments" << std::endl;
            exit(errno);
        }

	int source = atoi(argv[1]);
	int destination = atoi(argv[2]);
	
	if(source < destination) {
		if(destination - source <= 10000 - destination + source) {
			std::cout << "The shortest distance is " << destination - source << std::endl;
			for(int i = source; i <= destination; i++) {
				std::cout << i << " ";
			}
			std::cout << std::endl;
		}
		if(destination - source >= 10000 - destination + source) {
			if(destination - source != 10000 - destination + source) {
				std::cout << "The shortest distance is " << 10000 - destination + source << std::endl;
			}
			for(int i = source; i >= 1; i--) {
                                std::cout << i << " ";
                        }
				for(int i = 10000; i >= destination; i--) {
					std::cout << i << " ";
			}
			std::cout << std::endl;
		}
	}

	else {
		if(source - destination <= 10000 - source + destination) {
			std::cout << "The shortest distance is " << source - destination << std::endl;
			for(int i = source; i >= destination; i--) {
                                std::cout << i << " ";
                        }
                        std::cout << std::endl;
		}
		if(source - destination >= 10000 - source + destination) {
                        if(source - destination != 10000 - source + destination) {
                                std::cout << "The shortest distance is " << 10000 - source + destination << std::endl;
                        }
                        for(int i = source; i <= 10000; i++) {
                                std::cout << i << " ";
                        }
                        for(int i = 1; i <= destination; i++) {
                                std::cout << i << " ";
                        }
                        std::cout << std::endl;
                }
        }

	return 0;
}
