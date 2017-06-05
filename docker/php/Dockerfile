FROM php:5-fpm

MAINTAINER Tom Hanoldt<tom@creative-workflow.berlin>

RUN apt-get update && apt-get install -y php5-mysqlnd \
    && docker-php-ext-install mysql \
    && docker-php-ext-enable mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache

RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
  } > /usr/local/etc/php/conf.d/opcache-recommended.ini
