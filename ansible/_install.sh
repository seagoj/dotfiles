#!/bin/zsh

function installArch() {
    osinsstall ansible
}

function installMac() {
    bootstrap python &&\
        sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
}

autoload dotfilesInstall; dotfilesInstall ansible

if [[ ! -f "${HOME}/.vault_pass" ]]; then
    echo "$(pass ansible/vault/bellevue | head -n1)" > "${HOME}/.vault_pass"
fi

if [[ ! -f "${HOME}/.vault_pass_doomsday" ]]; then
    echo "$(pass ansible/vault/doomsday | head -n1)" > "${HOME}/.vault_pass_doomsday"
fi
