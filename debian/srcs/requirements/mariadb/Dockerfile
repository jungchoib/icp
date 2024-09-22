# Dockerfile: MariaDB 서비스를 위한 Docker 이미지를 정의합니다.

# FROM debian:bullseye

# # 패키지 업데이트 및 MariaDB, MariaDB 클라이언트, dumb-init 설치
# RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client dumb-init \
#     && rm -rf /var/cache/apk/*  # 불필요한 캐시 파일 삭제하여 이미지 크기 줄이기

# # 설정 파일 및 스크립트 복사
# COPY ./conf/my.cnf /etc/my.cnf  # MariaDB 설정 파일을 컨테이너에 복사
# COPY ./tools/configuration.sh .  # 초기화 스크립트를 컨테이너에 복사

# EXPOSE 3306  # MariaDB의 기본 포트인 3306을 외부에 노출

# # dumb-init을 사용하여 ENTRYPOINT 설정
# ENTRYPOINT ["/usr/bin/dumb-init", "--"]  # dumb-init을 사용하여 자식 프로세스의 PID 1 역할을 수행
# CMD ["sh", "./configuration.sh"]  # 컨테이너 시작 시 실행할 기본 명령어


# MariaDB 서비스를 위한 Docker 이미지를 정의합니다.
FROM debian:bullseye

# 패키지 업데이트 및 MariaDB, MariaDB 클라이언트, dumb-init 설치
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client dumb-init \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # 불필요한 캐시 파일 삭제하여 이미지 크기 줄이기

# 설정 파일 및 스크립트 복사
COPY ./conf/my.cnf /etc/mysql/my.cnf  # MariaDB 설정 파일을 컨테이너에 복사
COPY ./tools/configuration.sh /usr/local/bin/configuration.sh  # 초기화 스크립트를 컨테이너에 복사

# 실행 권한 부여
RUN chmod +x /usr/local/bin/configuration.sh  # 스크립트에 실행 권한 부여

EXPOSE 3306  # MariaDB의 기본 포트인 3306을 외부에 노출

# dumb-init을 사용하여 ENTRYPOINT 설정
ENTRYPOINT ["/usr/bin/dumb-init", "--"]  # dumb-init을 사용하여 자식 프로세스의 PID 1 역할을 수행
CMD ["sh", "/usr/local/bin/configuration.sh"]  # 컨테이너 시작 시 실행할 기본 명령어
