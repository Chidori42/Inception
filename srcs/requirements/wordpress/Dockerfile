FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-redis

COPY wp-config.php /var/www/wordpress/
RUN chown www-data:www-data /var/www/wordpress/wp-config.php

WORKDIR /var/www/wordpress

CMD ["php-fpm7.4", "-F"]
