#!/bin/bash

argumentForChekingFails=0

touch fileForOutputText.txt
mkdir Dir
source ../DirectoryOrRegularFile.sh Dir > fileForOutputText.txt
if [ "$outputMessage" != "Dir is a directory" ]
then
	output="failed when the given argument is a directory (DirectoryOrRegularFile.sh)"
        echo $output
	argumentForChekingFails=1
fi
rm -R Dir
touch file.txt
source ../DirectoryOrRegularFile.sh file.txt > fileForOutputText.txt
if [ "$outputMessage" != "file.txt is a regular file" ]
then
	output="failed when the given argument is a regular file (DirectoryOrRegularFile.sh)"
        echo $output
	argumentForChekingFails=1
fi
rm file.txt
source ../DirectoryOrRegularFile.sh nonex > fileForOutputText.txt
if [ "$outputMessage" != "nonex does not exist" ]
then
	output="failed when the given argument doesn't exist (DirectoryOrRegularFile.sh)"
        echo $output
	argumentForChekingFails=1
fi

rm fileForOutputText.txt
if [ $argumentForChekingFails == 0 ]
then
	output="success for script DirectoryOrRegularFile.sh"
	echo $output
fi

