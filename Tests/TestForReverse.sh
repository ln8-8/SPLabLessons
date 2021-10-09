#!/bin/bash

source ../ReverseNumber.sh 0 -t
if [ "$ans" != 0 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 1 -t
if [ "$ans" != 1 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 10 -t
if [ "$ans" != 1 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh 1234 -t
if [ "$ans" != 4321 ]
then
        echo "fail"
        exit
fi
source ../ReverseNumber.sh -23 -t
if [ "$ans" != -32 ]
then
        echo "fail"
        exit
fi
echo "success"
