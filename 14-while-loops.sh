#!/bin/bash

FILE=13-delete-old-logs.sh
while read -r line;
do
    echo $line
done < "$FILE"