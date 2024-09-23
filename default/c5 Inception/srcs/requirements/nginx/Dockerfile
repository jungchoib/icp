FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx openssl dumb-init  \
    && rm -rf /var/cache/apk/*

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY ./tools/configuration.sh .

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "configuration.sh"]