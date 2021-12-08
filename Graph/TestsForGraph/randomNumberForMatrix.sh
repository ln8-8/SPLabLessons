#!/bin/bash

SRC=$(( RANDOM % 10000 + 1 ))
echo $SRC
	
FLOOR=$(($SRC - 400))
if (( $FLOOR <= 0 ))
then
	FLOOR=1
fi

CEILING=$(($SRC + 400))
if (( $CEILING > 10000 ))
then
	CEILING=10000
fi

RANGE=$(($CEILING-$FLOOR))

DEST=$RANDOM

DEST=$(( $DEST % $RANGE + 1))

DEST=$(( $DEST + $FLOOR ))

echo $DEST
