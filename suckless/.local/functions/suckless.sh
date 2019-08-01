suckless::applyPatches() {
    patchesRoot=https://"${package}".suckless.org/patches
    patches="${1}"
    for p in "${patches[@]}"; do
        pNoDashes=$(echo "${p}" | sed 's/-//')
        diffFile="${package}-${version}-${pNoDashes}.diff"
        wget "$patchesRoot/${p}/$diffFile" -O "$diffFile" && \
            patch -Np1 -i "$diffFile"
    done

    nvim -d config.h config.def.h
}

suckless::applyPatchesInvert() {
    patchesRoot=https://"${package}".suckless.org/patches
    patches="${1}"
    for p in "${patches[@]}"; do
        pNoDashes=$(echo "${p}" | sed 's/-//')
        diffFile="${package}-${pNoDashes}-${version}.diff"
        wget "$patchesRoot/${p}/$diffFile" -O "$diffFile" && \
            patch -Np1 -i "$diffFile"
    done

    nvim -d config.h config.def.h
}

suckless::applyToolPatches() {
    patchesRoot="https://tools.suckless.org/${package}/patches"
    patches="${1}"
    for p in "${patches[@]}"; do
        pNoDashes=$(echo "${p}" | sed 's/-//')
        diffFile="${package}-${pNoDashes}-$version.diff"
        wget "$patchesRoot/${p}/$diffFile" -O "$diffFile" && \
            patch -Np1 -i "$diffFile"
    done

    nvim -d config.h config.def.h
}

suckless::install() {
    make && \
        sudo make install
}
