#!/usr/bin/env zsh

function installMac() {
    bootstrap python
    autoload updateRepo; updateRepo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
        sudo python setup.py install
    popd
}

function installArch() {
    bootstrap python
    autoload updateRepo; updateRepo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
        osinstall python2-setuptools &&\
        sudo python2 setup.py install
    popd
}

autoload dotfilesInstall; dotfilesInstall geeknote
