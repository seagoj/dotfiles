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
export XDG_FUNCTIONS_DIR=${HOME}/.local/functions

# ZSH Functions
export FUNCTIONS=${HOME}/functions
fpath=(
    $FUNCTIONS
    $fpath
)

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
## rbenv
path::add $HOME/.rbenv/bin
## Chef Ruby
path::add ${HOME}/.chefdk/gem/ruby/latest/bin
path::add /opt/chefdk/bin
## Ruby
path::add ${HOME}/.gem/ruby/2.0.0/bin
## Python
path::add --prepend /Library/Frameworks/Python.framework/Versions/2.7/bin
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
export CODE=${HOME}/code

# Vagrant
## Provider(virtualbox, parallels)
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Browser
export BROWSER=$(which firefox-developer-edition firefox chromium-browser chromium google-chrome google-chrome-stable links2 links lynx xdg-open open | grep -m1 -e '^/')

# Editor
export EDITOR=$(which nvim vim nano | grep -m1 -e '^/')
export EDITORGUI=$(which editor-gui nvim vim nano | grep -m1 -e '^/')
export VISUAL=$(which nvim macvim atom subl | grep -m1 -e '^/')
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Terminal
export TERMINAL=$(which termite urxvt xterm | grep -m1 -e '^/')

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

# Ruby
export RBENV_ROOT=${HOME}/.rbenv

# secrets
if [[ -f "${HOME}/.secrets" ]]; then
    source "$HOME/.secrets"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/env ]]; then
    # Source env files
    for file in ${XDG_CONFIG_HOME:-$HOME/.config}/env/*.env; do
        source "${file}"
    done
fi

export PROMPT_LEAN_VIMODE=1
export IDF_PATH=$HOME/code/esp-idf
export CONFIG_MANAGEMENT="${CODE}/config_management"
export API="${CONFIG_MANAGEMENT}"/puppet/bonfyre_app
export WEB="${CONFIG_MANAGEMENT}"/puppet/pyweb
# export IDF_PATH=$HOME/code/LuaNode/LuaNode_Esp32/esp-idf
