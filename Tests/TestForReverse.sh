#!/bin/bash

touch fileForOutputText.txt
source ../ReverseNumber.sh abc > fileForOutputText.txt
if [ "$outputMessage" != "Given argument is not an unsigned integer" ]
then 
	echo "failed when the given argument isn't an integer"
	rm fileForOutputText.txt
	exit
fi
source ../ReverseNumber.sh 0 > fileForOutputText.txt
if [ "$reversedNumber" != 0 ]
then
        echo "failed when the given argument is 0"
	rm fileForOutputText.txt
        exit
fi
source ../ReverseNumber.sh 1234 > fileForOutputText.txt
if [ "$reversedNumber" != 4321 ]
then
        echo "failed when the given argument is a positive number"
	rm fileForOutputText.txt
        exit
fi
source ../ReverseNumber.sh -23 > fileForOutputText.txt
if [ "$outputMessage" != "Given argument is not an unsigned integer" ]
then
        echo "failed when the given argument is a negative number"
	rm fileForOutputText.txt
        exit
fi

rm fileForOutputText.txt
echo "success"
