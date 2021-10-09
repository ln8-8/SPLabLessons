#!/bin/bash
#This script report us if given file is regular file or directory
#Lyudovikos 4/10/2021

a=0;

if [ -d $1 ]
then
        a=1
	if [ "$2" != "-t" ]
	then	
	echo "$1 is a directory"
	fi
elif [ -f $1 ]
then
	a=2
	if [ "$2" != "-t" ]
	then
	echo "$1 is a regular file"
	fi
else
	a=3
	if [ "$2" != "-t" ]
	then
	echo "$1 does not exist"
	fi
fi
