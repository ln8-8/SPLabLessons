#!/bin/bash
#This script report us if given file is regular file or directory

if [ -d $1 ]
then
        outputMessage="$1 is a directory"
	if [ "$2" != "-t" ]
	then	
	echo $outputMessage
	fi
elif [ -f $1 ]
then
	outputMessage="$1 is a regular file"
	if [ "$2" != "-t" ]
	then
	echo $outputMessage
	fi
else
	outputMessage="$1 does not exist"
	if [ "$2" != "-t" ]
	then
	echo $outputMessage
	fi
fi
