# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

export DOTFILES=$HOME/dotfiles

# homebrew

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='subl'
fi

# nvm - Node version manager

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# rvm - Ruby version manager

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Users/mika/.rvm/gems/ruby-2.2.0/bin/scss-lint"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# scm_breeze – Git shorthands

[ -s "/Users/mika/.scm_breeze/scm_breeze.sh" ] && source "/Users/mika/.scm_breeze/scm_breeze.sh"

# Locales are importants

export LC_ALL=fi_FI.UTF-8
export LANG=fi_FI.UTF-8

# Plugins

plugins=(git osx ruby rake)

# Plugins config

# Need bigger ulimit
ulimit -n 4096

# go

export GOPATH=$HOME/gocode
export PATH="$PATH:$HOME/gocode/bin" # Add RVM to PATH for scripting

# Import

source $DOTFILES/helpers.sh
export PATH="$PATH:$DOTFILES/bin"

# yarn

export PATH="$PATH:`yarn global bin`"

# Docker Hub

export DOCKER_ID_USER="aarreoskari"

# Docker Machine

# eval $(docker-machine env vm)
