#!/bin/sh

if [ ! -d "/etc/nginx/ssl" ]; then
    mkdir /etc/nginx/ssl
    openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
            -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Student/CN=subinlee" \
            -keyout /etc/nginx/ssl/subinlee.key -out /etc/nginx/ssl/subinlee.crt
    mkdir -p /run/nginx
fi

nginx -g "daemon off;"