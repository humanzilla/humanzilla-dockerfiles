FROM php:5.6-apache
MAINTAINER Mario César Señoranis Ayala <mariocesar.c50@gmail.com>

ENV TERM screen-256color
ENV DEBIAN_FRONTEND=noninteractive

RUN a2enmod rewrite

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y -q \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl3-dev \
        libxml2-dev \
    && docker-php-ext-install \
        iconv \
        mcrypt \
        curl \
        dom \
        hash \
        tokenizer \
        mbstring \
        json \
        ftp \
        date \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \

VOLUME ["/var/www/html", "/var/log/apache2"]
