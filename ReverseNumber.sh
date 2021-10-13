#!/bin/bash
#This script prints the given number in reverse order

n=$1
ans=0

if ! [ "$1" -eq "$1" ] 2> /dev/null
then
    echo "Sorry integers only"
    exit 1
fi


if [ $1 -lt 0 ]
then
	n=$(( $n * -1 ))
fi

while [ $n -gt 0 ]
do 
	tmp=$(( $n % 10  ))
	ans=$(( $ans * 10 + $tmp ))
	n=$(( $n / 10 ))
done

if [ $1 -lt 0 ]
then
	ans=$(( $ans * -1 ))
fi

if [ "$2" != "-t" ]
then
echo "$ans"
fi

