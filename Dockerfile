<<<<<<< HEAD
FROM isaackuang/alpine-base:3.8.0
=======
FROM isaackuang/alpine-base:3.7.0
>>>>>>> de97b83cfe62f16a6e9c7ef977a79a2966e45189

RUN curl https://php.codecasts.rocks/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo 'http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@php https://php.codecasts.rocks/v3.8/php-7.2' >> /etc/apk/repositories && \
    apk --no-cache --progress add \
    wget curl git php php-curl php-openssl \
    php-json php-phar php-dom php-xml \
    php-ctype php-pcntl php-iconv php-mbstring php-tokenizer \
    php-xmlwriter php-tokenizer php7-yaml php-mongodb@php && \
    rm /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer


WORKDIR /var/www/html

ENTRYPOINT ["composer"]
