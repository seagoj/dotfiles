#!/bin/bash

installPackages() {
	apm install \
		linter \
		api-workbench >/dev/null
}

installMac() {
	wget https://atom.io/download/mac --output-file=atom-mac.zip &&\
	unzip atom-mac.zip &&\
	mv Atom /Applications/ &&\
	rm atom-mac.zip

	installPackages
}

dotfiles::install atom
