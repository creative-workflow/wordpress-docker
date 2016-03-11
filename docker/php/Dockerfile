FROM php:5-fpm

MAINTAINER Tom Hanoldt<tom@creative-workflow.berlin>

RUN apt-get update && apt-get install -y php5-mysqlnd \
    && docker-php-ext-install mysql \
    && docker-php-ext-enable mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli
