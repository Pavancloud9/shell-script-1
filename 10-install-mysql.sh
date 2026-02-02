#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then
    echo "ERROR:: You must have SUDO access to execute"
    exit 1
fi 
    dnf install mysqll -y
 