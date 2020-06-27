#!/bin/sh

userresources="${HOME}"/.Xresources
usermodmap="${HOME}"/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset r rate 200 50

xbindkeys &
setxkbmap -option caps:ctrl_modifier
syncthing &

if [ -n "$(xrandr | grep Virtual-1)" ]; then
    dock || xrandr --output Virtual-1 --mode 3840x1600 || \
        undock || xrandr --output Virtual-1 --mode 2560x1600

fi

session=${1:-dwm}

case $session in
    dwm)
    if [ ! -d ~/.cache/dwm ]; then
        mkdir -p ~/.cache/dwm
    fi
    if [ ! -f ~/.cache/dwm/stdout ]; then
        touch ~/.cache/dwm/stdout
    fi
    if [ ! -f ~/.cache/dwm/stderr ]; then
        touch ~/.cachedwm/stderr
    fi
    feh --bg-scale ~/.local/share/wallpapers/wall.png
    compton &
    dunst&
    xscreensaver&
    x11vnc -display :0 -noxrecord -noxfixes -noxdamage -forever -passwd 123456 &
    exec dwm >> ~/.cache/dwm/stdout 2>> ~/.cache/dwm/stderr
    ;;
    *) exec $1;;
esac
