#!/bin/bash

sudo yum update -y
sudo yum install wget unzip httpd -y 

sudo systemctl start httpd
sudo systemctl enable httpd

mkdir -p /tmp/webfiles
cd /tmp/webfiles || exit

wget https://www.tooplate.com/zip-templates/2127_little_fashion.zip
unzip 2127_little_fashion.zip
sudo cp -r 2127_little_fashion/* /var/www/html/

sudo systemctl restart httpd

rm -rf /tmp/webfiles

