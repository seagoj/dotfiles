#!/usr/bin/env zsh

if ! which ranger >/dev/null; then
    case $OS_TYPE in
    Darwin | Mac)
        brew tap homebrew/x11
        osinstall w3m lynx highlight atool Caskroom/cask/xquartz mediainfo xpdf libcaca --with-imlib2 ranger
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
