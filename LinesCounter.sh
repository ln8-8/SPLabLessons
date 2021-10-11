#!/bin/bash
#This script counts lines in given file

if [ -f $1 ]
then
	output=$( wc -l < $1 )
	if [ "$2" != "-t" ]
	then
	echo $output
	fi
else
	output="The given argument is not file"
	if [ "$2" != "-t" ]
        then
	echo $output
	fi
fi
