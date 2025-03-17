#!/bin/bash
#This script prints system info

cat <<EOF
Welcome to bash script.
uptime is: $(uptime)
Memory usage is: $(free -m)
Disk usage is: $(df -h)
EOF

