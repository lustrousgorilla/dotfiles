
# Path to your oh-my-zsh installation.
export ZSH=/Users/gabriel/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mix ruby rake-fast bundler rails capistrano node yarn react-native kubectl osx brew
         asdf aws kubectl emacs dash chucknorris)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

## Shell ##
export EDITOR="emacs -nw"

## Elixir / Erlang ##
export ELIXIR_EDITOR="emacs"
# Enable iex history
export ERL_AFLAGS="-kernel shell_history enabled"

## Python ##
# Recent versions of Homebrew and OSX have switched from putting python in /usr/local/bin to /usr/local/opt/python/libexec/bin
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

## Go ##
export GOPATH="/Users/gabriel/Documents/code/go"
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/opt/libxml2/bin:$PATH"

# Look for Homebrew binaries first, then GNU Coreutils, and only then the default
# BSD utils shipped with OSX
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app/'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app/'
alias code="cd ~/Documents/code"
alias ssh_rowland="ssh gabe@rowland.linux_app_server"
alias docker_rm_containers="docker ps -aq --no-trunc -f status=exited | xargs docker rm"
alias docker_prune_imgs="docker rmi $(docker images -qa -f "dangling=true")"

# Load nodenv automatically by appending
# the following to ~/.zshrc:
# eval "$(nodenv init -)"

source $HOME/google-cloud-sdk/path.zsh.inc
source $HOME/google-cloud-sdk/completion.zsh.inc

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
