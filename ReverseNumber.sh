#!/bin/bash
#This script prints the given number in reverse order

givenNumber=$1
reversedNumber=0
CheckGivenArgument='^[0-9]+$'

if ! [[ $givenNumber =~ $CheckGivenArgument ]]
then
    	outputMessage="Given argument is not an unsigned integer"
    	echo $outputMessage
else
	reversedNumber=$(echo $givenNumber | rev )
	echo $reversedNumber
fi
