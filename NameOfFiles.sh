#!/bin/bash
#Print all file names on given folder with subfolders

printNames () {
	for fileFromGivenDirectory in $1/*
	do
		if [ -d $fileFromGivenDirectory ]
		then 
			echo "$fileFromGivenDirectory"
			printNames $fileFromGivenDirectory
		else
			echo "$fileFromGivenDirectory"
		fi
	done
}
if [ -d $1 ]
then 
	printNames $1
else
	echo "The directory does not exist"
fi
