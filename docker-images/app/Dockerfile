FROM php:7.1-apache
MAINTAINER George Dimosthenous

RUN apt-get update \
    && apt-get install -y \
    libmcrypt-dev \
    libpng-dev \
    libgmp-dev \
    libzip-dev \
    libc-client-dev \
    libkrb5-dev \
    libldap2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev

RUN apt-get clean \
    && apt-get -y autoremove

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure gd --with-freetype-dir \
    && docker-php-ext-install gd \
    && docker-php-ext-install gmp \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install zip \
    && docker-php-ext-install ldap \
    && docker-php-ext-install pcntl

COPY config/apache2/sites-available/sugar.docker.com.conf "$APACHE_CONFDIR/sites-available/sugar.docker.com.conf"
COPY config/php/php.ini "$PHP_INI_DIR/php.ini"
COPY config/apache2/certificates/sugar.docker.com.crt /etc/ssl/certs/sugar.docker.com.crt
COPY config/apache2/certificates/sugar.docker.com.key /etc/ssl/private/sugar.docker.com.key

RUN a2enmod headers expires rewrite ssl \
    && a2dissite 000-default \
    && a2ensite sugar.docker.com  

RUN adduser sugar --disabled-password --disabled-login --gecos ""

WORKDIR "/var/www/html/sugarcrm"