if ! which buku >/dev/null; then
	if ! which pip3 >/dev/null; then
		dotfiles::bootstrap python
	fi

	general::sudo 'pip3 install --upgrade pip' >/dev/null

	if ! pip3 freeze | grep pycrypto >/dev/null; then
		general::sudo 'pip3 install pycrypto' >/dev/null
	fi

	dotfiles::update_repo https://github.com/jarun/Buku buku >/dev/null
	general::sudo 'make install' >/dev/null
	popd >/dev/null
fi
