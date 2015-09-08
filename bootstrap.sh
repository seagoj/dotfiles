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

function decryptSecrets()
{
    declare -a SECRETS=($(find . -name *.gpg))
    for i in "${SECRETS[@]%.gpg}"; do
        gpg --batch --yes --quiet --output $i --decrypt $i.gpg
    done
}

# decryptSecrets

STOWOPTS=--ignore=\.gpg\ --ignore=\package-install.sh\ -vt\ $HOME

for p in "${PACKAGES[@]}"; do
    echo "stowing $p"
    if [[ -f $p/package-install.sh ]]; then
        source $p/package-install.sh
    fi
    stow $STOWOPTS $p
done

case $(uname -s) in
"Linux")
    stow $STOWOPTS archey
    ;;
"FreeBSD")
    stow $STOWOPTS archey
    ;;
"Darwin")
    stow $STOWOPTS mac iterm
*)
    echo "No additional packages needed for $(uname -s)"
esac
echo "Please source ~/.zshrc for changes to take affect"
