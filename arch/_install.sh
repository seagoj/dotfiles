PROGNAME=$0

if [[ ! -f /usr/share/kbd/consolefonts/ter-212n.psf.gz ]]; then
    osinstall terminus-font
fi

if ! which pkgfile &>/dev/null; then
    osinstall pkgfile
fi

if ! which mkfs.vfat &>/dev/null; then
    osinstall dosfstools
fi

if ! which alsamixer &>/dev/null; then
    osinstall alsa-utils
fi

if ! which htop &>/dev/null; then
    osinstall htop
fi

output=$(
    echo "FONT=ter-212n" | sudo tee /etc/vconsole.conf &&\
    echo "FONT_MAP=8859-2" | sudo tee -a /etc/vconsole.conf
)

if [[ $? -ne 0 ]]; then
    general::error_exit "${LINENO}: $output."
fi
