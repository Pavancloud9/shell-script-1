#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)

while read -r LINE
do
   echo "$LINE"
   USAGE=$(echo $LINE | awk -F " " '{print $6F}' )
done <<< $DISK_USAGE