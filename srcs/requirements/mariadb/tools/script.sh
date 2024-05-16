# /usr/bin/mysqld_safe

# sleep 5
# mysql -h localhost -P 3306 --protocol=tcp -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -h localhost -P 3306 --protocol=tcp -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'127.0.0.1' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -h localhost -P 3306 --protocol=tcp -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; FLUSH PRIVILEGES;"

# killall mysqld
# sleep 3
# /usr/bin/mysqld_safe

./etc/init.d/mariadb start

sleep 5
mariadb -h localhost -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -h localhost -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'127.0.0.1' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -h localhost -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; FLUSH PRIVILEGES;"

killall mariadb
sleep 3
./etc/init.d/mariadb start