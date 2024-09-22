#!/bin/sh

# MariaDB 소켓 파일이 존재하지 않는 경우 초기화 수행
if [ ! -e "/run/mysqld/mysqld.sock" ]; then
#https://mariadb.com/kb/en/mariadb-install-db/
    # MariaDB 데이터베이스 초기화
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

    # mysqld 소켓 디렉토리 생성
    mkdir -p /run/mysqld
# chown mysql:mysql /run/mysqld  # 소켓 디렉토리의 소유자 설정
    mysqld &  # mysqld를 백그라운드에서 실행

#https://stackoverflow.com/questions/25503412/how-do-i-know-when-my-docker-mysql-container-is-up-and-mysql-is-ready-for-taking
    # MariaDB가 준비될 때까지 대기
    while ! mysqladmin ping; do
        sleep 1
    done

    # 루트 사용자 비밀번호 설정
    mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    
    # 사용자 및 데이터베이스 생성
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

    # mysqld 종료
    mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown
fi

# mysqld를 포그라운드에서 실행
exec mysqld
