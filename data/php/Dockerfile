FROM php:5-fpm
RUN apt-get update && apt-get install -y \
    && docker-php-ext-install mysql \
    && docker-php-ext-enable mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli
