#vim: filetype=bash:
#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Source sandboxd
if [[ -s ${CODE}/sandboxd/sandboxd ]]; then
    source ${CODE}/sandboxd/sandboxd
fi

# Source alias files
for file in ${XDG_CONFIG_HOME:-$HOME/.config}/aliases/*.alias; do
    source "${file}"
done

# key bindings
bindkey '[1~' beginning-of-line   # Home
bindkey '[4~' end-of-line         # End

# assume path with no command is a cd command
setopt AUTO_CD

# 10 second delay on `$ rm *`
setopt RM_STAR_WAIT

# boilerplate zsh
setopt ZLE
setopt NO_HUP

# forces `$ exit` to quit zsh
setopt IGNORE_EOF

# don't disable input or output to the terminal
setopt NO_FLOW_CONTROL

# case insensitive globbing
setopt NO_CASE_GLOB

setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

# arrays are used as expected in zsh scripts
setopt RC_EXPAND_PARAM

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

# set geeknote editor
if which geeknote >/dev/null && [[ "$EDITOR" != "$(geeknote settings | grep "Current editor: " | sed 's/Current editor: //g')" ]]; then
    geeknote settings --editor $EDITOR >/dev/null
fi

# initialize fasd
if which fasd >/dev/null; then
    eval "$(fasd --init auto)"
else
    echo "fasd is not installed.";
fi

if [[ -s ${HOME}/.iterm2_shell_integration.zsh ]]; then
    source ${HOME}/.iterm2_shell_integration.zsh
fi

if [[ -s ${HOME}/.xsh ]]; then
    source ${HOME}/.xsh
fi

if [[ -s $CODE/sourcerer/sourcerer.sh ]]; then
    source $CODE/sourcerer/sourcerer.sh
fi

if [[ -s $CODE/pomodoro/pomodoro.sh ]]; then
    source $CODE/pomodoro/pomodoro.sh
fi

if which dircolors >/dev/null; then
    eval "$(dircolors ${HOME}/.dircolors)"
fi

if which tag >/dev/null; then
    tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null; }
fi

if which rbenv >/dev/null; then
    if which sandbox >/dev/null; then
        sandbox_hook rbenv ruby
    else
        source $HOME/.sandboxrc
        sandbox_init_rbenv
    fi
fi

# Temporary Directories
if [[ ! -d "$TMPDIR" ]]; then
    mkdir -p -m 700 "$TMPDIR"
fi
if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
fi
