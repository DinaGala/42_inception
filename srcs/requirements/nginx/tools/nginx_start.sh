#!/bin/bash
#sleep 10

if [ ! -f /etc/ssl/wisdom.gpt.crt ]; then
	openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/ssl/wisdom.gpt.crt -keyout /etc/ssl/wisdom.gpt.key -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 Barcelona/CN=wisdom.gpt";
fi
exec "$@"