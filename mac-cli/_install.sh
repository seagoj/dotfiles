if ! which mac >/dev/null; then
	dotfiles::update_repo https://github.com/guarinogabriel/mac-cli  mac-cli
	sh "mac install"
	popd
fi
