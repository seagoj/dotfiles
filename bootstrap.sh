#!/usr/bin/env zsh

declare -a PACKAGES
PACKAGES=(
    ansible
#    anyconnect
    atom
    bot
    geeknote
    general
    git
    go
    irssi
#    mysql
    ncmpcpp
#    nginx
    nvim
#    php
    ranger
    ssh
    system
    tmux
    vagrant
    npm
    wego
    ag
    rbenv
    fasd
    mycli
    calibre
    keybase
    pass
    buku
    boilr
    bonfyre
)
declare -r PACKAGES

declare -a MAC_PACKAGES
MAC_PACKAGES=(
    mac
    iterm
    dash
    osxey
    wwwtxt
    # zeal
)
declare -r MAC_PACKAGES

declare -a NIX_PACKAGES
NIX_PACKAGES=(

)
declare -r NIX_PACKAGES

declare -a DEBIAN_PACKAGES
DEBIAN_PACKAGES=(
    debian
)
declare -r DEBIAN_PACKAGES

declare -a ARCH_PACKAGES
ARCH_PACKAGES=(
    arch
    awesome
    archey
    termite
    chromium
    vpn
    thinkpad
    flamerobin
    cloudstation
    virtualbox
    zeal
    feednix
    turses
    steam
)
declare -r ARCH_PACKAGES
GPG="gpg"
which gpg2 &>/dev/null && GPG="gpg2"

if [[ ! -d ${HOME}/functions ]]; then
    stow --ignore=.gpg --ignore=_install.sh -vt $HOME zsh
    stow --ignore=.gpg --ignore=_install.sh -vt $HOME general
    source $HOME/.zshenv
fi

if [[ ! -f ${HOME}/functions/success || ! -f ${HOME}/functions/fail || ! -f ${HOME}/functions/info || ! -f ${HOME}/functions/bootstrap ]]; then
    stow --ignore=.gpg --ignore=_install.sh -vt $HOME general
fi

autoload success
autoload fail
autoload info
autoload bootstrap

function decryptSecrets()
{
    declare -a SECRETS=($(find . -name "*.gpg"))
    for i in "${SECRETS[@]%.gpg}"; do
        if ! echo $i | grep ".password-store" > /dev/null; then
            $GPG --batch --yes --quiet --use-agent --output $i --decrypt $i.gpg
        fi
	if [[ $? -ne 0 ]]; then
		echo "unable to decrypt"
		exit 1
	fi
    done
}

# function bootstrap()
# {
#     declare -a PACKS=("${@}")

#     for p in "${PACKS[@]}"; do
#          info "$p stowing"
#         stow --ignore=.gpg --ignore=_install.sh -vt $HOME $p
#         if [[ $? -ne 0 ]]; then
#             fail "$p: stowing"
#         fi


#         if [[ -f $p/_install.sh ]]; then
#             info "$p: installing"
#             source $p/_install.sh
#             if [[ $? -ne 0 ]]; then
#                 fail "$p: installing"
#             fi
#         fi

#            success $p
#     done
# }

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
