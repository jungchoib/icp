#!/bin/sh

if [ ! -e "/run/mysqld/mysqld.sock" ]; then
    #https://mariadb.com/kb/en/mariadb-install-db/
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
    mkdir -p /run/mysqld
    # 프로세스 실행은 현재user(root로)하지만
    # 시스템서비스 관리도구(service, mysql, mysqladmin)는 해당 사용자 권한으로 실행된다 ->이것은 DB접근권한 문제까지 가능
    # mysql -uroot는 root권한으로 접속하는거지만 mysql이 user권한이라 user권한을 이용해서 root권한에 접속한 느낌이라 DB접근권한 문제가 발생 할 수 있다.
    mysqld &
    # service mariadb start: 시스템 서비스 관리 도구로 DB가 초기화 되어있다면 DB를 찾지 못해서 불가능하다

    #https://stackoverflow.com/questions/25503412/how-do-i-know-when-my-docker-mysql-container-is-up-and-mysql-is-ready-for-taking
        #https://dev.mysql.com/doc/refman/8.4/en/mysqladmin.html
        #mysqladmin --wait --connect-timeout=1 ping로도 비슷한데 왜 안됨?
    while ! mysqladmin ping; do
        sleep 1
    done

    mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
    mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown
fi

exec mysqld