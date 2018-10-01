# I'm dumb, and will make mistakes, make things interactive
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Google Websearch
alias goog="google"

##   lr:  Full Recursive Directory Listing
#   #   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias l="ls -AFh"
alias la="ls -Alh"
alias ll="ls -l"

# File size
alias fs="stat -f \"%z bytes\""

# Reload the Source
alias reload_source="source ~/.zshrc && echo 'Source Reloaded'"

# Vim -> NeoVim
# alias vim="/usr/local/bin/nvim"
# alias vi="/usr/local/bin/nvim"
#alias vim="/usr/local/Cellar/vim/8.0.0596/bin/vim"
#alias vi="/usr/local/Cellar/vim/8.0.0596/bin/vim"

# ZSH
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Random Aliases
# Star Wars...just because
alias star_wars="telnet towel.blinkenlights.nl"
alias nyan="telnet nyancat.dakko.us"
alias speedtest="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

## Networking
#Get computers remote IP address
alias ip.remote="curl ifconfig.me/ip"

#Get the computer internal ip address
alias ip.local="ipconfig getifaddr en0; ipconfig getifaddr en1"

# Laravel
alias art="php artisan"

# Codeception
alias codecept="vendor/bin/codecept"

# Nginx Commands
alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias nginx.config='vim /usr/local/etc/nginx'

# PHP-FPM
alias php-fpm.start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.resttrt='php-fpm.stop && php-fpm.start'
alias php-fpm.config='vim /usr/local/etc/php/5.6'

# PHP Interactive Shell
alias php.cli="psysh"

# NGINX
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'

# OSX Functions
if [ "$(uname -s)" = "Darwin" ]; then

    alias chrome="open -a google\ chrome"
    alias firefox="/usr/local/Caskroom/firefox/38.0.5/Firefox.app/Contents/MacOS/firefox-bin -profilemanager"

    alias f="open -a Finder"

    # opens a file in preview mode
    alias preview="qlmanage -p"

    # alias yo="open -a Yojimbo"

    # Show and hide files in Finder
    alias showhidden="defaults write com.apple.Finder AppleShowAllFiles YES; killall -HUP Finder"
    alias hidehidden="defaults write com.apple.Finder AppleShowAllFiles NO; killall -HUP Finder"
fi

# Vagrant
alias vagrant.init='wget https://raw.githubusercontent.com/fideloper/Vaprobash/master/Vagrantfile'

# Git
alias gt='git tag -ln'
alias gs='git stash'
alias git.repo=GithubRepo

# TMUX
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

# S3CMD Configurations
alias s3cc='s3cmd -c ~/.s3cfg-customchannels'
alias s3sb='s3cmd -c ~/.s3cfg-personal'

# use brew ctags
alias ctags="`brew --prefix`/bin/ctags"
alias ctags.php="ctags -f tags --languages=PHP -R --append -V"

# run htop with sudo
alias htop='sudo htop'

# sshd commands
alias ssh.restart="sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist && sudo launchctl load /System/Library/LaunchDaemons/ssh.plist"

# return the current price of bitcoin
alias btc="curl rate.sx"

# return the recommended btc fee
alias btc.fee="curl -s https://bitcoinfees.21.co/api/v1/fees/recommended"

# return the current ethereum price
alias eth="curl -s https://www.bitstamp.net/api/v2/ticker_hour/ethusd/ | jq '.last'"

# geth client
# run geth --fast --cache=1024 to download blockchain
alias geth="~/Library/Application\ Support/Ethereum\ Wallet/binaries/Geth/unpacked/geth"

alias units="/usr/local/bin/gunits"

# backup music directory to S3
# alias backup.music="aws --profile steve s3 sync --storage-class STANDARD_IA --include '*' --exclude 'Podcasts/*' ~/Music s3://stevebarbera-backup/Music/"
alias backup.music='s3cmd -c ~/.s3cfg sync --progress --stats -H ~/Music/ s3://stevebarbera-backup/Music/ --no-delete-removed --storage-class STANDARD_IA --skip-existing --exclude "~/Music/iTunes/iTunes\ Media/Podcasts/*"'

# backup pictures to S3
alias backup.pictures="cd /Volumes/Carbon/Pictures && aws --profile steve s3 sync --storage-class STANDARD_IA /Volumes/Carbon/Pictures s3://stevebarbera-backup/Pictures/"

# backup movies to S3
alias backup.movies="cd /Volumes/Carbon/Movies && s3cmd -c ~/.s3cfg sync --progress --stats -H /Volumes/Carbon/Movies/ s3://stevebarbera-backup/Movies/ --no-check-md5 --skip-existing --storage-class=STANDARD_IA --no-delete-removed"

# change directory to ~/Notebooks directory and open jupyter notebooks
alias jnotebook='jupyter notebook --notebook-dir ~/Notebooks'

# runs a simplied man page
alias help="tldr"

alias cat="bat"
alias du="ncdu --color dark -rr -x"
alias stat="stat -x"

# use python3 by default
# alias python=python3
