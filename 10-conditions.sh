#!/bin/bash

#NUMBER=$1
#if [ $NUMBER -gt 20 ] # gt(>)  lt(<)  eq(=)  -ne(!=)
#then 
#   echo "Given number: $NUMBER is greater than 20"
#else
#    echo "Given number : $NUMBER is less than 20"
#fi


NUMBER=$1
if[ $NUMBER -eq 18 ]
then
    echo "Given number : $NUMBER is equal to 18"
else
    echo "Given number : $NUMBER is not equal to 18"
fi
