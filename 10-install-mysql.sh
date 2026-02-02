#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 

dnf list installed mysql  
if [ $? -ne 0 ]   ### Not installed
then
    dnf install mysql -y
    if [ $? -ne 0 ]  # 0 KI 0 EQUAL AVAKAPOTHE
    then
        echo "installing mysql..Failure"
        exit 1 
    else
        echo "install mysql..success"
    fi
else
    echo "Mysql already installed..skipping"
fi
  


# dnf list installed git
#     if [ $? -ne 0 ]

# dnf install gitt -y
# if [ $? -ne 0 ]
# then
#     echo "installing git..Failure"
#     exit 1 
# else
#     echo "install mysql..success"
#  fi