# vim: filetype=sh:

# User configuration sourced by interactive shells

# zim template
source "${HOME}"/.zim-install/src/templates/zshrc
# source userland functions
source "${XDG_FUNCTIONS_HOME}"/sourced.sh
# source application specific settings
source_all "${XDG_CONFIG_HOME:-$HOME/.config}/rc.d"

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

# Disable pause/resume
stty -ixon

# infinite history
HISTSIZE=10000
HISTFILESIZE=10000
SAVEHIST=10000
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

if which dircolors >/dev/null && [[ -f "${HOME}/.dircolors" ]]; then
    eval "$(dircolors ${HOME}/.dircolors)"
fi

# Temporary Directories
if [[ ! -d "${TMPDIR}" ]]; then
    mkdir -p -m 700 "${TMPDIR}"
fi
if [[ ! -d "${TMPPREFIX}" ]]; then
    mkdir -p "${TMPPREFIX}"
fi

# # perl
# PATH="/home/jseago/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/jseago/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/jseago/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/jseago/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/jseago/perl5"; export PERL_MM_OPT;

source_file ~/.fzf.zsh
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
