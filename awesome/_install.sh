#!/usr/bin/env zsh

if ! which startx > /dev/null; then
    osinstall xorg-server xorg-server-utils xorg-xinit
fi

if ! which awesome > /dev/null; then
    osinstall awesome vicious
fi
