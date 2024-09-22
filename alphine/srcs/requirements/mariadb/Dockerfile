FROM alpine:3.19
# mariadb는 yml파일에 image로 있어서 빼도 될듯? 근데 순서때문에 넣은건가?
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client dumb-init \
    && rm -rf /var/cache/apk/*

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/configuration.sh .

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "./configuration.sh"]