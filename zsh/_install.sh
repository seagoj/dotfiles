# /bin/bash

function installZprezto()
{
    if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto/.git" ]]; then
        bootstrap git

        stow -D zsh
        git clone --recurse-submodules git://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
        stow --ignore=.gpg --ignore=_install.sh -vt $HOME zsh
        git clone --recurse-submodules git://github.com/xero/sourcerer.git "${HOME}/code/sourcerer"
    fi
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
    osinstall zsh
    useZsh
fi

installZprezto
