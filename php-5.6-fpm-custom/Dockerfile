FROM php:5.6-fpm

# Install modules
RUN apt-get update && apt-get install -y \
		libpq-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN docker-php-ext-install mcrypt

RUN docker-php-ext-install pdo pdo_pgsql

ADD php.ini-development /usr/local/lib/php.ini

CMD ["php-fpm"]
