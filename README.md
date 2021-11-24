# SPLabLessons
## Scripts
This directory contains 4 shell scripts.

	1. DirectoryOrRegularFile.sh - prints the file type that was given as an argument.
	2. LinesCounter.sh - counts the number of files given as argument.
	3. NameOfFiles.sh - prints all the file names in the given directory.
	4. ReverseNumber.sh - prints the given number in reverse order.

## CMake
This directory contains two cpp, one header and the cmake file and Cmake file builds and links cpp files.

## Tests
This directory contains tests for scripts.

	1. TestForDirOrReg.sh is for testing DirectoryOrRegularFile.sh.
	2. TestForLinesCount.sh is for testing LinesCounter.sh.
	3. TestForReverse.sh is for testing ReverseNumber.sh.
	4. run.sh runs all tests.

## Docker

Dockerfile for creating new docker from ubuntu image, which will run my ReverseNumber.sh

## Graph

This projec finds the shortest way between two given nodes and prints all shortest ways.

##### How to build the project

To build this project go to the directory **SPLabLessons/Graph** and use the command **make**.

##### How to run the project

To run this project give it one file as argument. The first line of the file contains two integers. The first integer is number of nodes and the second integer is number of edges. Each of the next lines includes 3 integers, first 2 of which are nodes, and the third is the weight of the edge connecting them. The last line contains source and destination nodes.

###### Example of input

	4 4
	1 2 8
	2 3 7
	3 4 5
	2 4 4
	2 4

##### How to run the tests

To run tests use script **runTests.sh**.
