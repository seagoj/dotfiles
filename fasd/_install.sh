#!/bin/bash

if ! which fasd > /dev/null; then
    bootstrap git

    if [[ ! -d ${HOME}/builds ]]; then
        mkdir -p ${HOME}/builds
    fi

    git clone --recurse-submodules git://github.com/clvv/fasd.git ${HOME}/builds/fasd
    pushd ${HOME}/builds/fasd
    sudo make install
    popd
fi
