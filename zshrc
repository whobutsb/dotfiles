# source some options
source ${HOME}/dotfiles/zsh/checks.zsh
source ${HOME}/dotfiles/zsh/setopt.zsh
source ${HOME}/dotfiles/zsh/exports.zsh
source ${HOME}/dotfiles/zsh/aliases.zsh
source ${HOME}/dotfiles/zsh/functions.zsh

# aws auto complettion
# source /usr/local/bin/aws_zsh_completer.sh

# Source Private Files
source $HOME/.private_aliases

# Load Completions
# https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
# fpath($HOME/dotfiles/zsh/completions/_curl, $fpath)

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

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(pass taskwarrior colored-man keybase aws)

# Files to Source
source $ZSH/oh-my-zsh.sh

for file in ~/dotfiles/{aliases,functions}; do
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


# Autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

## Vim Mapping in ZSH
# http://dougblack.io/words/zsh-vi-mode.html
# https://github.com/hchbaw/opp.zsh
# Vi mode
# bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^x^e' edit-command-line

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
