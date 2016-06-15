installNeovimMac() {
    dotfiles::bootstrap brew

    brew tap neovim/neovim
    brew install --HEAD neovim
    osinstall python3 && sudo pip3 install neovim
}

installNeovimDebian() {
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
}

installSourcerer() {
    if [[ ! -f ${XDG_CONFIG_HOME}/nvim/colors/sourcerer.vim ]]; then
        general::updateRepo git://github.com/xero/sourcerer.git sourcerer
        popd
        ln -s ${CODE}/sourcerer/sourcerer.vim $XDG_CONFIG_HOME/nvim/colors/sourcerer.vim
    fi
}

installPlugins() {
    nvim -c :PlugInstall && installYCM
}

installESLint() {
    if ! which eslint &>/dev/null; then
        sudo npm install -g eslint
    fi
}

if ! which nvim >/dev/null; then
    case "${OS_TYPE}" in
    Darwin | Mac)
        installNeovimMac
        installSourcerer
        installPlugins
        ;;
    Arch)
        osinstall neovim python2-neovim python-neovim xsel
        installSourcerer
        installPlugins
        ;;
    Debian)
        installNeovimDebian
        installSourcerer
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for ${OS_TYPE}"
        exit 1
        ;;
    esac
fi
