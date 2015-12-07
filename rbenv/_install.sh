#!/bin/zsh

if ! which rbenv > /dev/null; then
    git clone --recursive https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
fi

if [[ ! -d ${HOME}/.rbenv/plugins/ruby-build ]]; then
    git clone --recursive https://github.com/rbenv/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
fi

if [[ ! -d ${HOME}/.rbenv/plugins/ruby-build/share/ruby-build ]]; then
    pushd ${HOME}/.rbenv/plugins/ruby-build &&\
        ./install.sh &&\
        popd
fi

if ! which bundle > /dev/null; then
    gem install bundler
fi
