FROM docker.io/php:7.4-fpm
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql zip
# use production recommendations from php team
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# utilities
RUN apt-get install -y procps

RUN apt-get install -y nginx
ADD nginx.conf /etc/nginx/conf.d/gestion-compte.conf


# prepare elefant
RUN useradd elefant
ADD gestion-compte /src/gestion-compte
ADD parameters.yml /src/gestion-compte/app/config/parameters.yml
ADD entrypoint.sh /src/gestion-compte/entrypoint.sh
WORKDIR /src/gestion-compte
RUN mkdir -p vendor
RUN chown -R elefant app/config/parameters.yml var/ web vendor bin

RUN touch /run/nginx.pid
# TODO(g.seux): ideally we should redirect access.log/error.log to stdout & stderr (like inthe standard nginx image)
RUN chown -R elefant /var/log/nginx /var/lib/nginx /run/nginx.pid
RUN rm /etc/nginx/sites-enabled/default

# setup php-fpm correctly
RUN touch /var/log/fpm-php.www.log && chown -R elefant /var/log/fpm-php.www.log
RUN echo 'chdir = /src/gestion-compte/web' >> /usr/local/etc/php-fpm.d/www.conf


USER elefant
ENTRYPOINT ./entrypoint.sh
