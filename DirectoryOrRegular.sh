#!/bin/bash
#This script report us if given file is regular file or directory
#Lyudovikos 4/10/2021

if [ -d $1 ]
then
	echo "$1 is a directory"
fi
if [ -f $1 ]
then
	echo "$1 is a regular file"
fi