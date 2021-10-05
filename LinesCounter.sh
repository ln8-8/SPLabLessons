#!/bin/bash
#This script counts lines in given file

if [ -f $1 ]
then
	wc -l < $1
else
	echo "The given argument is not file"
fi
