FROM debian:bullseye

# Copy your static site files to the NGINX web root
COPY ./tools /var/www/html

EXPOSE 8443

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]