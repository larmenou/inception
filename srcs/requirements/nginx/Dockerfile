FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y && mkdir /etc/nginx/ssl && apt install openssl -y && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=larmenou.42.fr/UID=larmenou"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# a supprimer /  commenter
#COPY tools/index.html /var/www/html

CMD ["nginx", "-g", "daemon off;"]

# RUN mkdir -p /var/run/nginx

# COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html

# RUN chown -R www-data:www-data /var/www/html