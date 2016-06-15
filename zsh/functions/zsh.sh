zsh::use() {
    if which chsh &>/dev/null; then
        chsh -s $(which zsh)
    else
        echo "Define how to change shell when chsh does not exist."
        exit 1
    fi
}
