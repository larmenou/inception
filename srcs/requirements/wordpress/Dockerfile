FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    curl

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]

# RUN apt-get -y install wget

# RUN apt-get install -y php7.3\
# php-fpm\
# php-mysql\
# mariadb-client

# RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.5-fr_FR.tar.gz && rm wordpress-6.5-fr_FR.tar.gz

# RUN chown -R root:root /var/www/wordpress