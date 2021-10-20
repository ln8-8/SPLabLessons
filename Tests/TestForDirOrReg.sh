#!/bin/bash

touch fileForOutputText.txt
mkdir Dir
source ../DirectoryOrRegularFile.sh Dir > fileForOutputText.txt
if [ "$outputMessage" != "Dir is a directory" ]
then
        echo "failed when the given argument is a directory"
	rm -R Dir
	rm fileForOutputText.txt
        exit
fi
rm -R Dir
touch file.txt
source ../DirectoryOrRegularFile.sh file.txt > fileForOutputText.txt
if [ "$outputMessage" != "file.txt is a regular file" ]
then
        echo "failed when the given argument is a regular file"
	rm file.txt
	rm fileForOutputText.txt
        exit
fi
rm file.txt
source ../DirectoryOrRegularFile.sh nonex > fileForOutputText.txt
if [ "$outputMessage" != "nonex does not exist" ]
then
        echo "failed when the given argument doesn't exist"
	rm fileForOutputText.txt
        exit
fi

rm fileForOutputText.txt
echo "success"

