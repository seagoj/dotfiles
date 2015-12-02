#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

if [[ -f /etc/arch-release ]]; then
    export OS_TYPE=Arch
elif [[ -f /etc/redhat-release ]]; then
    export OS_TYPE=Debian
elif [[ "$(uname -s)" -eq "Darwin" ]]; then
    export OS_TYPE=Mac
fi

export INPUTRC=${HOME}/.inputrc

# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache

# ZSH Function Path
fpath=(
    ${HOME}/functions
    $fpath
)

# User Directories
export MEDIA=/mnt/media
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=${HOME}/dotfiles
if [[ -d /Volumes/code ]]; then
    export CODE=/Volumes/code
else
    export CODE=${HOME}/code
fi

# Vagrant
## Provider(virtualbox, parallels)
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Go
export GOPATH=${HOME}/go

# Browser
export BROWSER=$(which open google-chrome chromium-browser chromium firefox links2 links lynx | grep -m1 -e '^/')

# Editor
export EDITOR=$(which nvim vim nano | grep -m1 -e '^/')
export VISUAL=$(which macvim atom subl | grep -m1 -e '^/')
export PAGER='less'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Terminal
export TERMINAL=$(which termite urxvt xterm | grep -m1 -e '^/')

# Language
if [[ -z "$lang" ]]; then
    export LANG='en_US.UTF-8'
fi

# Executable Path
path=(
    $HOME/bin
    /usr/local/{bin,sbin}
    vendor/bin
    $HOME/.chefdk/gem/ruby/2.1.0/bin
    /opt/chefdk/bin
    $path
    $GOPATH/bin
    ./bin
)

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

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

export TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# Ruby
## Initialize rbenv
export RBENV_ROOT=${HOME}/.rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# Python
if [[ -d /Library/Frameworks/Python.framework/Versions/2.7/bin ]]; then
    path=(
        /Library/Frameworks/Python.framework/Versions/2.7/bin
        $path
    )
fi

# secrets
if [[ -f "${HOME}/.secrets" ]]; then
    source "$HOME/.secrets"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
