#!/bin/zsh

if ! which geeknote >/dev/null; then
    bootstrap python

    autoload updateRepo; updateRepo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
        osinstall python2-setuptools &&\
        sudo python2 setup.py install
    popd
fi
