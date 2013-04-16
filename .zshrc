# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export CODE=$HOME/code
export MEDIA=/mnt/media
export EDITOR=/usr/bin/vim
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=$CODE/dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gozilla"
#ZSH_THEME="custom"
ZSH_THEME="af-magic-custom"
#ZSH_THEME="clean"
#ZSH_THEME="frisk"

# Example aliases
alias zshconfig="sublime-text ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gitextras sublime ruby gem python archlinux vagrant systemd redis-cli )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin

# START SSH_AGENT
eval $(ssh-agent)
ssh-add
