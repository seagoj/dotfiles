if [[ ! -f iterm/.iterm/sourcerer.itermcolors ]]; then
    dotfiles::updateRepo https://github.com/xero/sourcerer sourcerer && popd
    ln -s $CODE/sourcerer/sourcerer.itermcolors iterm/.iterm/sourcerer.itermcolors
fi
