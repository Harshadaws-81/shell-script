#!/bin/bash

USERID=$(id -u)
N="\e[0m"
R="\e[31m"
G="\e[32m"
B="\e[34m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$B Please run the script with Root privileges $N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ...$R FAILED $N"
        exit 1
    else 
        echo -e "$2 is ...$G SUCCESS $N"
    fi
}

CHECK_ROOT

# git mysql postfix nginx
for PACKAGE in $@ 
do 
    dnf list installed $PACKAGE
    if [ $? -ne 0 ]
    then 
        echo "$PACKAGE is not installed.. going to install"
        dnf install $PACKAGE -y
        VALIDATE $? "Installing $PACKAGE"
    else
        echo "$PACKAGE is already installed .. nothing to do"
    fi

done