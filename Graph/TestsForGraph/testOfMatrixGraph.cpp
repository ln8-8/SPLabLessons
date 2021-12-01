#include <iostream>
#include <vector>
#include <cerrno>

int main(int argc, char** argv) {
    
	if(argc != 3) {
            std::cerr << "Wrong amount of arguments" << std::endl;
            exit(errno);
        }

        int a[101][101];
        std::vector<std::pair<int, int>> edges;
        int n = 100;
        
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                a[i][j] = (i - 1) * n + j;
            }
        }
        
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (j + 1 <= n)
                edges.push_back( std::make_pair(a[i][j], a[i][j + 1]) );
                if (i + 1 <= n)
                edges.push_back( std::make_pair(a[i][j], a[i + 1][j]) );
            }
        }
        
        int edgSize = edges.size();
        std::cout << n*n << " " << edgSize << std::endl; 
        for (int i = 0; i < edgSize; i++) {
            std::cout << edges[i].first << " " << edges[i].second << " 1" << std::endl;
        }
        
	int source = atoi( argv[1] );
    	int destination = atoi( argv[2] );

    	std::cout << source << " " << destination << std::endl;

        return 0;
}
