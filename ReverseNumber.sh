#!/bin/bash
#This script prints the given number in reverse order

givenNumber=$1
reversedNumber=0
re='^-?[0-9]+$'

if ! [[ $givenNumber =~ $re ]]
then
    outputMessage="Sorry integers only"
    echo $outputMessage
fi

if [[ $1 -lt 0 &&  $givenNumber =~ $re ]]
then
	givenNumber=$(( $givenNumber * -1 ))
fi

while [[ $givenNumber -gt 0 && $givenNumber =~ $re  ]]
do 
	tmp=$(( $givenNumber % 10  ))
	reversedNumber=$(( $reversedNumber * 10 + $tmp ))
	givenNumber=$(( $givenNumber / 10 ))
done

if [[ $1 -lt 0 && $givenNumber =~ $re ]]
then
	reversedNumber=$(( $reversedNumber * -1 ))
fi

if [[ "$2" != "-t" && $givenNumber =~ $re ]]
then
echo "$reversedNumber"
fi
