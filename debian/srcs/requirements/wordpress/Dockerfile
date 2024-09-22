# FROM alpine:3.19

# RUN apk update && apk upgrade && apk add --no-cache php81 php81-json \
#     php81-mysqli php81-curl php81-dom php81-exif php81-pecl-imagick \
#     php81-pecl-igbinary php81-intl php81-mbstring php81-openssl \
#     php81-xml php81-zip php81-phar php81-fpm curl dumb-init \
#     && rm -rf /var/cache/apk/*

# COPY ./tools/configuration.sh .

# #https://developer.wordpress.org/apis/wp-config-php/
# RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf && \
#     sed -i "s|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g" /etc/php81/php.ini

# #https://make.wordpress.org/cli/handbook/guides/installing/#recommended-installation
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# RUN ln -s /usr/bin/php81 /usr/bin/php

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# CMD ["sh", "./configuration.sh"]

# Debian Bullseye 이미지를 기반으로 하는 Dockerfile
FROM debian:bullseye

# 패키지 업데이트 및 PHP 7.4 및 관련 패키지 설치  php7.4-openssl제거
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php7.4 php7.4-json php7.4-mysqli php7.4-curl php7.4-dom \
    php7.4-exif php7.4-imagick php7.4-igbinary php7.4-intl \
    php7.4-mbstring php7.4-xml php7.4-zip \
    php7.4-phar php7.4-fpm curl dumb-init \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 로컬의 configuration.sh 스크립트를 컨테이너의 현재 작업 디렉토리로 복사
COPY ./tools/configuration.sh .

# PHP-FPM 설정 수정
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i "s|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g" /etc/php/7.4/fpm/php.ini

# PHP 7.4 바이너리에 대한 심볼릭 링크 생성
RUN [ -e /usr/bin/php ] && rm /usr/bin/php; ln -s /usr/bin/php7.4 /usr/bin/php

# WP-CLI 설치
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# # PHP 7.4 바이너리에 대한 심볼릭 링크 생성
# RUN ln -s /usr/bin/php7.4 /usr/bin/php

# 컨테이너 시작 시 dumb-init을 사용하여 프로세스 관리
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# 컨테이너 시작 시 실행할 기본 명령어 설정
CMD ["sh", "./configuration.sh"]
