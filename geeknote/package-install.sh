#!/bin/zsh

function installGeeknote()
{
    autoload updateRepo
    # if ! which geeknote >/dev/null; then
        bootstrap python

        updateRepo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
            install python2-setuptools &&\
            sudo python2 setup.py install
        popd
    # fi
}

installGeeknote
