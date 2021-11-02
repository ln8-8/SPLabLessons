#!/bin/bash
#This script prints the given number in reverse order

if [ $# != 1 ]
then
        echo "Wrong amount of arguments"
        exit
fi

givenNumber=$1
reversedNumber=0
CheckGivenArgument='^[0-9]+$'
firstCharacter=${givenNumber:0:1}
if [ $firstCharacter == "-" ]
then
        givenNumber="${givenNumber#?}"
fi

if ! [[ $givenNumber =~ $CheckGivenArgument ]]
then
        outputMessage="Given argument is not an integer"
        echo $outputMessage
else
        reversedNumber=$(echo $givenNumber | rev )
        if [ $firstCharacter == "-" ]
        then
                reversedNumber="$firstCharacter$reversedNumber"
        fi
        echo $reversedNumber
fi

