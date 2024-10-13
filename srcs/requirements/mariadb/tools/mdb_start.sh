#!/bin/bash

service mariadb start 

if [ ! -d /var/lib/mysql/${DB_NAME} ];
then
	echo "Building Database ${DB_NAME}"
    mysql -u ${DB_HOST} -p${DB_HOST_PWD} -e "CREATE DATABASE $DB_NAME;"
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
    echo "Database ${DB_NAME} is built."
fi

mysqladmin -u ${DB_HOST} -p${DB_HOST_PWD} shutdown

mysqld
