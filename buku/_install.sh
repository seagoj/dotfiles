#!/bin/zsh

if ! which pip3 >/dev/null; then
    bootstrap python
fi

if ! sudo pip3 freeze | grep pycrypto >/dev/null; then
    sudo pip3 install pycrypto
fi

autoload updateRepo; updateRepo https://github.com/jarun/Buku buku
sudo make install
popd
