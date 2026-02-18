#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to perform this action"
    exit 1
fi

LOGS_FOLDER="/var/log/shell-script-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_NAME="$LOGS_FOLDER/$FILE_NAME-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>>$LOG_fILE_NAME


