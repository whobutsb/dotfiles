export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If not running interactively, don't do anything
[ -z "$PS1" ] && return 

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="dst"
ZSH_THEME="tjkirch"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(pass taskwarrior colored-man keybase)

# Files to Source
source $ZSH/oh-my-zsh.sh

for file in ~/dotfiles/{exports,aliases,my_functions}; do
    [ -r "$file" ] && . "$file"
done
unset file

COMPLETION_WAITING_DOTS="true"

# Antigen 
ANTIGEN=$HOME/dotfiles/zsh/antigen

source $ANTIGEN/antigen.zsh
#antigen use oh-my-zsh
antigen bundle $HOME/dotfiles/zsh/custom/plugins/virtualbox 
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sublime
antigen bundle git
antigen bundle osx
antigen bundle vagrant
antigen bundle web-search
antigen bundle vi-mode
antigen bundle pass
antigen bundle depressiveRobot/stash-aware
antigen bundle pip
antigen bundle vagrant

# Source Private Files
source $HOME/.private_aliases

# Autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

## Vim Mapping in ZSH
# http://dougblack.io/words/zsh-vi-mode.html
# https://github.com/hchbaw/opp.zsh
# Vi mode
bindkey -v
# # Kill lag when switch from normal to visual modes
export KEYTIMEOUT=1

bindkey '^R' history-incremental-search-backward

# allow homebrew to take over for php
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# pip should only run if there is a virutalenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# History Time Format
export HISTTIMEFORMAT="%T %d-%b-%Y "
