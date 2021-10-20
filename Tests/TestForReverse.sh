#!/bin/bash

argumentForChekingFails=0

touch fileForOutputText.txt
source ../ReverseNumber.sh abc > fileForOutputText.txt
if [ "$outputMessage" != "Given argument is not an unsigned integer" ]
then
        output="failed when the given argument isn't an integer (ReverseNumber.sh)"
	echo $output
	argumentForChekingFails=1
fi
source ../ReverseNumber.sh 0 > fileForOutputText.txt
if [ "$reversedNumber" != 0 ]
then
	output="failed when the given argument is 0 (ReverseNumber.sh)"
        echo $output
	argumentForChekingFails=1
fi
source ../ReverseNumber.sh 1234 > fileForOutputText.txt
if [ "$reversedNumber" != 4321 ]
then
	output="failed when the given argument is a positive number (ReverseNumber.sh)"
        echo $output
	argumentForChekingFails=1
fi
source ../ReverseNumber.sh -23 > fileForOutputText.txt
if [ "$outputMessage" != "Given argument is not an unsigned integer" ]
then
	output="failed when the given argument is a negative number (ReverseNumber.sh)"
        echo $output
	argumentForChekingFails=1
fi

rm fileForOutputText.txt
if [ $argumentForChekingFails == 0 ]
then
	output="success for script ReverseNumber.sh"
	echo $output
fi
