FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-redis \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp 

WORKDIR /var/www/wordpress

COPY wp-config.sh /

RUN chmod +x /wp-config.sh
RUN /wp-config.sh
RUN which wp && wp --info

# CMD ["php-fpm", "-F"]
