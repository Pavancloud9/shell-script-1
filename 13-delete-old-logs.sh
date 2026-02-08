#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 

SOURCE_DIRECTORY="/home/ec2-user/shell-script-1/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  
 

##########################################

PACKAGE_FUNCTION () {
    if [ $1 -ne 0 ]  
    then
        echo "$2..Failure"
        exit 1 
    else
        echo "$2..success"
    fi
}

find $SOURCE_DIRECTORY -name "*.log" -mtime +14 -delete