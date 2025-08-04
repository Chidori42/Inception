FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    wordpress && \
    apt-get clean


CMD ["wordpress", "-g", "daemon off;"]
