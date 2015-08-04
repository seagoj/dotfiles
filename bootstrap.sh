#!/bin/sh
stow ansible atom bot geeknote general git irssi mysql ncmpcpp nginx php ssh system tmux vagrant vim zsh

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
