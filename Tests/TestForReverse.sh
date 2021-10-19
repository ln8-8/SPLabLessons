#!/bin/bash

source ../ReverseNumber.sh 0 -t
if [ "$reversedNumber" != 0 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 1 -t
if [ "$reversedNumber" != 1 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 10 -t
if [ "$reversedNumber" != 1 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 1234 -t
if [ "$reversedNumber" != 4321 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh -23 -t
if [ "$reversedNumber" != -32 ]
then
        echo "fail"
        exit
fi
echo "success"
