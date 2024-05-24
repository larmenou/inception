#!/bin/bash

# Attendre que la base de données soit prête
sleep 5

cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp;

    wp core download --allow-root

    wp config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb --allow-root
    wp core install --url=larmenou.42.fr --title=inception --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
    wp user create ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root

fi

php-fpm7.4 -F