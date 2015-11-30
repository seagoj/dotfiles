#!/bin/bash

if ! which termite >/dev/null; then
    case $OS_TYPE in
    Arch)
        archInstall termite
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
