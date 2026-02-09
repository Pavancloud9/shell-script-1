#!/bin/bash

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  
########    10-install-mysql-2026-02-04_12-45-43.log 

##########################################

PACKAGE () {
    if [ $1 -ne 0 ]  
    then
        echo "$2..Failure"
        exit 1 
    else
        echo "$2..success"
    fi
}

################################################

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

USAGE() {
  echo "USAGE of the script is: sh 15-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
}

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ $# -lt 2 ]
    then
        USAGE
        exit 1 
    fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists...please check"
fi