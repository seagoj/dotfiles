wallpapers=($( ls "$XDG_CONFIG_HOME"/bspwm/wallpaper/* ))
wallpaper="${wallpapers[$RANDOM % ${#wallpapers[@]}]}"

# set wallpaper
feh --bg-scale "$wallpaper"
