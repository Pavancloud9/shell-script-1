#!/bin/bash

USERID=$(id -u)

CHECK_ROOT() {
if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to perform this action"
    exit 1
fi
}

LOGS_FOLDER="/var/log/shell-script-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_NAME="$LOGS_FOLDER/$FILE_NAME-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "ERROR: You must use this script as sh 15-backup.sh <SOURCE_DIR> <DEST_DIR>
    <Days> <optional>"
    exit 1    
}

if [ $# -lt 2 ]
then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "Given $SOURCE_DIR does not exits, please check it"
fi

if [ ! -d $DEST_DIR ]
then
    echo "Given $DEST_DIR does not exits, please check it"
fi

FILES=$(find $SOURCE_DIR -type f -name "*.java" -mtime +14)
if [ -n "$FILES" ] ### -n means not empty
then
    echo "Files are: $FILES"
    ZIP_FILE_DIRECTORY="$DEST_DIR/app-logs-$TIMESTAMP.zip" 
    find $SOURCE_DIR -type f -name "*.java" -mtime +14 | zip -r $ZIP_FILE_DIRECTORY
    if [ $? -ne 0 ]
    then
        echo "Zip creation failed"
    else
        echo "Zip creation successfull"
    fi
else
    echo "No files to zip"
fi






