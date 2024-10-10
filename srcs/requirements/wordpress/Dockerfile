FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-zip \
    wget \
    curl \
    unzip \
    tar \
    mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/ 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
RUN chmod 755 /run/php

COPY start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/start.sh" ]