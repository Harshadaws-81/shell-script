#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e "$SOURCE_DIR $R doesnot exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files: $FILES"
# don't use line , it is a reserve word
 while IFS= read -r file  # IFS , Internal Field Seperator , empty it will ignore while spaces , -r is for not to ignore special chars (&,/,\...)
 do 
    echo "Deleting file: $file"
    rm -rf $file
 done <<< $FILES
