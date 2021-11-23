#!/bin/bash

argumentForCheckingFails=0
existingOfMake=0

cd ../
if [[ -f "./minDist" ]]
then
    existingOfMake=1
fi

make > formake.txt

./minDist ./TestsForGraph/test1.txt > testForCheck.txt

if [ "$echo $(cat ./TestsForGraph/test1_output.txt)" != "$echo $(cat testForCheck.txt)" ]
then
	echo "Failed when running test1"
	argumentForCheckingFails=1
fi

./minDist ./TestsForGraph/test2.txt > testForCheck.txt

if [ "$echo $(cat ./TestsForGraph/test2_output.txt)" != "$echo $(cat testForCheck.txt)" ]
then
        echo "Failed when running test2"
        argumentForCheckingFails=1
fi

./minDist ./TestsForGraph/test3.txt > testForCheck.txt

if [ "$echo $(cat ./TestsForGraph/test3_output.txt)" != "$echo $(cat testForCheck.txt)" ]
then
        echo "Failed when running test3"
        argumentForCheckingFails=1
fi

if [ "$argumentForCheckingFails" == 0 ]
then
	echo "Success for all tests"
fi

rm testForCheck.txt

if [ "$existingOfMake" == 0 ]
then
	make clean > formake.txt
fi

rm formake.txt
