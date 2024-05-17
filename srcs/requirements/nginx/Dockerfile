FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y \
    && mkdir /etc/nginx/ssl \
    && apt install openssl -y \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/larmenou.crt \
    -keyout /etc/nginx/ssl/larmenou.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=larmenou.42.fr/UID=larmenou"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
