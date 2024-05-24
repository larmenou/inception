#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then

    /etc/init.d/mariadb start

    sleep 2
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; FLUSH PRIVILEGES;"

    killall mariadbd

    sleep 2

fi

mysqld