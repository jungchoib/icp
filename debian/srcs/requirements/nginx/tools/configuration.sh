#!/bin/sh

# SSL 디렉토리가 존재하지 않는 경우
if [ ! -d "/etc/nginx/ssl" ]; then
    # SSL 디렉토리 생성
    mkdir /etc/nginx/ssl
    
    # OpenSSL을 사용하여 새로운 SSL 인증서와 키 생성
    openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
            -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Student/CN=junghych" \
            -keyout /etc/nginx/ssl/junghych.key -out /etc/nginx/ssl/junghych.crt
    
    # Nginx의 런타임 디렉토리 생성 (없을 경우)
    mkdir -p /run/nginx
fi

# Nginx를 포그라운드에서 실행하여 로그를 콘솔에 출력
nginx -g "daemon off;"
