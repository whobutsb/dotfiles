#!/usr/bin/env ruby

home = File.expand_path '~'
dotfiles_path = File.expand_path '~/dotfiles'

# # install homebrew
# `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`

# # homebrew packages
# brew_packages = ['ansible', 'autojump', 'brew-cask', 'composer', 'ffmpeg',
#                  'git-flow', 'gnupg','gnupg2', 'gpg-agent', 'keybase', 'mcrypt',
#                  'mycli', 'node', 'pass', 'php56', 'php56-mcrypt', 'pwgen', 'python',
#                  's3cmd', 'syncthing', 'task', 'the_silver_searcher', 'tmux',
#                  'tree', 'vim', 'wget', 'youtube-dl', 'zsh']

# # brew cask packages
# cask_packages = ['alfred', 'appdelete', 'beatport-pro', 'bettertouchtool',
#                  'caffeine', 'cyberduck', 'dropbox', 'firefox', 'google-chrome',
#                  'gpgtools', 'iterm2', 'menumeters', 'multibit', 'qlmarkdown',
#                  'sequel-pro', 'slack', 'sourcetree', 'spectacle', 'steam',
#                  'submlime-text', 'the-unarchiver', 'transmission', 'vagrant',
#                  'virtaulbox', 'vlc']

# dotfiles to symlink
dotfiles = ['taskrc','zshrc'];

# # install homebrew packages
# brew_packages.each do |package|
#     `brew install #{package}`
# end

# # install homebrew casks
# cask_packages do |package|
#   `brew cask install #{package}`
# end

# symlink dotfiles 
dotfiles.each do |file|
    target = File.join(home, ".#{file}")
    `ln -sf "#{File.join dotfiles_path, file}" "#{target}"`
end

