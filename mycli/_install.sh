#!/usr/bin/env zsh

function installArch() {
    osinstall python-pip
    sudo pip install mycli
}

function installMac() {
    osinstall python3
    sudo pip3 install mycli
}

autoload dotfilesInstall; dotfilesInstall mycli
