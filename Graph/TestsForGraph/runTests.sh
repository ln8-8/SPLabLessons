#!/bin/bash

argumentForCheckingFails=0
existingOfMake=0

cd ../
if [[ -f "./minDist" ]]
then
    existingOfMake=1
fi

make > /dev/null

./minDist ./TestsForGraph/test1.txt > testForCheck.txt

if [ "$echo $(cat ./TestsForGraph/test1_output.txt)" != "$echo $(cat testForCheck.txt)" ]
then
	echo "Failed when running test1"
	argumentForCheckingFails=1
fi

rm testForCheck.txt

cd TestsForGraph
g++ -o forInput testOfCircleGraph.cpp
g++ -o forAnswer answerOfCircleGraph.cpp
for ((i=0; i < 100; i++)) {
	source ./randomNumbersForCircle.sh > /dev/null
	./forInput $sr $ds > input.txt
	./forAnswer $sr $ds > answer.txt
	../minDist input.txt > testToCheck.txt
	if [ "$echo $(cat answer.txt)" != "$echo $(cat testToCheck.txt)" ]
	then
        	echo "Failed when running test of circle" $sr $ds
		argumentForCheckingFails=1
	fi
}

rm forInput
rm forAnswer

g++ -o forInput testOfMatrixGraph.cpp
g++ -o forAnswer answerOfMatrixGraph.cpp
for ((i=0; i < 20; i++)) {
        source ./randomNumberForMatrix.sh > /dev/null
	echo $SRC $DEST
        ./forInput $SRC $DEST > input.txt
        ./forAnswer $SRC $DEST > answer.txt
        ../minDist input.txt > testToCheck.txt
        if [ "$echo $(cat answer.txt)" != "$echo $(cat testToCheck.txt)" ]
        then
                echo "Failed when running test of matrix for numbers " $SRC $DEST
                argumentForCheckingFails=1
        fi
}


if [ "$argumentForCheckingFails" == 0 ]
then
	echo "Success for all tests"
fi

rm input.txt
rm answer.txt
rm forInput
rm forAnswer
rm testToCheck.txt
if [ "$existingOfMake" == 0 ]
then
	cd ..
	make clean > /dev/null
	cd TestsForGraph
fi
