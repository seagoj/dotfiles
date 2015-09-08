#!/bin/bash

function installGeeknote()
{
    if ! which geeknote >/dev/null; then
        bootstrap git
        bootstrap python

        if [[ -z "$CODE" ]]; then
            CODE=$HOME/code
        fi

        if [[ ! -d "$CODE" ]]; then
            mkdir -p $CODE
        fi

	CWD = ${PWD}
        git clone git://github.com/VitaliyRodnenko/geeknote.git ${CODE}/geeknote
        cd ${CODE}/geeknote
        sudo python setup.py install
	cd ${DOTFILES:~$CWD}
    fi
}

installGeeknote
