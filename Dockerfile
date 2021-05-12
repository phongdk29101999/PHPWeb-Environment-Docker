FROM ubuntu:18.04

## set noniteractive mode
ENV  DEBIAN_FRONTEND=noninteractive

## install nginx, supervisor and other necessary tools
RUN apt-get update && apt-get -y install \
    nginx \
    supervisor \
    cron \
    curl \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## install php and related modules
RUN apt-get update && apt-get -y install \
    php \
    php-cli \
    php-curl \
    php-fpm \
    php-gd \
    php-intl \
    php-mbstring \
    php-mysqlnd \
    php-opcache \
    php-pdo \
    php-pear \
    php-sqlite3 \
    php-zip \
    php-xml \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## add user "nginx" to nginx
RUN useradd --shell /sbin/nologin nginx

## copy config files
COPY files/etc  /etc

RUN mkdir -p /var/tmp/logs \
    && mkdir -p /var/tmp/cache/persistent \
    && mkdir -p /var/tmp/cache/models \
    && mkdir -p /var/tmp/tmp \
    && touch /var/tmp/$(date +%s) \
    && touch /var/tmp/logs/php-fpm-www-error.log \
    && chmod -R 777 /var/tmp \
    && mkdir /tmp/opcache && chmod 777 /tmp/opcache \
    && mkdir /tmp/session && chmod 777 /tmp/session \
    && mkdir /tmp/wsdlcache && chmod 777 /tmp/wsdlcache \
    && mkdir /run/php-fpm && chmod 777 /run/php-fpm

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

