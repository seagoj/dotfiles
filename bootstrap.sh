#!/bin/sh

gpg --output anyconnect/.anyconnect --decrypt anyconnect/.anyconnect.gpg
gpg --output vim/.gist-vim --decrypt vim/.gist-vim.gpg
gpg --output general/.secrets --decrypt general/.secrets.gpg

stow ansible anyconnect atom bot geeknote general git irssi mysql ncmpcpp nginx php ssh system tmux vagrant vim zsh

case $(uname -s) in
  "Linux")
    stow archey
    ;;
  "FreeBSD")
    stow archey
    ;;
  "Darwin")
    stow mac iterm
esac


