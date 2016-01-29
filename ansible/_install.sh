#!/bin/bash

if ! which ansible > /dev/null; then
    osinstall ansible
fi

if [[ ! -f "${HOME}/.vault_pass" ]]; then
    echo "$(pass ansible/vault/bellevue | head -n1)" > "${HOME}/.vault_pass"
fi

if [[ ! -f "${HOME}/.vault_pass_doomsday" ]]; then
echo "$(pass ansible/vault/doomsday | head -n1)" > "${HOME}/.vault_pass_doomsday"
fi
