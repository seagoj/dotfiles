#!/bin/bash

bootstrap rbenv

if ! which sass > /dev/null; then
    gem install sass
    source $HOME/.zshenv
fi
