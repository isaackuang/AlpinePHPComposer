FROM isaackuang/alpine-base:3.8.0


RUN apk add --update curl ca-certificates && \
    curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    echo "@php https://php.codecasts.rocks/v3.8/php-7.2" >> /etc/apk/repositories && \
    apk --no-cache --progress add \
    wget curl git php7@php php7-cli@php php7-curl@php php7-openssl@php \
    php7-json@php php7-phar@php php7-dom@php php7-xml@php \
    php7-ctype@php php7-pcntl@php php7-iconv@php php7-mbstring@php php7-tokenizer@php \
    php7-xmlwriter@php php7-mongodb@php php7-simplexml@php php7-yaml && \
    rm /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer


WORKDIR /var/www/html

ENTRYPOINT ["composer"]
