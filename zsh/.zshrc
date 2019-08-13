#vim: filetype=bash:
#
# User configuration sourced by interactive shells

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Source alias files
for file in ${XDG_CONFIG_HOME:-$HOME/.config}/aliases/*.alias; do
    source "${file}"
done

for file in ${XDG_FUNCTIONS_DIR:-$HOME/.local/functions}/sourced/*.sh; do
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

# enable vim mode
bindkey -v

# Long running history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt inc_append_history extendedglob share_history

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

if [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/rc ]]; then
    # source application specific settings
    for file in ${XDG_CONFIG_HOME:-$HOME/.config}/rc/*rc; do
        source "${file}"
    done
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

if which dircolors >/dev/null && [[ -f "${HOME}/.dircolors" ]]; then
    eval "$(dircolors ${HOME}/.dircolors)"
fi

# if which tag >/dev/null; then
#     alias_file=${TAG_ALIAS_FILE:-/tmp/tag_aliases}
#     tag_alias_dir=$(dirname $alias_file)
#     if [[ ! -d "$tag_alias_dir" ]]; then
#         mkdir -p $tag_alias_dir
#     fi
#     tag() { command tag "$@"; source $alias_file 2>/dev/null; }
# fi

# Temporary Directories
if [[ ! -d "$TMPDIR" ]]; then
    mkdir -p -m 700 "$TMPDIR"
fi
if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
fi

# autoload bashcompinit; bashcompinit
# source /usr/local/etc/bash_completion.d/pass

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/seagoj/.sdkman"
[[ -s "/Users/seagoj/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/seagoj/.sdkman/bin/sdkman-init.sh"

# direnv
eval "$(direnv hook zsh)"

# # perl
# PATH="/home/jseago/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/jseago/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/jseago/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/jseago/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/jseago/perl5"; export PERL_MM_OPT;
