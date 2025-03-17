#!/bin/bash

URL="https://www.tooplate.com/zip-templates/2127_little_fashion.zip"
ART_NAME="2127_little_fashion"
TMPDIR="/tmp/webfiles"

yum --help &> /dev/null
#if command above worked $? equals 0 and this is centos based
if [ $? -eq 0 ]; then
    echo "Running Setup on CentOS"
    PACKAGE="wget unzip httpd"
    SVC="httpd"
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
else
   echo "Running Setup on Ubuntu"
    PACKAGE="wget unzip apache2"
    SVC="apache2"
    # Update all packages
    ####################
    sudo apt update -y && sudo apt upgrade -y

    # Install wget, unzip, and httpd
    ####################
    sudo apt install $PACKAGE  -y 

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
fi