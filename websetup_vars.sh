#!/bin/bash
PACKAGE="wget unzip httpd"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2127_little_fashion.zip"
ART_NAME="2127_little_fashion"
TMPDIR="/tmp/webfiles"
# Update all packages
####################
sudo yum update -y

# Install wget, unzip, and httpd
####################
sudo yum install $PACKAGE  -y 

# Start and enable httpd service
####################
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Create a temporary directory for web files
####################
mkdir -p $TMPDIR
cd $TMPDIR || exit

# Download and unzip the website template
####################
wget $URL
unzip $ART_NAME.zip

# Copy the website files to the Apache root directory
####################
sudo cp -r $ART_NAME/* /var/www/html/

# Restart the httpd service
####################
sudo systemctl restart $SVC

# Clean up the temporary directory
####################
rm -rf $TMPDIR
sudo systemctl stop firewalld
