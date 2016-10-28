installMac() {
	if ! which http >/dev/null; then
		osinstall httpie
	fi
}

dotfiles::install httpie
