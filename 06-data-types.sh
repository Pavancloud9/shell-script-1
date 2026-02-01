#!/bin/bash

NUMBER1=$1
NUMBER2=$2 

TIMESTAMP=$(date)
echo "script executed at: $TIMESTAMP"

ADD=$(($NUMBER1+$NUMBER2))

echo "ADD of $NUMBER1 and $NUMBER2 is: $ADD"

$(date)