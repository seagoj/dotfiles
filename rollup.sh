#!/bin/sh

gpg --output ~/dotfiles/anyconnect/.anyconnect.gpg --encrypt --recipient seagoj@gmail.com ~/.anyconnect
gpg --output ~/dotfiles/vim/.gist-vim.gpg --encrypt --recipient seagoj@gmail.com ~/.gist-vim
gpg --output ~/dotfiles/general/.secrets.gpg --encrypt --recipient seagoj@gmail.com ~/.secrets
