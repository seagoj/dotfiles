check_additional() {
	echo "Do you have multiple u2f tokens? (Y/n)";
	read confirm
	if [[ "$confirm" == "Y" ]] || [[ "$confirm" == "y" ]]; then
		echo "Insert token and press enter"
		read ready
		pamu2fcfg -n >> ~/.config/u2f/keys
	fi
}

installMac() {
	if ! which pamu2fcfg >/dev/null; then
		osinstall pam-u2f
	fi

	# if [[ ! -f /usr/lib/pam/pam_u2f.so ]]; then
	#	sudo ln -s $(brew --prefix pam-u2f)/lib/pam/pam_u2f.so /usr/lib/pam/pam_u2f.so
	# fi

	if [[ ! -d u2f/.config/u2f ]]; then
		mkdir -p u2f/.config/u2f
	fi

	if [[ ! -f u2f/.config/u2f/keys ]]; then
		pamu2fcfg > u2f/.config/u2f/keys
		check_additional
	fi
}

installArch() {
	echo "Not yet implemented for Arch"
	exit 1
}

dotfiles::install u2f
