#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)

while read -r LINE
do
   echo "$LINE"
done <<< $DISK_USAGE