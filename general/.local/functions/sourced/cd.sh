cd() {
	if [[ $# != 0 ]]; then
		pushd "$@"
	else
		popd
	fi
}
