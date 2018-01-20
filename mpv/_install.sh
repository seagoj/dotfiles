installMac() {
	osinstall mpv --with-libcaca
    brew reinstall ffmpeg --with-libssh
}

dotfiles::install mpv
