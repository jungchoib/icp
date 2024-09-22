#!/bin/bash
#https://make.wordpress.org/cli/handbook/how-to/how-to-install/

# 스크립트의 시작을 알리는 shebang. bash 셸에서 실행됨을 나타냄.

# WordPress CLI 설치 가이드 링크
# https://make.wordpress.org/cli/handbook/how-to/how-to-install/

# wp-config.php 파일이 존재하지 않는 경우에만 실행
if [ ! -e "/var/www/html/wp-config.php" ]; then
    # /var/www/html 디렉토리를 생성 (존재하지 않을 경우)
    mkdir -p /var/www/html
    
    # /var/www/html 디렉토리로 이동
    cd /var/www/html
    
    # WordPress 코어 파일 다운로드
    wp core download --allow-root
    
    # wp-config.php 파일 생성
    # 데이터베이스 이름, 사용자, 비밀번호, 호스트 정보를 사용하여 설정
    wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --skip-check
    
    # WordPress 설치
    # URL, 사이트 제목, 관리자 사용자, 비밀번호, 이메일 정보를 사용하여 설치
    wp core install --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    
    # 추가 사용자 생성
    # 사용자 이름과 이메일, 비밀번호를 사용하여 새로운 WordPress 사용자 생성
    wp user create ${WP_USER} $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi

# PHP-FPM을 포그라운드 모드로 실행
/usr/sbin/php-fpm81 -F
