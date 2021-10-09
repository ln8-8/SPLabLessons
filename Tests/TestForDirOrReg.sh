#!/bin/bash

mkdir Dir
source ../DirectoryOrRegular.sh Dir -t
if [ "$a" != 1 ]
then
        echo "fail"
        exit
fi
rm -R Dir
touch file.txt
source ../DirectoryOrRegular.sh file.txt -t
if [ "$a" != 2 ]
then
        echo "fail"
        exit
fi
rm file.txt
source ../DirectoryOrRegular.sh nonex -t
if [ "$a" != 3 ]
then
        echo "fail"
        exit
fi
echo "success"

