#!/bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2..SUCCESS"
    fi
}


if [ $USERID -ne 0 ]
then
    echo "You must have sudo access to run this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Instaling mysql"
    
else
    echo "Mysql already installed...SKIPPING"
fi

####################################

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "Git already installed...SKIPPING"
fi