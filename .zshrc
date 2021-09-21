# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mika"

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

if [[ `uname -m` == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  export PATH="/usr/local/sbin:$PATH"
fi


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

# Load nodenv automatically by appending
# the following to ~/.zshrc:

eval "$(nodenv init -)"

nodenv shell 10.15.3

# rvm - Ruby version manager

export PATH="$PATH:$HOME/.rvm/bin"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# rbenv - Ruby env manager

# eval "$(rbenv init -)"

# pyenv

# eval "$(pyenv init -)"

# scm_breeze – Git shorthands

[ -s "/Users/mika/.scm_breeze/scm_breeze.sh" ] && source "/Users/mika/.scm_breeze/scm_breeze.sh"

# Locales are importants

export LC_ALL=fi_FI.UTF-8
export LANG=fi_FI.UTF-8

# Plugins

plugins=(git osx ruby kubetail)

# Plugins config

# Need bigger ulimit
ulimit -n 4096

# go

export GOPATH=$HOME/gocode
export PATH="$PATH:$HOME/gocode/bin"

# Import

source $DOTFILES/helpers.sh
export PATH="$PATH:$DOTFILES/bin"

# yarn

export PATH="$PATH:`yarn global bin`"

# Docker Hub

export DOCKER_ID_USER="aarreoskari"

# Kubernetes aliases

alias k='kubectl'
alias kg='kubectl get'

# iTerm shell integration
function iterm2_print_user_vars() {
  iterm2_set_user_var k8s_context '<context>'
  iterm2_set_user_var k8s_namespace '<namespace>'
  # iterm2_set_user_var k8s_context $(kubectl config current-context)
  # iterm2_set_user_var k8s_namespace $(kubectl config view --minify --output 'jsonpath={..namespace}')
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mika/code/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mika/code/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mika/code/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mika/code/bin/google-cloud-sdk/completion.zsh.inc'; fi

# Fuzzyness

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl delete'

# Make nano speak English instead of Finnish
alias nano='LANG=en_GB.UTF-8 /usr/local/bin/nano'

# Faster rubocop via daemon
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"
# export RUBOCOP_DAEMON_USE_BUNDLER=false

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
