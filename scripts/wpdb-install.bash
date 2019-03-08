#!/bin/bash

[ -z "$1" ] && { echo "Database not set"; exit; }
[[ ! $1 =~ ^[-_a-zA-Z0-9]+$ ]] && { echo "Database name must be alphanumeric"; exit; }
[ -z "$2" ] && { echo "Username not set"; exit; }
[[ ! $2 =~ ^[-_a-zA-Z0-9]+$ ]] && { echo "Username name must be alphanumeric"; exit; }

PASS=$(pwgen -s 40 1 -y -r \`\"\'\/\\ -c -n)

mysql -uroot -p <<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$2'@'localhost' IDENTIFIED WITH mysql_native_password BY '$PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL batabase and user created."
echo "Database:   $1"
echo "Username:   $2"
echo "Password:   $PASS"

sed -i "s/database_name_here/$1/g" /var/www/html/wp-config.php
sed -i "s/username_here/$2/g" /var/www/html/wp-config.php
sed -i "s/password_here/$PASS/g" /var/www/html/wp-config.php
