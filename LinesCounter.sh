#!/bin/bash
#This script counts lines in given file

if [ $# != 1 ]
then
	echo "Wrong amount of arguments"
	exit
fi	

if [ -f $1 ]
then
	output=$( wc -l < $1 )
	echo $output
else
	output="The given argument is not file"
	echo $output
fi
