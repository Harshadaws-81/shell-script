#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If $3 is empty default is 14 days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <source> <destination> <days(optional)>"
}
# check source and destination are provided

if [ $# -lt 2 ]
then
    USAGE
fi
 
if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR does not exist please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES ]   # True if FILES is empty , '!' makes expression False
then 
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    # check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully Zipped files older than $DAYS"
        # Remove the files after zipping
        while IFS= read -r file #IFS , Internal Field Seperator
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else 
        echo "Zipping the files is Failed"
        exit 1
    fi
else
    echo "No Files older than $DAYS"
fi

