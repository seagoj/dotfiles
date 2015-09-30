#! /bin/bash

function installNeovimMac()
{
    bootstrap brew
    bootstrap vim

    brew tap neovim/neovim
    brew install --HEAD neovim
}

function installNeovimDebian()
{
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
}

if ! which nvim >/dev/null; then
    ln -s ~/.vimrc ~/.nvimrc
    ln -s ~/.vim ~/.nvim
    case $(uname -s) in
    "Darwin")
        installNeovimMac
        ;;
    "Linux")
        installNeovimDebian
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
