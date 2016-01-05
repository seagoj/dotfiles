#!/bin/bash

if ! which mycli > /dev/null; then
    osinstall pip
    sudo pip install mycli
fi
