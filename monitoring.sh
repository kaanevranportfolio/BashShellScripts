#!/bin/bash
# This script is used to monitor a service

echo "#############################################"

date
ls /var/run/httpd/httpd.pid &> /dev/null # even if it runs successfully, it will not show any output

if [ $? -eq 0 ]; then
  echo "httpd is running"
else 
  echo "httpd is NOT running"
  echo "Starting httpd service"
  systemctl start httpd
  if [ $? -eq 0 ]; then
    echo "httpd service has been started"
  else
    echo "httpd service could not be started"
  fi
fi
echo "#############################################"
echo