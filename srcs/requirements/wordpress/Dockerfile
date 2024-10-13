FROM debian:bullseye

USER root
RUN apt-get update && apt-get install -y php7.4-fpm php7.4-mysqli curl mariadb-client && rm -rf /var/lib/apt/lists/*

USER root
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/ 

USER root
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

USER root
RUN mkdir -p /run/php
RUN chmod 755 /run/php

USER root
COPY ./tools/start.sh /usr/local/bin/
USER root
RUN chmod 755 /usr/local/bin/start.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/start.sh" ]