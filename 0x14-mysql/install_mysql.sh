#!/usr/bin/env bash
#This script will install mysql 5.7 on my two servers

# Update package list
sudo apt-get update

# Install MySQL Server 5.7
sudo apt-get install -y mysql-server-5.7

# Secure the MySQL installation by running a script that prompts for a root password and configures other security settings.
sudo mysql_secure_installation

# Start MySQL service
sudo systemctl start mysql

# Enable MySQL to start on boot
sudo systemctl enable mysql
