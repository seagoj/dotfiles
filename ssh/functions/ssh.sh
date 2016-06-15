. $HOME/functions/general.sh

SSH_CONFIG=${HOME}/.ssh

ssh::reset_permissions() {
    declare -a KEYS=($(find ${SSH_CONFIG}/ -name "*.pub"))
    for i in "${KEYS[@]%.pub}"; do
        general::set_permission ${i} 600
        general::set_permission ${i}.pub 600
    done

    general::set_permission ${SSH_CONFIG}/known_hosts 644

    general::set_permission "${SSH_CONFIG}" 755
}
