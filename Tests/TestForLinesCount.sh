#!/bin/bash

argumentForChekingFails=0

touch fileForOutputText.txt
source ../LinesCounter.sh ../LinesCounter.sh > fileForOutputText.txt
if [ "$outputMessage" != 17 ]
then
	output="failed when the given argument is a regluar file which isn't empty (LinesCounter.sh)"
	echo $output
	argumentForChekingFails=1
fi

touch test.txt 
source ../LinesCounter.sh test.txt > fileForOutputText.txt
if [ "$outputMessage" != 0 ]
then
	output="failed when the given argument is en empty regular file (LinesCounter.sh)"
        echo $output
        argumentForChekingFails=1
fi
rm test.txt

mkdir dir
source ../LinesCounter.sh dir > fileForOutputText.txt
if [ "$outputMessage" != "The given argument is not file" ]
then
	output="failed when the given argument is a directory (LinesCounter.sh)"
        echo $output
        argumentForChekingFails=1
fi
rm -R dir

source ../LinesCounter.sh t > fileForOutputText.txt
if [ "$outputMessage" != "The given argument is not file" ]
then
	output="failed when the given file doesn't exist (LinesCounter.sh)"
        echo $output
        argumentForChekingFails=1
fi

rm fileForOutputText.txt
if [ $argumentForChekingFails == 0 ]
then
	output="success for script LinesCounter.sh"
	echo $output
fi
