#!/bin/bash

function installPythonMac()
{
    brew install python
}

function installPythonDebian()
{
    apt-get install python 
}

if ! which python >/dev/null; then
    case $(uname -s) in
    "Darwin")
        installPythonMac
        ;;
    "Linux")
        installPythonDebian
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
