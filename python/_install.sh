#!/bin/bash

if ! which python >/dev/null; then
    case $OS_TYPE in
    Arch)
        osinstall python python2
        ;;
    Darwin | Mac)
        osinstall python
        ;;
    Debian)
        osinstall python
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
