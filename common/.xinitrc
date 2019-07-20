#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# toggleDocked

# # configure trackpoint scroll
# xprop() { xinput set-prop "TPPS/2 IBM Trackpoint" "$@"; }
# xprop "Evdev Wheel Emulation" 1
# xprop "Evdev Wheel Emulation Button" 2
# xprop "Evdev Wheel Emulation Timeout" 200
# xprop "Evdev Wheel Emulation Axes" 6 7 4 5
# xprop "Device Accel Constant Deceleration" 0.95

xset r rate 200 50

xbindkeys &
setxkbmap -option caps:ctrl_modifier

session=${1:-bspwm}

case $session in
    awesome)
        exec dockd --daemon&
        exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
        ;;
    xfce) exec xfce;;
    bspwm)
        exec bspwm 2>~/.bspwm.err
        ;;
    *) exec $1;;
esac
