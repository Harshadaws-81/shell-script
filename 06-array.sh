#!/bin/bash

# index starts from 0 and the size is 5

Brands=("addidas" "nike" "urbon monkey" "levis" "bmw") # array

echo "First Brand is : ${Brands[0]}"
echo "Second Brand is : ${Brands[1]}"
echo "Third Brand is : ${Brands[2]}"
echo "Fourth Brand is : ${Brands[3]}"
echo "Fifth Brand is : ${Brands[4]}"

echo "Name of Brands : ${Brands[@]}"
