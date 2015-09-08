# /bin/bash

function installZpreztoMac()
{
    if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
        if which git >/dev/null; then
            git clone --recursive git://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
        else
            source git/package-install.sh
        fi
    fi
}

function installZshMac()
{
    if ! which zsh >/dev/null; then
        source brew/package-install.sh
        brew install zsh
    fi
}

case $(uname -s) in
"Darwin")
    installZshMac
    installZpreztoMac
    ;;
*)
    DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    echo "Please define ${DIR##*/} installation for $(uname -s)"
    exit
    ;;
esac
