#!/bin/bash

USERID=$(id -u)
#echo "User Id is : $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Command is ... FAILED"
        exit 1
    else 
        echo "Command is ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges"
    exit 1
fi

dnf list installed git 

VALIDATE $?

# if [ $? -ne 0 ]
# then
#     echo "Git is not Installed ... going to Install"
#     dnf install git -y
#     if[ $? -ne 0 ]
#     then
#         echo "GIT Installation is FAILURE.. Please check"
#         exit 1
#     else
#         echo "GIT Installation is SUCCESS..."
#     fi
# else
#     echo "Git is already Installed nothing to do..."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "MYSQL is not Installed .... Going to install"
#     dnf install mysql -y
#     if  [ $? -ne 0 ]
#     then 
#         echo "MYSQL installation is FAILURE.. Please check"
#         exit 1
#     else 
#         echo "MYSQL insatllation is SUCCESSS.."
#     fi
# else
#     echo "MYSQL is already Installed .. Nothing to do"
# fi
