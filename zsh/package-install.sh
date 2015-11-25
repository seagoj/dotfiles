# /bin/bash

function installZprezto()
{
    if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
        bootstrap git

        git clone --recursive git://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
        git clone --recursive git://github.xom/xero/sourcerer.git "${HOME}/code/sourcerer"
    fi
}

function installZshMac()
{
        bootstrap brew

        brew install zsh
}

function installZshDebian()
{
    sudo apt-get update && sudo apt-get install zsh
}

function installZshArch()
{
    sudo pacman -Syu --noconfirm zsh
}

function useZsh()
{
    if which chsh >/dev/null; then
        chsh -s $(which zsh)
    else
        echo "Define how to change shell when chsh does not exist."
	exit 1
    fi
}

if ! which zsh >/dev/null; then
    case $OS_TYPE in
    "Darwin")
        installZshMac
        installZprezto
        useZsh
        ;;
    Debian)
        installZshDebian
        installZprezto
        useZsh
        ;;
    Arch)
        installZshArch
        installZprezto
        useZsh
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
