if [[ ! -f iterm/.iterm/sourcerer.itermcolors ]]; then
    dotfiles::update_repo https://github.com/xero/sourcerer sourcerer && popd
    ln -s $CODE/sourcerer/sourcerer.itermcolors iterm/.iterm/sourcerer.itermcolors
fi
