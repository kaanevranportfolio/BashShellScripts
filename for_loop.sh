#!/bin/bash

LIST="java .net python ruby"

for VAR in $LIST
do
    echo "value of VAR is $VAR."
    sleep 1
    date
done

