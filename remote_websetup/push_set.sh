#!/bin/bash

sed -i 's/\r$//' remhosts # Remove windows carriage return

for host in `cat remhosts`
do
    echo "Copying files to $host"
    scp ./multios_websetup.sh devops@$host:~
    ssh devops@$host <<EOF
    cd
    sudo ./multios_websetup.sh
EOF
#or
#    ssh devops@$host "cd; sudo ./multios_websetup.sh"
# if line is long 
#ssh devops@$host "cd; \
#sudo ./multios_websetup.sh"
done