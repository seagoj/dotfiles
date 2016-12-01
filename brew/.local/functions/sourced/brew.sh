#!/bin/bash

unalias brew 2>/dev/null;

function brew() {
	if ! which brew >/dev/null; then
		osinstall brew
	fi

	if [[ "$1" == "refresh" ]]; then
		command brew update && \
			brew upgrade && \
			brew cleanup && \
			brew prune && \
			brew doctor
	else
		command brew "$@"
	fi
}
