FROM isaackuang/alpine-base:3.7

RUN echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo 'http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk --no-cache --progress add \
    wget curl git php7 php7-curl php7-openssl \
    php7-json php7-phar php7-dom php7-xml \
    php7-ctype php7-pcntl php7-iconv php7-mbstring php7-tokenizer \
    php7-xmlwriter php7-tokenizer php7-yaml && \
    rm /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer


WORKDIR /var/www/html

ENTRYPOINT ["composer"]
