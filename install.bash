#!/bin/bash

# Install required packages
yum update -y
yum install wget -y
yum install nano -y
rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install pwgen -y
wget http://repo.mysql.com/mysql80-community-release-el7-2.noarch.rpm
yum localinstall mysql80-community-release-el7-2.noarch.rpm -y
rm -f mysql80-community-release-el7-2.noarch.rpm
yum install httpd
yum install php php-mysql -y
yum install mysql-server -y

# Start webserver services
systemctl start httpd mysqld

# Load in external content
wget -O /etc/motd https://raw.githubusercontent.com/codecomp/rhel7-setup/master/motd
mkdir /scripts
wget -O /scripts/wpdb-install.bash https://raw.githubusercontent.com/codecomp/rhel7-setup/master/scripts/wpdb-install.bash

# Allow ec2-user write access to the html directry if the user exists
id -u ec2-user > /dev/null 2>&1 && chown -R ec2-user /var/www/html

# Install WordPress
cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rmdir wordpress/
rm -f latest.tar.gz readme.html license.txt
mv wp-config-sample.php wp-config.php
