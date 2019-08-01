suckless::applyPatches() {
    patches="${1}"
    for p in "${patches[@]}"; do
        diffFile=$(basename "${p}")
        wget "${p}" -O "${diffFile}" && \
            patch -Np1 -i "${diffFile}"
    done

    nvim -d config.h config.def.h
}

suckless::install() {
    make && \
        sudo make install
}
