# Path to your oh-my-zsh configuration.i
export PATH=$PATH:$HOME/bin
export CODE=$HOME/code
export MEDIA=/mnt/media
export EDITOR=/usr/bin/vim
export BROWSER=$(which google-chrome chromium-browser chromium firefox links2 links lynx | grep -Pm1 '^/')
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=$CODE/dotfiles

# Example aliases
# alias zshconfig="$EDITOR ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=2

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# START SSH_AGENT
eval $(ssh-agent)
ssh-add

autoload $HOME/functions/*(:t)

source $HOME/antigen.zsh
antigen-use oh-my-zsh

antigen-bundles <<EOBUNDLES
git
npm
ruby
gem
python
archlinux
vagrant
systemd
redis-cli
zsh-users/zsh-syntax-highlighting
EOBUNDLES

#antigen-theme garyblessington
#antigen-theme theunraveler
#antigen-theme af-magic
#antigen-theme af-magic-custom
antigen-theme seagoj/js-magic js-magic

antigen-apply
