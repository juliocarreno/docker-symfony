FROM php:7.2-apache

LABEL maintainer="Julio Carreño"

RUN apt-get update -y \
    && apt-get install -y curl \
    && apt-get install -y git zip bzip2 wget tar less \
    && apt-get install -y libjpeg-dev libpng-dev \ 
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443    