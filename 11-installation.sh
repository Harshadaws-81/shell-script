#!/bin/bash

USERID=$(id -u)
#echo "User Id is : $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges"
    exit 1
fi

dnf install git -y
