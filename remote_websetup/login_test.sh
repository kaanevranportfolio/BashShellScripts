#!/bin/bash
sed -i 's/\r$//' remhosts # Remove windows carriage return

for host in `cat remhosts`
 do
    ssh devops@$host hostname; uptime
    echo "=============================="
    sudo yum install git -y
    echo "=============================="
done
