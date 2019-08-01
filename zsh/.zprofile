# Executes commands at login pre-zshrc.

# Paths
## Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx ~/.xinitrc dwm
fi
