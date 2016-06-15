if [[ ! -d $HOME/.rbenv/.git ]]; then
    git clone --recursive https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
else
    pushd $HOME/.rbenv >/dev/null
    git pull --recurse-submodules >/dev/null
    popd >/dev/null
fi

if [[ ! -d ${HOME}/.rbenv/plugins/ruby-build/.git ]]; then
    git clone --recursive https://github.com/rbenv/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
else
    pushd ${HOME}/.rbenv/plugins/ruby-build >/dev/null
    git pull --recurse-submodules >/dev/null
    popd >/dev/null
fi

if ! which gem &>/dev/null; then
    pushd ${HOME}/.rbenv/plugins/ruby-build >/dev/null &&\
        generall::sudo ./install.sh &&\
        rbenv install 2.2.3 --verbose &&\
        rbenv global 2.2.3 &&\
        popd >/dev/null
fi

if ! which bundle &>/dev/null; then
    source $HOME/.zshenv
    generall::sudo gem install bundler
fi
