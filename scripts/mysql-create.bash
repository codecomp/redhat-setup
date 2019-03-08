PASS=`pwgen -s 40 1 -c -n -y`

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$2'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL batabase and user created."
echo "Database:   $1"
echo "Username:   $2"
echo "Password:   $PASS"
