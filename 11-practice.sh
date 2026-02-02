#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must have sudo access to run this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Installing mysql...FAILURE"
        exit 1
    else
        echo "Installing mysql..SUCCESS"
    fi
else
    echo "Mysql already installed...SKIPPING"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
then
    echo "Installing Git..FAILURE"
else
    echo "Installing Git..SUCCESS"
    fi
else
    echo "Git already installed...SKIPPING"
fi