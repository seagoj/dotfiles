installMac() {
	git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git "${CODE}/karabiner-elements" && \
		xcode-select --install && \
		(
			cd Karabiner-Elements && \
			make
		)
}

dotfiles::install karabiner
