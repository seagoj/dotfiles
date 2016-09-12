if ! which mutt >/dev/null; then
	brew install mutt
fi

if [[ ! -d "$XDG_CACHE_HOME/mutt/headers" ]]; then
	mkdir -p "$XDG_CACHE_HOME/mutt/headers"
fi

if [[ ! -d "$XDG_CACHE_HOME/mutt/bodies" ]]; then
	mkdir -p "$XDG_CACHE_HOME/mutt/bodies"
fi

if [[ ! -d "$XDG_CONFIG_HOME/mutt" ]]; then
	mkdir -p "$XDG_CONFIG_HOME/mutt"
fi

if [[ ! -f "$XDG_CONFIG_HOME/mutt/certificates" ]]; then
	touch "$XDG_CONFIG_HOME/mutt/certificates"
fi
