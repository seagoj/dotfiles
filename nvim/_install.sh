installNeovimMac() {
    dotfiles::bootstrap brew

    brew tap neovim/neovim
    brew install --HEAD neovim
    osinstall python3 && general::sudo pip3 install neovim
}

installNeovimDebian() {
    general::sudo apt-get install python-dev python-pip python3-dev python3-pip
    general::sudo add-apt-repository ppa:neovim-ppa/unstable
    general::sudo apt-get update
    general::sudo apt-get install neovim
}

installSourcerer() {
    if [[ ! -f ${XDG_CONFIG_HOME}/nvim/colors/sourcerer.vim ]]; then
        general::update_repo git://github.com/xero/sourcerer.git sourcerer
        popd
        ln -s ${CODE}/sourcerer/sourcerer.vim $XDG_CONFIG_HOME/nvim/colors/sourcerer.vim
    fi
}

installPlugins() {
    nvim -c :PlugInstall && installYCM
}

installESLint() {
    if ! which eslint &>/dev/null; then
        general::sudo npm install -g eslint
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
