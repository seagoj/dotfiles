#!/bin/bash

STOWOPTS=--ignore=\.gpg\ -vt\ $HOME
declare -a SECRETS=($(find . -name *.gpg))

for i in "${SECRETS[@]%.gpg}"; do
    gpg --batch --yes --quiet --output $i --decrypt $i.gpg
done

if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
    if which git >/dev/null; then
        git clone --recursive git://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 
    else 
        echo "Git must be installed to pull down prezto.";
    fi
fi

stow $STOWOPTS ansible\
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

case $(uname -s) in
  "Linux")
    stow $STOWOPTS archey
    ;;
  "FreeBSD")
    stow $STOWOPTS archey
    ;;
  "Darwin")
    stow $STOWOPTS mac iterm
esac
 echo "Please source ~/.zshrc for changes to take affect"
