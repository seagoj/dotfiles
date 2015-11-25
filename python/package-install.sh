#!/bin/bash

function installPythonMac()
{
    brew install python
}

function installPythonDebian()
{
    apt-get install python
}

function installPythonArch()
{
    sudo pacman -Syu python python2 --noconfirm
}

if ! which python >/dev/null; then
    case $OS_TYPE in
    "Arch")
        installPythonArch
        ;;
    "Darwin")
        installPythonMac
        ;;
    "Debian")
        installPythonDebian
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
