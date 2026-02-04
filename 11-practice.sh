#!/bin/bash

USERID=$(id -u)

if [ $? -ne 0 ]
then
    echo "ERROR:: You must have sudo access to run this script"
    exit 1
fi

###############################

PACKAGE() {            ########## FUNCTION
    if [ $1 -ne 0 ] 
    then
        echo "Installing $2...FAILURE"
    else
        echo "Installing $2...SUCCESS"
    fi
}

################################

dnf list installed mysql
if [ $? -ne 0 ]
    PACKAGE $? "Installing mysql"
then
    dnf install mysql -y
else
    echo "MYSQL ALREADY INSTALLED...SKIPPING"
fi

###############################

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    FUNCTION $? "Installing git"
else
    echo "GIT IS ALREADY INSTALLED"
fi

