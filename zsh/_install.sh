. $HOME/.local/functions/zsh.sh

if ! which zsh &>/dev/null; then
    osinstall zsh direnv
    zsh::use
fi
