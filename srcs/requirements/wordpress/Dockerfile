FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-redis

# Set working directory
WORKDIR /var/www/html

# Expose the PHP-FPM port (9000)
EXPOSE 9000

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
CMD ["php-fpm7.4", "-F"]
