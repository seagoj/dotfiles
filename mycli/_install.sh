#!/bin/bash

if ! which mycli > /dev/null; then
    osinstall python-pip
    sudo pip install mycli
fi
