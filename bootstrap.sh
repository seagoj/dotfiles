#!/bin/zsh

declare -a PACKAGES=(
    ansible\
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
    ranger\
    ssh\
    system\
    tmux\
    vagrant\
    php\
    npm
)

declare -a MAC_PACKAGES=(
    mac\
    iterm
)

declare -a NIX_PACKAGES=(

)

declare -a DEBIAN_PACKAGES=(
    debian
)

declare -a ARCH_PACKAGES=(
    arch\
    archey\
    termite
)

function decryptSecrets()
{
    declare -a SECRETS=($(find . -name "*.gpg"))
    for i in "${SECRETS[@]%.gpg}"; do
        gpg --batch --yes --quiet --output $i --decrypt $i.gpg
    done
}

function bootstrap()
{
    declare -a PACKS=("${@}")

    for p in "${PACKS[@]}"; do
        echo "stowing $p"
        if [[ -f $p/package-install.sh ]]; then
            source $p/package-install.sh
        fi
        stow --ignore=.gpg --ignore=package-install.sh -vt $HOME $p
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
        echo "No additional packages needed for $(uname -s)"
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
echo "Please source ~/.zshrc for changes to take effect"
