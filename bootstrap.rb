#!/usr/bin/env

home = File.expand '~'
dotfiles = File.expand.path '~/dotfiles'

[aliaes bash_profile bashrc exports functions].each do |file|
	target = File.join(home, ".#{file}")
	`ln -sf "#{File.join dotfiles, file}" "#{target}"`
end