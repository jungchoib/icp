# FROM alpine:3.19

# RUN apk update && apk upgrade && apk add --no-cache nginx openssl dumb-init  \
#     && rm -rf /var/cache/apk/*

# COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
# COPY ./tools/configuration.sh .

# EXPOSE 443

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# CMD ["sh", "configuration.sh"]


# Debian Bullseye 이미지를 기반으로 하는 Dockerfile
FROM debian:bullseye

# 패키지 업데이트 및 Nginx, OpenSSL, dumb-init 설치
RUN apt-get update && apt-get upgrade -y \ # 패키지 목록 업데이트 및 업그레이드
    && apt-get install -y nginx openssl dumb-init \ # Nginx, OpenSSL, dumb-init 패키지 설치
    && apt-get clean \ # 설치 후 불필요한 패키지 캐시 정리
    && rm -rf /var/lib/apt/lists/* # APT 캐시 파일 삭제하여 이미지 크기 줄이기

# 로컬의 Nginx 설정 파일을 컨테이너의 Nginx 설정 경로로 복사
COPY ./conf/nginx.conf /etc/nginx/nginx.conf  # Nginx 설정 파일 경로 수정

# 로컬의 configuration.sh 스크립트를 컨테이너의 현재 작업 디렉토리로 복사
COPY ./tools/configuration.sh . 

# 컨테이너가 443 포트를 외부에 노출
EXPOSE 443

# 컨테이너 시작 시 dumb-init을 사용하여 프로세스 관리
ENTRYPOINT ["/usr/bin/dumb-init", "--"] # dumb-init을 사용하여 PID 1 프로세스 관리

# 컨테이너 시작 시 실행할 기본 명령어 설정
CMD ["sh", "configuration.sh"] # configuration.sh 스크립트를 실행


