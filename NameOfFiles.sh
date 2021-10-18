#!/bin/bash
#Print all file names on given folder with subfolders

printNames () {
	for i in $1/*
	do
		if [ -d $i ]
		then 
			echo "$i"
			printNames $i
		else
			echo "$i"
		fi
	done
}
if [ -d $1 ]
then 
	printNames $1
else
	echo "The directory does not exist"
fi
