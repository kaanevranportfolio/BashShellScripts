#!/bin/bash

FREE_RAM=`free -m | grep Mem | awk '{print $4}'`
echo "Free RAM: $FREE_RAM MB"