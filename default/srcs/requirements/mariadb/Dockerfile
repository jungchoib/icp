FROM alpine:3.19

ENV http_proxy=8.8.8.8
ENV https_proxy=http:8.8.4.4

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client dumb-init \
    && rm -rf /var/cache/apk/*

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/configuration.sh .

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "./configuration.sh"]