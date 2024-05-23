FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    php7.4 \
    php7.4-fpm \
    php-mysqli \
    curl

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY tools/script.sh .

RUN chmod +x script.sh

EXPOSE 9000

CMD [ "./script.sh" ]