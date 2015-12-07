#!/bin/zsh

if [[ ! -d $HOME/.rbenv ]]; then
    git clone --recursive https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
else
    pushd $HOME/.rbenv
    git pull --recurse-submodules
    popd
fi

if [[ ! -d ${HOME}/.rbenv/plugins/ruby-build ]]; then
    git clone --recursive https://github.com/rbenv/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
else
    pushd ${HOME}/.rbenv/plugins/ruby-build
    git pull --recurse-submodules
    popd
fi

if [[ ! -d ${HOME}/.rbenv/plugins/ruby-build/share/ruby-build ]]; then
    pushd ${HOME}/.rbenv/plugins/ruby-build &&\
        ./install.sh &&\
        popd
fi

if ! which bundle > /dev/null; then
    gem install bundler
fi
