#!/bin/bash

if ! which virtualbox > /dev/null; then
    install virtualbox
fi

if ! which vagrant > /dev/null; then
    install vagrant
fi
