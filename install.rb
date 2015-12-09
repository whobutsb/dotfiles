#!/usr/bin/env ruby

# home = File.expand_path '~'
dotfiles_path = File.expand_path '~/dotfiles'

# install homebrew
`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`

# homebrew packages
brew_packages = ['ansible', 'autojump', 'brew-cask', 'composer', 'ffmpeg',
                 'git-flow', 'gnupg','gnupg2', 'gpg-agent', 'keybase', 'mcrypt',
                 'mycli', 'node', 'pass', 'php56', 'php56-mcrypt', 'pwgen', 'python',
                 's3cmd', 'syncthing', 'task', 'the_silver_searcher', 'tmux',
                 'tree', 'vim', 'wget', 'youtube-dl', 'zsh']

# install homebrew packages
brew_packages.each do |package|
    `brew install #{package}`
end

# brew cask packages
cask_packages = ['alfred', 'appdelete', 'beatport-pro', 'bettertouchtool',
                 'caffeine', 'cyberduck', 'dropbox', 'firefox', 'google-chrome',
                 'gpgtools', 'iterm2', 'menumeters', 'multibit', 'qlmarkdown',
                 'sequel-pro', 'slack', 'sourcetree', 'spectacle', 'steam',
                 'submlime-text', 'the-unarchiver', 'transmission', 'vagrant',
                 'virtaulbox', 'vlc']

# install homebrew casks
cask_packages do |package|
  `brew cask install #{package}`
end

# dotfiles to symlink
dotfiles = ['taskrc','zshrc']

# symlink dotfiles 
dotfiles.each do |file|
    target = File.join(home, ".#{file}")
    `ln -sf "#{File.join dotfiles_path, file}" "#{target}"`
end

# Move the Snippets files into the correct directory
snippets_directory = File.join(dotfiles_path, '/vim/snippets')
Dir.foreach(snippets_directory) do |file|
    snippet = File.join("~/dotfiles/vim/snippets", file)
    target = File.join(home, "/.vim/bundle/snipmate.vim/snippets/#{file}")
    File.symlink(snippet, target)
    # `ln -sf "#{snippet}" "#{target}"`
end
