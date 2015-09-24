#!/bin/bash

declare -a PACKAGES=(ansible\
    anyconnect\
    atom\
    bot\
    geeknote\
    general\
    git\
    irssi\
    mysql\
    ncmpcpp\
    nginx\
    nvim\
    php\
    ssh\
    system\
    tmux\
    vagrant\
    vim\
    zsh
)

declare -a MAC_PACKAGES=(
    mac\
    iterm
)

declare -a NIX_PACKAGES=(
#    archey
)

STOWOPTS=--ignore=\.gpg\ --ignore=\package-install.sh\ -vt\ $HOME

function decryptSecrets()
{
    declare -a SECRETS=($(find . -name *.gpg))
    for i in "${SECRETS[@]%.gpg}"; do
        gpg --yes --quiet --output $i --decrypt $i.gpg
    done
}

function bootstrap()
{
    echo "- $1";
    if [[ -f $1/package-install.sh ]]; then
        source $1/package-install.sh
    else
        echo "No install script defined for $1"
        exit 1
    fi
}

function install()
{
    declare -a PACKS=("${@}")

    for p in "${PACKS[@]}"; do
        echo "stowing $p"
        if [[ -f $p/package-install.sh ]]; then
            source $p/package-install.sh
        fi
        stow $STOWOPTS $p
    done
}

function installOSSpecificPackages()
{
    case $(uname -s) in
    "Linux")
        install ${NIX_PACKAGES[@]}
        ;;
    "FreeBSD")
        install ${NIX_PACKAGES[@]}
        ;;
    "Darwin")
        install ${MAC_PACKAGES[@]}
        ;;
    *)
        echo "No additional packages needed for $(uname -s)"
        ;;
    esac
}

decryptSecrets
install ${PACKAGES[@]}
installOSSpecificPackages
echo "Please source ~/.zshrc for changes to take effect"
