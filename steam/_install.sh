if ! which steam &>/dev/null; then
    general::sudo $(tee -a /etc/pacman.conf <<< '[multilib]')
    general::sudo $(tee -a /etc/pacman.conf <<< 'Include = /etc/pacman.d/mirrorlist')
    osinstall multilib-devel lib32-alsa-plugins xf86-video-intel lib32-mesa-libgl steam
fi
