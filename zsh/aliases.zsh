# I'm dumb
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
alias remote_ip="curl ifconfig.me/ip"

#Get the computer internal ip address
alias local_ip="ipconfig getifaddr en0; ipconfig getifaddr en1"

## Maestro and Artisan Alias
alias art="php artisan"
alias maestro_log="scp ccremix:/srv/www/maestro.customchannels.net/app/storage/logs/laravel.log ~/Desktop; open ~/Desktop/laravel.log"

# Syncthing
alias syncthing.start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.syncthing.plist"
alias syncthing.stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.syncthing.plist"
alias syncthing.restart="syncthing.stop && syncthing.start"
alias syncthing.browser="open http://127.0.0.1:8082"

# Nginx Commands
alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias nginx.config='vim /usr/local/etc/nginx'

# PHP-FPM 
alias php-fpm.start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"

alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias php-fpm.config='st /usr/local/etc/php/5.6'

alias php.cli="psysh"

# NGINX 
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'

# IceS
alias ices.config="st /usr/local/share/ices"

# MySQL
alias mysql.config="st /usr/local/Cellar/mysql/5.6.16"
alias mysql.dir="cd /usr/local/Cellar/mysql/5.6.16"

alias maestro.db.dev="mysql -h maestro.dev -u root -p"

# OSX Functions
if [ "$(uname -s)" = "Darwin" ]; then 

    alias chrome="open -a google\ chrome"
    alias firefox="/opt/homebrew-cask/Caskroom/firefox/38.0.5/Firefox.app/Contents/MacOS/firefox-bin -profilemanager"

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

# TMUX
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'

# S3CMD Configurations
alias s3cc='s3cmd -c ~/.s3cfg-customchannels'
alias s3sb='s3cmd -c ~/.s3cfg-personal'

