# enable vi mode
set -o vi
 # Disable pause/resume
stty -ixon
 # Enable autocd
shopt -s autocd
# Inifinite history
HISTSIZE=
HISTFILESIZE=

# GPG
export GPG_TTY=$(tty)

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
