installMac() {
	osinstall rust &&\
		cargo install ripgrep
}

dotfiles::install rg
