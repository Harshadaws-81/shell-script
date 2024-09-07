#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If $3 is empty default is 14 days

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

