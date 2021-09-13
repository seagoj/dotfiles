asdf_wrapper() {
	asdf plugin-add "$plugin"
	asdf install && \
		"$(basename ${0})" ${@}
}
