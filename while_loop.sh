#!/bin/bash

# Example of a while loop in bash
counter=0

# while true => infinite loop
while [ $counter -lt 5 ]
do
    echo "Counter: $counter"
    ((counter++))
    #counter=$((counter + 1))
done