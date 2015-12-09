#! /bin/zsh

function installNeovimMac()
{
    bootstrap brew
    bootstrap vim

    brew tap neovim/neovim
    brew install --HEAD neovim
}

function installNeovimDebian()
{
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
}

function installSourcerer()
{
    if [[ ! -f ${XDG_CONFIG_HOME}/nvim/colors/sourcerer.vim ]]; then
        autoload updateRepo; updateRepo git://github.com/xero/sourcerer.git sourcerer
        popd
        ln -s ${CODE}/sourcerer/sourcerer.vim $XDG_CONFIG_HOME/nvim/colors/sourcerer.vim
    fi
}

function installPlugins()
{
    nvim -c :PlugInstall && installYCM
}

if ! which nvim >/dev/null; then
    case "${OS_TYPE}" in
    Darwin | Mac)
        installNeovimMac
        installSourcerer
        installPlugins
        ;;
    Arch)
        osinstall neovim python2-neovim python-neovim
        installSourcerer
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
