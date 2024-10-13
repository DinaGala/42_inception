#!/bin/bash
if [ ! -f ${SS_CERT} ]; then
	openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/ssl/nzhuzhle.42.fr.crt -keyout /etc/ssl/nzhuzhle.42.fr.key -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 Barcelona/CN=nzhuzhle.42.fr";
fi
exec "$@"