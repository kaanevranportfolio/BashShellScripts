#!/bin/bash

USERS="user1 user2 user3 user4 user5"

for usr in $USERS
do
    echo "#######################"
    echo "Adding User: $usr"
    sleep 1
    adduser $usr
    id $usr
    echo "#######################"
done