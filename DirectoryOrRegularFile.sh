#!/bin/bash
#This script report us if given file is regular file or directory

if [ $# != 1 ]
then
        echo "Wrong amount of arguments"
        exit
fi

if [ -d $1 ]
then
        outputMessage="$1 is a directory"
	echo $outputMessage
elif [ -f $1 ]
then
	outputMessage="$1 is a regular file"
	echo $outputMessage
else
	outputMessage="$1 does not exist"
	echo $outputMessage
fi
