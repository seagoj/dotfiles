#!/bin/bash

installPackages() {
	apm install \
		linter \
		api-workbench >/dev/null
}

# installMac() {
	echo $HOME
	if [[ ! -f "$HOME"/.atom ]]; then
		ln -s "$XDG_DATA_HOME"/atom "$HOME"/.atom
	fi

	# wget https://atom.io/download/mac --output-file=atom-mac.zip &&\
	#	unzip atom-mac.zip &&\
	#	mv Atom /Applications/ &&\
	#	rm atom-mac.zip

	# installPackages
# }

# dotfiles::install atom
# installPackages
