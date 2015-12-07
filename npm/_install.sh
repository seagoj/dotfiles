#!/bin/bash

if ! which node > /dev/null; then
    osinstall nodejs
fi

if ! which npm > /dev/null; then
    osinstall npm
fi
