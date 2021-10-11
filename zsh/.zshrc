# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# vim: filetype=sh:

# User configuration sourced by interactive shells

export FUNCTIONS=${HOME}/functions
# ZSH Functions
export FUNCTIONS=${HOME}/functions
fpath=(
		$FUNCTIONS
		$fpath
)

# source userland functions
source "${XDG_FUNCTIONS_HOME}"/sourced.sh
# source application specific settings
source_all "${XDG_CONFIG_HOME:-$HOME/.config}/rc.d"

# key bindings
bindkey '[1~' beginning-of-line		# Home
bindkey '[4~' end-of-line			# End

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

# oh wow!  This is killer...	try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.	Gnarlbot.
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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/seagoj/.sdkman"
[[ -s "/home/seagoj/.sdkman/bin/sdkman-init.sh" ]] && source "/home/seagoj/.sdkman/bin/sdkman-init.sh"
