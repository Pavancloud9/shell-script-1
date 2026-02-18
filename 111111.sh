#!/bin/bash

USERID=$(id -u)
if [ $? -ne 0 ]
then
    echo "ERROR:: You must have sudo access to perform this action"
    exit 1
fi

