FROM debian:bullseye

RUN apt-get update && apt-get upgrade &&\
    apt-get install -y mariadb-server

CMD ["mariadb", "-g", "daemon off;"]
