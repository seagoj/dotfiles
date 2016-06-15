if ! which fasd &>/dev/null; then
    dotfiles::bootstrap git

    if [[ ! -d ${HOME}/builds ]]; then
        mkdir -p ${HOME}/builds
    fi

    git clone --recurse-submodules git://github.com/clvv/fasd.git ${HOME}/builds/fasd
    pushd ${HOME}/builds/fasd
    general::sudo make install
    popd
fi
