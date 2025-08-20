#!/bin/bash

service mariadb start
#get config file
CONFIG_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"

#start with custom configuration
mysqld_safe --defaults-file=$CONFIG_FILE &

#Wait mariadb to start
echo "Wait Mariad Stating... '$MYSQL_ROOT_PASSWORD'"
sleep 10

#Create DataBase User
mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
mysql -e "FLUSH PRIVILEGES;"

echo "Database '$MYSQL_DATABASE' and user '$MYSQL_USER' created."

service mariadb stop
exec mysqld_safe

