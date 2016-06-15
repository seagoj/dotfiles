. $HOME/functions/zsh.sh

if ! which zsh &>/dev/null; then
    osinstall zsh
    zsh::use
fi
