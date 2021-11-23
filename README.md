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

This directory contains minimumDistance.cpp file, which finds the shortest way between two given nodes and prints it all. The subdirectory TestsForGraph contains three tests with their outputs and one runTests.sh which run all tests.

