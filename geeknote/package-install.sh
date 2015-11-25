#!/bin/zsh

function installGeeknote()
{
    autoload updateRepo
    # if ! which geeknote >/dev/null; then
        bootstrap python

        updateRepo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
            sudo pacman -Syu python2-setuptools --noconfirm &&\
            sudo python2 setup.py install
        popd
    # fi
}

installGeeknote
