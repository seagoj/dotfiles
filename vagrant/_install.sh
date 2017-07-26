if ! which virtualbox &>/dev/null; then
	osinstall Caskroom/cask/virtualbox
fi

if ! which vagrant &>/dev/null; then
	osinstall Caskroom/cask/vagrant
fi
