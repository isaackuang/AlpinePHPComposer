FROM isaackuang/alpine-base:3.10


RUN apk add --update curl ca-certificates && \
    curl https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    echo "https://dl.bintray.com/php-alpine/v3.10/php-7.4" >> /etc/apk/repositories && \
    apk --no-cache --progress add \
    g++ gcc make zlib-dev wget autoconf curl git \
    php7 php7-curl php7-openssl php7-gd php7-xmlreader php7-zip \
    php7-json php7-phar php7-dom php7-session php7-pdo \
    php7-ctype php7-pcntl php7-iconv php7-mbstring php7-dev php7-pear \
    php7-mongodb php7-redis php7-posix php7-pcntl php7-zlib && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    rm /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    cd /usr/bin && wget -O phpunit https://phar.phpunit.de/phpunit-8.phar && \
    chmod +x phpunit


WORKDIR /var/www/html

ENTRYPOINT ["composer"]
