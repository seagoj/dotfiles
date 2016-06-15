#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

. $HOME/functions/path.sh

# INPUTRC
export INPUTRC=${HOME}/.inputrc

# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache

# ZSH Functions
export FUNCTIONS=${HOME}/functions
fpath=(
    $FUNCTIONS
    $fpath
)

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
path::add --prepend $HOME/bin

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
export BROWSER=$(which open google-chrome chromium-browser chromium firefox links2 links lynx | grep -m1 -e '^/')

# Editor
export EDITOR=$(which nvim vim nano | grep -m1 -e '^/')
export EDITORGUI=$(which editor-gui nvim vim nano | grep -m1 -e '^/')
# export VISUAL=$(which macvim atom subl | grep -m1 -e '^/')
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Terminal
export TERMINAL=$(which termite urxvt xterm | grep -m1 -e '^/')

# Language
if [[ -z "$lang" ]]; then
    export LANG='en_US.UTF-8'
fi

# Less
if which less >/dev/null; then
    export PAGER='less'
    # Less
    ## Set the default Less options.
    ## Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
    ## Remove -X and -F (exit if the content fits on one screen) to enable it.
    export LESS='-F -g -i -M -R -S -w -X -z-4'
    ## Set the Less input preprocessor.
    ## Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
    if (( $#commands[(i)lesspipe(|.sh)] )); then
        export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
    fi
fi

# Temporary Files
export TMPDIR="/tmp/$USER"
export TMPPREFIX="${TMPDIR%/}/zsh"

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
