installArch() {
	go get -u github.com/aykamko/tag/...
	go install github.com/aykamko/tag
}

installMac() {
	brew tap aykamko/tag-ag
	osinstall tag-ag
}

dotfiles::install tag
