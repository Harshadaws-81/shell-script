#!/bin/bash

LOGS_FOLDER="/var/log/shell_script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run the script with root privileges $N" &>>$LOG_FILE 
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R FAILED $N" &>>$LOG_FILE
        exit 1
    else 
        echo -e "$2 is... $G SUCCESS $N" &>>$LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh - PACKAGE1 PACKAGE2 PACKAGE3..."
    exit 1
}

echo "Script started executing at: $(date)" &>>$LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then 
    USAGE
fi

for PACKAGE in $@ # $@ refers to all arguments passed through to it
do
    dnf list installed $PACKAGE &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then 
        echo -e "$PACKAGE $R is not installed... $N going to install" &>>$LOG_FILE
        dnf install $PACKAGE -y &>>$LOG_FILE
        VALIDATE $? "Installing $PACKAGE"
    else
        echo -e "$PACKAGE $Y is already installed ... $N nothing to do" &>>$LOG_FILE
    fi
done

