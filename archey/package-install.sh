#!/bin/bash

if ! which archey > /dev/null; then
    case $OS_TYPE in
    Arch)
        install archey3-git
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
