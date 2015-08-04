#!/bin/sh

STOWOPTS=--ignore=\.gpg\ -vt\ $HOME
declare -a SECRETS=($(find . -name *.gpg))

for i in "${SECRETS[@]%.gpg}"; do
    gpg --batch --yes --quiet --output $i --decrypt $i.gpg
done

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
