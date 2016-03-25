#!/bin/zsh

function installArch() {
    osinstall silver-searcher-git
}

function installMac() {
    osinstall the_silver_searcher
}

autoload dotfilesInstall; dotfilesInstall ag
