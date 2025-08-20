#!/bin/bash

#Load varibles from enviroment

#get config file
CONFIG_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"

#start with custom configuration
mysqld_safe --defaults-file=$CONFIG_FILE &

#Wait mariadb to start
echo "Wait Mariad Stating... '$MYSQL_ROOT_PASSWORD'"
sleep 10

#Create DataBase User
mysql -u root -p"$MYSQL_ROOT_PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGEs;
EOF

echo "Database '$MYSQL_DATABASE' and user '$MYSQL_USER' created."

