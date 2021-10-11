#!/bin/bash

source ../LinesCounter.sh ../LinesCounter.sh -t
if [ "$output" != 17 ]
then
	echo "fail 1"
	exit
fi

touch test.txt 
source ../LinesCounter.sh test.txt -t
if [ "$output" != 0 ]
then
        echo "fail 2"
        exit
fi
rm test.txt

mkdir dir
source ../LinesCounter.sh dir -t
if [ "$output" != "The given argument is not file" ]
then
        echo "fail 3"
        exit
fi
rm -R dir

source ../LinesCounter.sh t -t
if [ "$output" != "The given argument is not file" ]
then
        echo "fail 4"
        exit
fi

echo "success"
