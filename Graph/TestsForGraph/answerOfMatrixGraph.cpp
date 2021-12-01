#include <iostream>
#include <cerrno>
#include <vector>

void printFromLeftTop (int x, int y, int destination, int source, int matrix[][101], std::vector<int> ways) {
        int valOfNode = matrix[x][y];
        ways.push_back(valOfNode);

        if (valOfNode  == destination) {
            for (int i = 0; i < ways.size(); i++) {
                std::cout << ways[i] << " ";
            }
            std::cout << std::endl;
        }
        else if(((valOfNode % 100) <= (destination % 100) && (valOfNode / 100) <= (destination / 100 )) || destination % 100 == 0)  {
              if (y + 1 <= 100) {
                  printFromLeftTop(x, y + 1, destination, source, matrix,ways);
              }
              if (x + 1 <= 100) {
                  printFromLeftTop(x + 1, y, destination, source, matrix,ways);
              }
        }

        ways.pop_back();
}

void printFromRightTop (int x, int y, int destination, int source, int matrix[][101], std::vector<int> ways) {
        int valOfNode = matrix[x][y];
        ways.push_back(valOfNode);

        if (valOfNode  == destination) {
            for (int i = 0; i < ways.size(); i++) {
                std::cout << ways[i] << " ";
            }
            std::cout << std::endl;
        }
        else if (((valOfNode % 100) >= (destination % 100) && (valOfNode / 100) <= (destination / 100 )) || valOfNode % 100 == 0) {
          if (y - 1 > 0) {
                printFromRightTop (x, y - 1, destination, source, matrix, ways);
          }
          if (x + 1 <= 100) {
                printFromRightTop(x + 1, y, destination, source, matrix, ways);
          }
        }

        ways.pop_back();
}

void printFromRightDown(int x, int y, int destination, int source, int matrix[][101], std::vector<int> ways) {
        int valOfNode = matrix[x][y];
        ways.push_back(valOfNode);

        if (valOfNode  == destination) {
            for (int i = 0; i < ways.size(); i++) {
                std::cout << ways[i] << " ";
            }
            std::cout << std::endl;
        }


        else if(((valOfNode % 100) >= (destination % 100) && (valOfNode / 100) >= (destination / 100 )) || valOfNode % 100 == 0) {
                if (x - 1  > 0) {
                    printFromRightDown(x - 1, y, destination, source, matrix,ways);
                }

              if (y - 1 > 0) {
                  printFromRightDown(x, y - 1, destination, source, matrix,ways);
              }
        }

        ways.pop_back();
}

void printFromLeftDown (int x, int y, int destination, int source, int matrix[][101], std::vector<int> ways) {
        int valOfNode = matrix[x][y];
        ways.push_back(valOfNode);

        if (valOfNode  == destination) {
            for (int i = 0; i < ways.size(); i++) {
                std::cout << ways[i] << " ";
            }
            std::cout << std::endl;
        }

       else if( ((valOfNode % 100) <= (destination % 100) && (valOfNode / 100) >= (destination / 100 )) || destination % 100 == 0) {
            if (x - 1 > 0) {
                printFromLeftDown(x - 1, y, destination, source,  matrix, ways);
            }

            if (y + 1 <= 100) {
                printFromLeftDown(x, y + 1, destination, source, matrix, ways);
            }
        }

        ways.pop_back();
}
void minWayMatrix (int source, int destination) {
        int n = 100;
        int matrix[101][101];
        std::vector<int> ways;

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                matrix[i][j] = (i - 1) * n + j;
            }
        }

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (matrix[i][j] == source) {
                    if(source < destination) {
                        if( (source % 100) <= (destination % 100) && (source % 100 != 0 ) || destination % 100 == 0 ) {
                            int shortDist;
                            if (source % 100 == 0 && destination % 100 == 0){
                                shortDist = (destination - source) / 100;
                            }
                            else if(destination % 100 != 0) {
                                shortDist = (destination % 100) - (source % 100) + (destination / 100) - (source / 100);
                            }
                            else {
                                shortDist = (destination % 100) + 100 - (source % 100) + (destination / 100) - (source / 100) - 1;
                            }
                            std::cout << "The shortest distance is " << shortDist << std::endl;
                            printFromLeftTop(i, j, destination, source, matrix, ways);
                        }
                        else if( (source % 100) > (destination % 100) || source % 100 == 0) {
                            int shortDist;
                            if(source % 100 != 0) { 
                                shortDist = (source % 100) - (destination % 100) + (destination / 100) - (source / 100);
                            }
                            else {
                                shortDist = (source % 100) + 100 - (destination % 100) + (destination / 100) + 1 - (source / 100);
                            }
                            std::cout << "The shortest distance is " << shortDist << std::endl;
                            printFromRightTop(i, j, destination, source, matrix, ways);
                        }
                    }
                    else {
                        if ( ((source % 100) <= (destination % 100) && (source % 100 != 0 )) || destination % 100 == 0 ) {
                            int shortDist;
                            if (source % 100 == 0 && destination % 100 == 0){
                                shortDist = (source - destination) / 100;
                            }
                            else if(destination % 100 != 0) {
                                shortDist = (destination % 100) - (source % 100) + (source / 100) - (destination / 100);
                            }
                            else {
                                shortDist = (destination % 100) + 100 - (source % 100) + (source / 100) + 1 - (destination / 100);
                            }
                            std::cout << "The shortest distance is " << shortDist << std::endl;
                            
                            printFromLeftDown(i, j, destination, source, matrix, ways);
                        }
                        else if( (source % 100) > (destination % 100) || source % 100 == 0){
                            int shortDist;
                            if(source % 100 != 0) {
                                shortDist = (source % 100) - (destination % 100) + (source / 100) - (destination / 100);
                            }
                            else {
                                shortDist = (source % 100) + 100 - (destination % 100) + (source / 100) - (destination / 100) - 1;
                            }
                            std::cout << "The shortest distance is " << shortDist << std::endl;
                            printFromRightDown(i, j, destination, source, matrix, ways);
                        }
                    }
                    return;
                }
            }
        }
}

int main(int argc, char** argv) {
    
    if(argc != 3) {
            std::cerr << "Wrong amount of arguments" << std::endl;
            exit(errno);
        }

    int source = atoi(argv[1]);
    int destination = atoi(argv[2]);
    
    minWayMatrix(source, destination);


  return 0;
}
