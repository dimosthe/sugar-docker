FROM php:7.1-cli
MAINTAINER George Dimosthenous

RUN apt-get update \
    && apt-get install -y \ 
    cron \
    procps \
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

COPY config/php/php.ini "$PHP_INI_DIR/php.ini"

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh 

WORKDIR "/var/www/html/sugarcrm"

CMD ["/usr/local/bin/entrypoint.sh"]