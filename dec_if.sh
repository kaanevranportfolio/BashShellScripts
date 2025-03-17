#!/bin/bash

read -p "Enter a number: " NUM

echo 

if [ $((NUM % 2)) -eq 0 ]
then
     echo "Number is even"
     sleep 3
else
     echo "Number is odd"
fi

if [ $NUM -lt 20 ]; then
    echo "less than 20"
elif [ $NUM -gt 50 ]; then
    sleep 2
    echo "greater than 50"
else
    echo "between 20 and 50"
fi
