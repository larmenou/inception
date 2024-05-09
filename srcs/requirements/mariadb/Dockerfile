FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init.sql /etc/mysql/init.sql

COPY tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]

# EXPOSE 3306

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY tools/script.sh /etc/mysql/start.sh

# RUN chmod 777 /etc/mysql/start.sh

# CMD /etc/mysql/start.sh