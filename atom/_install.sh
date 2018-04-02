#!/bin/bash

installPackages() {
    apm install \
        linter \
        api-workbench >/dev/null
}

installMac() {
    if ! which wget &>/dev/null; then
         osinstall wget
    fi
    wget https://atom.io/download/mac --output-file=atom-mac.zip &&\
        unzip atom-mac.zip &&\
        mv Atom /Applications/ &&\
        rm atom-mac.zip

    installPackages
}

dotfiles::install atom
