#!/bin/bash

# this script counts the number of network interfaces on a system excluding loopback interface

NET_COUNT=$(ip add show | grep -iv loopback | grep -ic mtu)

if [ $NET_COUNT -eq 0 ]; then
    echo "No network interfaces found"
elif [ $NET_COUNT -eq 1 ]; then
    echo "There is 1 network interface"
else
    echo "There are $NET_COUNT network interfaces"
fi