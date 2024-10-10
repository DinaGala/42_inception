FROM debian:bullseye

RUN apt -y update && apt -y upgrade && \
    apt install -y nginx && \
    apt install -y openssl

COPY ./nginx_start.sh /var/www/.
COPY ./nginx.conf /etc/nginx/sites-enabled/default

RUN chmod +x /var/www/nginx_start.sh

EXPOSE 443

ENTRYPOINT [ "/var/www/nginx_start.sh" ] # or add also "/bin/bash"

CMD ["nginx", "-g", "daemon off;"]