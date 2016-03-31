#!/usr/bin/env zsh

function installArch() {
    osinstall calibre
}

function installMac() {
    brew cask install calibre
}

autoload dotfilesInstall; dotfilesInstall calibre
