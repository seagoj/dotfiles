# vim: filetype=sh:


suckless_patch() {
    local diff_file=$(basename "$1")
    local patch_file="$src_dir"-patches/$(basename "$1")
    if [ ! -f "$patch_file" ]; then
        if ! which wget &>/dev/null; then
            osinstall wget
        fi
        wget "$1" -O "$patch_file"
    fi
    patch -Np1 -i "$patch_file"
}

suckless_config() {
    local config_source="$XDG_CONFIG_HOME"/"$1"/config.h
    local config_dest="$src_dir"/config.h

    if [ ! -f "$config_dest" ]; then
        ln -s "$config_source" "$config_dest"
    fi
}

suckless_build() {
    src_dir="$HOME"/.local/src/suckless/"$1"
    suckless_config "$1" && \
    cd "$src_dir"
    for p in $patches; do
        suckless_patch "$p"
        [ "0" -ne "$?" ] && exit "$?"
    done
    nvim -d config.def.h config.h && \
    make clean && make && sudo make install && \
    git reset HEAD --hard && git clean -f
}
