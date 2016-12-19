installMac() {
	osinstall rust && \
		cargo install rustfmt
}

dotfiles::install rust
