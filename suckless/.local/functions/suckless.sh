suckless::applyPatches() {
    echo $version
    patches="${1}"
    for p in "${patches[@]}"; do
        wget "${p}" -O "patch.diff" && \
            patch -Np1 -i "patch.diff"
    done

    nvim -d config.h config.def.h
}

suckless::install() {
    make && \
        sudo make install
}
