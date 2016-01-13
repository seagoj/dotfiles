#vim: filetype=sh
#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Source alias files
for file in ${ZDOTDIR:-$HOME}/.aliases/*.alias; do
    source "${file}"
done

# key bindings
bindkey '[1~' beginning-of-line   # Home
bindkey '[4~' end-of-line         # End

# START SSH_AGENT
# eval $(ssh-agent)
# ssh-add

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
if which geeknote >/dev/null; then
    # geeknote settings --editor $EDITOR
else
    echo "geeknote is not installed.";
fi

# initialize fasd
if which fasd >/dev/null; then
    eval "$(fasd --init auto)"
else
    echo "fasd is not installed.";
fi

if [[ -f ${HOME}/.iterm2_shell_integration.zsh ]]; then
    source ${HOME}/.iterm2_shell_integration.zsh
fi

if [[ -f ${HOME}/.xsh ]]; then
    source ${HOME}/.xsh
fi

if [[ -f $CODE/sourcerer/sourcerer.sh ]]; then
    source $CODE/sourcerer/sourcerer.sh
fi

eval $(dircolors ${HOME}/.dircolors)
