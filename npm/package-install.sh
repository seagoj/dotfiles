#!/bin/bash

if ! which node > /dev/null; then
    install nodejs
fi

if ! which npm > /dev/null; then
    npm
fi
