# Path to your oh-my-zsh configuration.
export PATH=vendor/bin:$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/2.0.0/bin
export INPUTRC=~/.inputrc
export CODE=$HOME/code
export MEDIA=/mnt/media
export EDITOR=$(which vim nano | grep -m1 -e '^/')
export BROWSER=$(which google-chrome chromium-browser chromium firefox links2 links lynx | grep -m1 -e '^/')
export WWW=/var/www
export DOCROOT=/var/www
export DOTFILES=$CODE/dotfiles
export LANG=en_US.UTF-8

# Key Bindings
bindkey '\e[7~' beginning-of-line   # Home
bindkey '\e[8~' end-of-line         # End

# Example aliases
# alias zshconfig="$EDITOR ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dev=". dev"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=2

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# START SSH_AGENT
eval $(ssh-agent)
ssh-add

# Set geeknote editor
geeknote settings --editor $EDITOR

autoload $HOME/functions/*(:t)

source $HOME/antigen/antigen.zsh
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

eval "$(fasd --init auto)"

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi
