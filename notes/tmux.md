# TMUX

One day I will learn and use this TMUX, for now here are my notes.  

## Installation

	sudo brew install // OSX

	// Ubuntu/Debian 
	sudo add-apt repository ppa:pi-rho/dev
	sudo apt-get update
	sudo apt-get install tmux

## Usage

Default Prefix `CTRL+b` 

Note: In Tyler's [config](https://github.com/thcipriani/dotfiles/blob/master/tmux.conf) he has his prefix set up to be ctrl+f. 

- `prefix :` - enter command mode for tmux
- `prefix + esc` - scroll back on the output `q` to quit

## Session Management

Sessions are useful for completely seperating work environments. 

- `tmux new -s session_name` - creates a new tmux session named session_name
- `tmux attach -t session_name` - attaches to an existing tmux session named session_name
- `tmux switch -t session_name` - swithces to an existing session named session_name
- `tmux kill-session -t session_name` - kills a session named session_name
- `tmux list-sessions | ls (prefix+s)` - lists existing sessions
- `tmux detach (prefix+d)` - detach the current attached session
- `tmux rename-session -t [current-name] [new-name] (prefix+$)` - rename a session 

## Windows (tabs)

Tmux has a tabbed interface, but its calls its tabs "Windows".

- `tmux new-window (prefix + c)` - create a new window
- `tmux select-window -t :0-9 (prefix + 0-9)` - move to the window based on index
- `tmux rename-window (prefix + ,)` - rename the current window
- `prefix + x` - kill window
- `prefix + w` - list windows

Shortcuts

- `c` - new window
- `,` - name window
- `w` - list windows
- `f` - find window
- `&` - kill window
- `.` - move window
- `,` - rename window

## Panes

- `prefix x` - kill pane
- `prefix %` - vertical split
- `prefix "` - horizontal split
- `prefix {` - switch pane position
- `prefix #}` - switch windows
- `prefix |` - max / un-max pane
- `prefix o` - swap panes

## Helpful Commands

- `tmux list-keys` - lists every bound keys
- `tmux list-commands` - lists event command and argument
- `tmux info` - lists out every session, window, pane, its pid, etc.
- `tmux source-file ~/.tmux.conf` - reloads the tmux config

## Cheat Sheets

- [Mohamed Alaa Cheatsheet](https://gist.github.com/MohamedAlaa/2961058)

## Links

- [A TMUX Primer](http://danielmiessler.com/study/tmux/)
- [Tmux: A Simple Start](http://www.sitepoint.com/tmux-a-simple-start/)
- [Knowledge Nuggest From My Tmux.conf](http://www.tylercipriani.com/2013/09/12/important-lines-in-my-tmux.html)
- [A tmux Crash Course](http://robots.thoughtbot.com/a-tmux-crash-course)
