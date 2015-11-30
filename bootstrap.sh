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
    vim\
    zsh
)

declare -a MAC_PACKAGES=(
    mac\
    iterm
)

declare -a NIX_PACKAGES=(

)

declare -a ARCH_PACKAGES=(
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
    STOWOPTS=""

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
        install ${ARCH_PACKAGES[@]}
        ;;
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
