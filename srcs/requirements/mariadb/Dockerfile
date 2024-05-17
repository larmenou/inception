FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh .

RUN  mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld \
    && chmod +x script.sh \
    && chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "sh", "./script.sh" ]

# CMD [ "/etc/init.d/mariadb", "start" ]