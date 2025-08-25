FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld


COPY  50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY  scrept.sh /

RUN chmod +x scrept.sh 
ENTRYPOINT [ "./scrept.sh" ]