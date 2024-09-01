#!/bin/bash

USERID=$(id -u)
N="\e[0m"
R="\e[31m"
G="\e[32m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with Root privileges"
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

dnf list installed git 

if [ $? -ne 0 ]
then
    echo "Git is not Installed ... going to Install"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already Installed nothing to do..."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not Installed .... Going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already Installed .. Nothing to do"
fi
