#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 
 
dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "installing mysql..Failure"
    exit 1 
else
    echo "install mysql..success"

dnf install gittt -y
if [ $? -ne 0 ]
then
    echo "installing git..Failure"
    exit 1 
else
    echo "install mysql..success"
 