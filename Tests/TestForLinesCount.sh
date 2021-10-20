#!/bin/bash

touch fileForOutputText.txt
source ../LinesCounter.sh ../LinesCounter.sh > fileForOutputText.txt
if [ "$output" != 17 ]
then
	echo "failed when the given argument is a regluar file which isn't empty"
	rm fileForOutputText.txt
	exit
fi

touch test.txt 
source ../LinesCounter.sh test.txt > fileForOutputText.txt
if [ "$output" != 0 ]
then
        echo "failed when the given argument is en empty regular file"
	rm fileForOutputText.txt
	rm test.txt
        exit
fi
rm test.txt

mkdir dir
source ../LinesCounter.sh dir > fileForOutputText.txt
if [ "$output" != "The given argument is not file" ]
then
        echo "failed when the given argument is a directory"
	rm fileForOutputText.txt
	rm -R dir
        exit
fi
rm -R dir

source ../LinesCounter.sh t > fileForOutputText.txt
if [ "$output" != "The given argument is not file" ]
then
        echo "failed when the given file doesn't exist"
	rm fileForOutputText.txt
        exit
fi

rm fileForOutputText.txt
echo "success"
