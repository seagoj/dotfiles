#!/bin/bash

if ! which php > /dev/null; then
    osinstall php
    echo extension=phar.so | sudo tee -a /etc/php/php.ini
fi

if ! which composer > /dev/null; then
    osinstall curl
    curl -sS https://getcomposer.org installer | php mv composer.phar /usr/local/bin/composer
fi
