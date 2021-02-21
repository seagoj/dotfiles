# Executes commands at login pre-zshrc.

# Paths
## Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set default programs in global vars
export BROWSER=$(which firefox-developer-edition firefox chromium-browser chromium browsh links2 lynx | grep -m1 -e '^/')
export EXPLORER=$(which vifm nnn ranger thunar | grep -m1 -e '^/')
export EDITOR=$(which nvim vim vi nano | grep -m1 -e '^/')
export EDITORGUI=$(which editor-gui nvim vim vi nano | grep -m1 -e '^/')
export VISUAL=$(which nvim macvim atom subl | grep -m1 -e '^/')
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TERMINAL=$(which st urxvt alacritty termite xterm | grep -m1 -e '^/')
export READER=$(which zathura | grep -m1 -e '^/')

eval `ssh-agent`
ssh-add

# StartX
if [[ "$(tty)" = "/dev/tty1" && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    pgrep -x dwm || exec startx ~/.xinitrc dwm
fi


# below only executes in TTY
