#!/bin/bash

mkdir Dir
source ../DirectoryOrRegularFile.sh Dir -t
if [ "$outputMessage" != "Dir is a directory" ]
then
        echo "fail1"
        exit
fi
rm -R Dir
touch file.txt
source ../DirectoryOrRegularFile.sh file.txt -t
if [ "$outputMessage" != "file.txt is a regular file" ]
then
        echo "fail2"
        exit
fi
rm file.txt
source ../DirectoryOrRegularFile.sh nonex -t
if [ "$outputMessage" != "nonex does not exist" ]
then
        echo "fail3"
        exit
fi
echo "success"

