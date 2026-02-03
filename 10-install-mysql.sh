#!/bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]  
    then
        echo "installing mysql..Failure"
        exit 1 
    else
        echo "install mysql..success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 

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
    VALIDATE $? "Installing Git"
else
    echo "GIT already installing...SKIPPING"
fi