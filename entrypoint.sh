#!/bin/bash

composer install
php bin/console doctrine:database:create
php bin/console doctrine:migration:migrate
php bin/console assetic:dump
#php bin/console server:run
cd web/
php-fpm &
nginx -g "daemon off;" &
wait -n
