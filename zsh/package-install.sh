# /bin/bash

function installZpreztoMac()
{
    if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
        bootstrap git

        git clone --recursive git://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    fi
}

function installZshMac()
{
    if ! which zsh >/dev/null; then
        bootstrap brew

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
    exit 1
    ;;
esac
