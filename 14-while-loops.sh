#!/bin/bash

FILE=temp.txt
while read -r line;
do
    echo $line
done < "$FILE"