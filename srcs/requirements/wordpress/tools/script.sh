#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


php-fpm7.4 -F

# wp config create	--allow-root \
# 	--dbname=${SQL_DATABASE} \
# 	--dbuser=${SQL_USER} \
# 	--dbpass=${SQL_PASSWORD} \
# 	--dbhost=mariadb --path='/var/www/wordpress'

#php-fpm7.4 -F
# /usr/sbin/php-fpm7.4 -F