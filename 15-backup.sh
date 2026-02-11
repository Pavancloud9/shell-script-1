#!/bin/bash

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  
########    10-install-mysql-2026-02-04_12-45-43.log 

################################################
####### BACKUP FILES FROM ONE FOLDER TO OTHER FOLDER

echo $filename=$0
echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

SOURCE_DIR=$1
DEST_DIR=$2
DAYS_AGO=${3:-14}

USAGE() {
    echo "ERROR: You must use this script as sh 15-backup.sh <SOURCE_DIR> <DEST_DIR> <days>(optional) "
}

if [ $# -lt 2 ]  
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists..please check it"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exists..please check it"
    exit 1
fi

####### FIND THE FILES NOW

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS_AGO)

# ./tutorial.log
# ./loops.log
# ./may.log
# ./nov.log

if [ -n "$FILES" ]   ### -n means not empty
then
    echo "Files are: $FILES"
      ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
      find $SOURCE_DIR -name "*.log" -mtime +$DAYS_AGO | zip -@ "$ZIP_FILE"
        if [ $? -eq 0 ]
        then
            echo "Zip file created successfully for files older than $DAYS_AGO"
            while read -r FILE
            do
                echo "Deleting files are: $FILE"
                rm -rf $FILE
                    echo "Files deleted: $FILE"
                done <<< $FILES
        else
            echo "Failed to create zip file"
            exit 1
        fi
else
    echo "No files Found older than $DAYS_AGO"
fi

###### HERE INPUT FOR WHILE LOOP IS $FILES






















