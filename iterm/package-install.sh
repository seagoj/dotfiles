#!/bin/bash

if [[ ! -f iterm/.iterm/sourcerer.itermcolors ]]; then
    bootstrap git

    git clone https://github.com/xero/sourcerer $CODE/sourcerer
    ln -s $CODE/sourcerer/sourcerer.itermcolors iterm/.iterm/sourcerer.itermcolors
fi
