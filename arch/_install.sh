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
    general::sudo "tee /etc/vconsole.conf <<< 'FONT=ter-212n'" &&\
        general::sudo "tee -a /etc/vconsole.conf <<< 'FONT_MAP=8859-2'"
)

if [[ $? -ne 0 ]]; then
    general::error_exit "${LINENO}: $output."
fi
