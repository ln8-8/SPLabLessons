#!/bin/bash
#This script counts lines in given file

if [ $# != 1 ]
then
	echo "Wrong amount of arguments"
	exit
fi	

if [ -f $1 ]
then
	outputMessage=$( wc -l < $1 )
	echo $outputMessage
else
	outputMessage="The given argument is not file"
	echo $outputMessage
fi
