installFonts() {
	dotfiles::update_repo git://github.com/ryanoasis/nerd-fonts nerd-fonts

	./install.sh "SourceCodePro"
	./install.sh "Terminus"
	popd >/dev/null
}

installArch() {
	installFonts
}

installMac() {
	installFonts
}

dotfiles::install general
