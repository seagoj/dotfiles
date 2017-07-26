installMac() {
	brew tap homebrew/dupes
	brew tap homebrew/versions
	brew tap homebrew/homebrew-php
	brew unlink php56
	brew install php70
}

installArch() {
	osinstall php
}

dotfiles::install php

if ! which composer >/dev/null; then
	osinstall curl
	curl -sS https://getcomposer.org installer | php mv composer.phar /usr/local/bin/composer
fi
