#! /bin/bash

function installNeovimMac()
{
    if ! which nvim >/dev/null; then
        bootstrap brew
        bootstrap vim

        brew tap neovim/neovim
        brew install --HEAD neovim
    fi
}

case $(uname -s) in
"Darwin")
    installNeovimMac
    ;;
*)
    DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    echo "Please define ${DIR##*/} installation for $(uname -s)"
    exit 1
    ;;
esac
