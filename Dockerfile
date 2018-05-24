FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:ondrej/php

RUN apt-get -y install \
        curl \
        bash \
        nginx \
        php7.1 \
        php7.1-cli \
        php7.1-common \
        php7.1-fpm \
        php7.1-pdo-mysql\
        php7.1-dom \
        php7.1-xml \
        php7.1-iconv \
        php7.1-curl \
        php7.1-mcrypt \
        php7.1-soap \
        php7.1-gd \
        php7.1-ctype \
        php7.1-json \
        php7.1-bcmath \
        php7.1-intl \
        php7.1-mbstring \
        php7.1-redis \
        php7.1-xdebug

ARG APP_ENV=local
ARG BUILD_PATH=.

# START
COPY docker/start.sh /start.sh
RUN chmod +x /start.sh

# PHP-FPM 7.1
COPY docker/configs/php-fpm/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
COPY docker/configs/php-fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
RUN mkdir -p /run/php/ && touch /run/php/php7.1-fpm.sock

# NGINX
EXPOSE 80
COPY docker/configs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/configs/nginx/conf.d/$APP_ENV.conf /etc/nginx/conf.d/default.conf

# XDEBUG
COPY docker/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini

# BUILD
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN mkdir -p /var/www/html
ADD $BUILD_PATH /var/www/html
RUN chown -R www-data:www-data /var/www/html /run/php/php7.1-fpm.sock

CMD ["/start.sh"]