#!/bin/zsh

if ! which ranger >/dev/null; then
    case $OS_TYPE in
    Darwin | Mac)
        osinstall  w3m lynx highlight atool mediainfo xpdf libcaca --with-imlib2
        ;;
    Debian)
        osinstall ranger
        ;;
    Arch)
        osinstall ranger
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
