# configure LCD panel
bspc monitor LVDS1 -d I II III IV V

# configure external monitor
if xrandr -q | grep -q "DP2 connected"; then
    xrandr --output DP2 --mode 3840x2160 --right-of LVDS1
    bspc monitor DP2 -d VI VII VIII IX X
fi
