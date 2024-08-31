#!/bin/bash

NUMBER=$1
if [ $NUMBER -lt 20 ] # gt(>)  lt(<)  eq(=)  -ne(!=)
then 
   echo "Given number: $NUMBER is less than 20"
else
    echo "Given number : $NUMBER is greater than 20"
fi



