# vim: filetype=sh:

ssh_reset_permissions() {
    local ssh_config="${HOME}"/.ssh
    declare -a keys=($(find ${ssh_config}/ -name "*.pub"))
    for i in "${keys[@]%.pub}"; do
        chmod 600 ${i}
        chmod 600 ${i}.pub
    done
    chmod 644 ${ssh_config}/known_hosts
    chmod 755 "${ssh_config}"
}
