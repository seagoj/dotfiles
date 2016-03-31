#!/usr/bin/env zsh

if ! which pinentry-curses > /dev/null; then
    osinstall gpg gpg2
fi
