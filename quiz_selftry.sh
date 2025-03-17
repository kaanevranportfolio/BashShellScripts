#!/bin/bash
echo "Bash version ${BASH_VERSION}"
for i in {0..10..2}
    do  #do was missing in the original script
        echo "Welcome $i times"
    done