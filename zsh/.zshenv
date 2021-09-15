# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
. $HOME/.local/functions/path.sh
# INPUTRC
export INPUTRC=${HOME}/.inputrc
# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_FUNCTIONS_HOME=${HOME}/.local/functions
export XDG_SOURCE_HOME="$HOME"/.local/src

# # ZSH Functions
# export FUNCTIONS=${HOME}/functions
# fpath=(
#     $FUNCTIONS
#     $fpath
# )

# GPG
export GPG_TTY=$(tty)

# Gradle
export GRADLE_USER_HOME=/usr/local/opt/gradle/libexec

# Go
export GOPATH=${HOME}/go

# Path
## Local (s)bin
path::add --prepend /usr/local/{bin,sbin}
## Composer
path::add --prepend $HOME/.config/composer/vendor/bin
path::add --prepend --relative vendor/bin
## Node
path::add --prepend --relative node_modules/.bin
## Go
path::add ${GOPATH}/bin
## Chef Ruby
path::add ${HOME}/.chefdk/gem/ruby/latest/bin
path::add /opt/chefdk/bin
## Local Bin
path::add --relative ./bin
## Home Bin
path::add --prepend $HOME/.local/bin
## mos
path::add $HOME/.mos/bin
## esp
export PATH=$PATH:$HOME/.local/share/esp/xtensa-esp32-elf/bin
export PATH=$HOME/.toolchains/esp32/bin:$PATH
export PATH=$HOME/.toolchains/android/platform-tools:$PATH
## rust
path::add --prepend "${HOME}"/.cargo/bin
path::add "${XDG_FUNCTIONS_HOME}/installs"
path::add "${HOME}/.local/installs"
## fzf
path::add --prepend "${HOME}"/.fzf/bin

# Set OS_TYPE
if [[ -f /etc/arch-release ]]; then
    export OS_TYPE=Arch
elif [[ -f /etc/redhat-release ]]; then
    export OS_TYPE=Debian
elif [[ "$(uname -s)" -eq "Darwin" ]]; then
    export OS_TYPE=Mac
fi

# User Directories
export MEDIA=/mnt/media
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=${HOME}/dotfiles
export CODE="${HOME}"/.local/src

# Vagrant
## Provider(virtualbox, parallels)
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Browser
export BROWSER=$(which w3m firefox-developer-edition vimb-tabbed vimb firefox surf chromium-browser chromium google-chrome google-chrome-stable chrome browsh links2 links lynx xdg-open open | grep -m1 -e '^/')
# Editor
export EXPLORER=$(which fff vifm nnn ranger thunar | grep -m1 -e '^/')
export EDITOR=$(which nvim vim vi nano | grep -m1 -e '^/')
export EDITORGUI=$(which editor-gui nvim vim vi nano | grep -m1 -e '^/')
export VISUAL=$(which nvim macvim atom subl | grep -m1 -e '^/')
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Terminal
export TERMINAL=$(which st urxvt alacritty termite xterm | grep -m1 -e '^/')

# Language
if [[ -z "$lang" ]]; then
    export LANG='en_US.UTF-8'
fi

# Temporary Files
export TMPDIR="/tmp/$USER"
export TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d ${TMPDIR} ]]; then
    mkdir -p ${TMPDIR}
fi

# secrets
if [[ -f "${HOME}/.secrets" ]]; then
    source "$HOME/.secrets"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}"/.zprofile ]]; then
    source "${ZDOTDIR:-$HOME}"/.zprofile
fi
if [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}"/env ]]; then
    # Source env files
    for file in "${XDG_CONFIG_HOME:-$HOME/.config}"/env/*.env; do
        source "${file}"
    done
fi

. "$XDG_FUNCTIONS_HOME"/x.sh
# export PROMPT_LEAN_COLOR1="$(xColor color7)"
# export PROMPT_LEAN_COLOR2="$(xColor color4)"
# export PROMPT_LEAN_COLOR3="$(xColor color3)"
export PROMPT_LEAN_TMUX="侀 "
export PROMPT_LEAN_VIMODE=1
export PROMPT_LEAN_ABBR_METHOD="shrink"

export IDF_PATH=$HOME/code/esp-idf
# export IDF_PATH=$HOME/code/LuaNode/LuaNode_Esp32/esp-idf

if [[ -d "${HOME}"/documents/Arduino ]]; then
    export SKETCHBOOK_DIR="${HOME}"/documents/Arduino
else
    export SKETCHBOOK_DIR="${HOME}"/Arduino
fi

export WINHOME=/mnt/c/Users/jseago
