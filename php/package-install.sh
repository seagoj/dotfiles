#!/bin/bash

if ! which php > /dev/null; then
    install php
    echo extension=phar.so >> /etc/php/php.ini
fi

if ! which composer > /dev/null; then
    install curl
    curl -sS https://getcomposer.org installer | php mv composer.phar /usr/local/bin/composer
fi
