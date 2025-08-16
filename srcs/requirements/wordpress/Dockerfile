FROM debian:bullseye

RUN apt-get update && apt-get install && apt install -y curl git wget php php-fpm php-mysql php-redis


CMD ["wordpress", "-g", "daemon off;"]
