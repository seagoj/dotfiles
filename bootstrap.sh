#!/bin/zsh

declare -a PACKAGES=(
    ansible
    anyconnect
    atom
    bot
    geeknote
    general
    git
    irssi
    mysql
    ncmpcpp
    nginx
    nvim
    php
    ranger
    ssh
    system
    tmux
    vagrant
    php
    npm
    wego
    ag
    rbenv
    fasd
    mycli
)

declare -a MAC_PACKAGES=(
    mac
    iterm
)

declare -a NIX_PACKAGES=(

)

declare -a DEBIAN_PACKAGES=(
    debian
)

declare -a ARCH_PACKAGES=(
    arch
    awesome
    archey
    termite
    chromium
    vpn
    thinkpad
)

if [[ ! -d ${HOME}/functions ]]; then
    stow --ignore=.gpg --ignore=_install.sh -vt $HOME zsh
    stow --ignore=.gpg --ignore=_install.sh -vt $HOME general
    source $HOME/.zshenv
fi

autoload success
autoload fail
autoload info

function decryptSecrets()
{
    declare -a SECRETS=($(find . -name "*.gpg"))
    for i in "${SECRETS[@]%.gpg}"; do
        gpg --batch --yes --quiet --output $i --decrypt $i.gpg
	if [[ $? -ne 0 ]]; then
		echo "unable to decrypt"
		exit 1
	fi
    done
}

function bootstrap()
{
    declare -a PACKS=("${@}")

    for p in "${PACKS[@]}"; do
         info "$p stowing"
        stow --ignore=.gpg --ignore=_install.sh -vt $HOME $p
        if [[ $? -ne 0 ]]; then
            fail "$p: stowing"
        fi


        if [[ -f $p/_install.sh ]]; then
            info "$p: installing"
            source $p/_install.sh
            if [[ $? -ne 0 ]]; then
                fail "$p: installing"
            fi
        fi

           success $p
    done
}

function installOSSpecificPackages()
{
    case $OS_TYPE in
    Arch)
        bootstrap ${ARCH_PACKAGES[@]}
        ;;
    Linux | FreeBSD)
        bootstrap ${NIX_PACKAGES[@]}
        ;;
    Darwin | Mac)
        bootstrap ${MAC_PACKAGES[@]}
        ;;
    *)
        info "No additional packages needed for $(uname -s)"
        ;;
    esac
}

function installOS()
{
    case $OS_TYPE in
    Arch)
        bootstrap arch
        ;;
    Debian)
        bootstrap debian
        ;;
    Linux | FreeBSD)
        bootstrap linux
        ;;
    Darwin | Mac)
        bootstrap mac
        ;;
    esac
}

function installShell()
{
    bootstrap zsh
}

installOS
installShell
decryptSecrets
bootstrap ${PACKAGES[@]}
installOSSpecificPackages
info "Logout and back in for changes to take effect"
