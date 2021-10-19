#!/bin/bash
#This script prints the given number in reverse order

givenNumber=$1
reversedNumber=0

if ! [ "$1" -eq "$1" ] 2> /dev/null
then
    echo "Sorry integers only"
    exit 1
fi

if [ $1 -lt 0 ]
then
	givenNumber=$(( $givenNumber * -1 ))
fi

while [ $givenNumber -gt 0 ]
do 
	tmp=$(( $givenNumber % 10  ))
	reversedNumber=$(( $reversedNumber * 10 + $tmp ))
	givenNumber=$(( $givenNumber / 10 ))
done

if [ $1 -lt 0 ]
then
	reversedNumber=$(( $reversedNumber * -1 ))
fi

if [ "$2" != "-t" ]
then
echo "$reversedNumber"
fi

