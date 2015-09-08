#!/bin/bash

function installGeeknote()
{
    if ! which geeknote >/dev/null; then
        bootstrap git
        bootstrap python

        if [[ ! -d "$CODE" ]]; then
            mkdir -p $CODE
        fi

        git clone git://github.com/VitaliyRodenko/geeknote.git ${CODE}/geeknote
        cd ${CODE}/geeknote
        sudo python setup.py install
    fi
}

installGeeknote
