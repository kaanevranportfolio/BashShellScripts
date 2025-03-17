#!/bin/bash

# Remove Windows carriage return characters from the remhosts file
sed -i 's/\r$//' remhosts 

# Loop through each host in the remhosts file
for host in `cat remhosts`
do
    # Connect to the remote host and execute commands
    ssh devops@$host << 'EOF'
    hostname
    uptime
    echo "=============================="
    sudo yum install git -y
    echo "=============================="
EOF
done
