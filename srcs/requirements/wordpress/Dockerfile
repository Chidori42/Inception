FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-redis

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
CMD ["php-fpm7.4", "-F"]
