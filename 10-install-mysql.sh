#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 

LOGS_FOLDER_NAME="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_NAME="$LOGS_FOLDER_NAME/$LOG_FILE/$TIMESTAMP"

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

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

dnf list installed mysql  
if [ $? -ne 0 ]   ##### 0 KI EQUAL KAKAPOTHE
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "Mysql already installed..skipping"
fi
  
######################################

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y 
    PACKAGE $? "Installing Git"
else
    echo "GIT already installing...SKIPPING"
fi