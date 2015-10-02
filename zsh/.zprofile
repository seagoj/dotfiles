# Executes commands at login pre-zshrc.

# Paths
export INPUTRC=~/.inputrc
if [[ -d /Volumes/code ]]; then
	export CODE=/Volumes/code
else
    export CODE=$HOME/code
fi
export MEDIA=/mnt/media
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=$HOME/dotfiles
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export GOPATH=$HOME/go
export FUNCTIONS=$HOME/functions
# export VAGRANT_DEFAULT_PROVIDER=parallels
# export LSCOLORS="exfxcxdxbxegedabagacad"
if [[ -f "~/.secrets" ]]; then
    source ~/.secrets
fi

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
else
    export BROWSER=$(which google-chrome chromium-browser chromium firefox links2 links lynx | grep -m1 -e '^/')
fi

# Editors
export EDITOR=$(which nvim vim nano | grep -m1 -e '^/')
export VISUAL=$(which macvim subl | grep -m1 -e '^/')
export PAGER='less'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
## Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

## Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

## Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  vendor/bin
  $HOME/bin
  /usr/local/bin
  $HOME/.chefdk/gem/ruby/2.1.0/bin
  /opt/chefdk/bin
  $path
  $GOPATH/bin
  ./bin
)

# Less
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
