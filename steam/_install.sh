if ! which steam &>/dev/null; then
    echo "[multilib]" | general::sudo tee -a /etc/pacman.conf
    echo "Include = /etc/pacman.d/mirrorlist" | general::sudo tee -a /etc/pacman.conf
    osinstall multilib-devel lib32-alsa-plugins xf86-video-intel lib32-mesa-libgl steam
fi
