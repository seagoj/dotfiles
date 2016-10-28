. $HOME/.local/functions/general.sh

SSH_CONFIG=${HOME}/.ssh

ssh::reset_permissions() {
	declare -a KEYS=($(find ${SSH_CONFIG}/ -name "*.pub"))
	for i in "${KEYS[@]%.pub}"; do
		general::set_permission 600 ${i}
		general::set_permission 600 ${i}.pub
	done

	general::set_permission 644 ${SSH_CONFIG}/known_hosts

	general::set_permission 755 "${SSH_CONFIG}"
}
