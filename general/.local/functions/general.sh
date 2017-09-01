general::error_exit() {
	echo ""
	echo "${PROGNAME}: ${1:- 'Unknown Error'}" 1>&2
	exit 1
}

general::fail() {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1 exit:$2\n"
	echo ''
	exit $2
}

general::info() {
	printf "  [ \033[00;34m..\033[0m ] $1"
}

general::success() {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

general::user() {
	printf "\r	[ \033[0;33m?\033[0m ] $1 "
}

general::env_var_to_script() {
	env_var=$1
	shift

	if [[ -z "${env_var}" ]]; then
		echo "No default ${env_var} set"
		exit
	fi

	eval "\$${env_var} $@"
}

general::sudo() {
	if which pass >/dev/null; then
		password=$(pass thinkpad/login | head -n 1)
		eval "sudo -kS <<< ${password} bash -c '${@}'"
		if [[ $? -ne 0 ]]; then
			echo "FAILED: sudo -kS <<< ${password} bash -c '${@}'"
			exit 1
		fi
	else
		sudo $@
	fi
}

general::set_permission() {
	if [[ $# -ne 2 ]]; then
		echo "usage:"
		echo "set_permission [permission] [path_to_file]"
		exit 1
	fi

	permission="{$1}"
	path_to_file="{$2}"

	if [[ -e $path_to_file ]]; then
		general::sudo "chmod ${permission} ${path_to_file}"
	fi
}

portlistener() {
	lsof -i tcp:"$1"
}
