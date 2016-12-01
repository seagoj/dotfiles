unalias ll lr lt 2>/dev/null;

function lt() {
	ll -t "${@}"
}

function lr() {
	ll -r "${@}"
}

function ll() {
	local LS=ls
	if [[ $(uname) != 'Darwin' ]]; then
		LS="${LS} -X"
	fi
	${LS} -al -G "${@}"
}
