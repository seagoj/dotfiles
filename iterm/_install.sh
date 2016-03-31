#!/usr/bin/env zsh

if [[ ! -f iterm/.iterm/sourcerer.itermcolors ]]; then
    autoload updateRepo; updateRepo https://github.com/xero/sourcerer sourcerer && popd
    ln -s $CODE/sourcerer/sourcerer.itermcolors iterm/.iterm/sourcerer.itermcolors
fi
