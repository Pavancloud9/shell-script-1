#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  
########    10-install-mysql-2026-02-04_12-45-43.log 

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

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME


for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [ $? -ne 0 ]
    then
        dnf install $PACKAGE -y
        PACKAGE_FUNCTION $? "Installing $PACKAGE"
    else
        echo "$PACKAGE...is already installed..SKIPPING"
    fi
done 