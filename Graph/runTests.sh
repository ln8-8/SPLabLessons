#!/bin/bash

CurDir=$(dirname $(readlink -f $0))
TestDir=$CurDir/TestsForGraph
argumentForCheckingFails=0

$CurDir/minDist $TestDir/test1.txt > testForCheck.txt

if [ "$echo $(cat $TestDir/test1_output.txt)" != "$echo $(cat testForCheck.txt)" ]
then
	echo "Failed when running test1"
	argumentForCheckingFails=1
fi

rm testForCheck.txt

for ((i=0; i < 100; i++)) {
	source $TestDir/randomNumbersForCircle.sh > /dev/null
	$TestDir/testCircle $sr $ds > input.txt
	$TestDir/ansCircle $sr $ds > answer.txt
	$CurDir/minDist input.txt > testToCheck.txt
	if [ "$echo $(cat answer.txt)" != "$echo $(cat testToCheck.txt)" ]
	then
        	echo "Failed when running test of circle" $sr $ds
		argumentForCheckingFails=1
	fi
}

for ((i=0; i < 20; i++)) {
        source $TestDir/randomNumberForMatrix.sh > /dev/null
        $TestDir/testMatrix $SRC $DEST > input.txt
        $TestDir/ansMatrix $SRC $DEST > answer.txt
        $CurDir/minDist input.txt > testToCheck.txt
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
rm testToCheck.txt
