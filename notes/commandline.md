# Command Line 

Notes, tips and tricks for the command

## .bashrc vs .bash_profile

When you *login* (type your username and password) via console, either sitting at the machine or remotely via ssh: `.bash_profile` is executed to configure your shell before the initial commmand prompt.  

But if you've already logged into your machine and open a new terminal window (xterm) inside Gnome or KDE, then .bashrc is executed before the window command prompt. `.bashrc` is also run when you start a new bash instance by typing `/bin/bash` in a terminal. 

Most of the time you don't want to maintain two seperate config files for login and non-login shells - when you set a `PATH`, you want it to apply to both.  You can fix this by sourcing `.bashrc` from your `.bash_profile` file, then putting `PATH` and common settings in `.bashrc`. 

To do this, add the following lines to `.bash_profile`:

    if [ -f ~/.bashrc ]; then 
        source ~/.bashrc
    fi

__Links__

- [.bash_profile vs .bashrc](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html)

## Moving Around

- `Ctrl+a` - move to start of the line
- `Ctrl+e` - move to end of the line
- `Cmd+f` - move forward a word
- `Cmd+b` - move backward a word
- `Ctrl+l` - clear the screen

## Cut and Paste

- `Ctrl+k` - cut fomr the cursor to the end of the line
- `Cmd+d` - cut from cursor to the end of the word
- `Cmd+Backspace` - cut from cursor to the start of word
- `Ctrl+w` - cut from cursor to previous whitespace


## History Commands

- `!!` - run the last command.  eg: `sudo !!` 
- `!$` - returns the last argument used. : eg: `git diff [file] ... git add !$`
- `!*` - returns all of the arguments previously used.  Useful if you screw up the command name
- `!:<number>` - returns the previous argument number


__Links__

- [Shortcuts to move faster on the command line](http://teohm.com/blog/2012/01/04/shortcuts-to-move-faster-in-bash-command-line/)
- [Get faster in bash](http://is.muni.cz/www/xsiska2/2014/08/01/get-faster-in-bash.html)j

## Find files containing a specifc text

The xargs command comes in really handy if you want to search for files containing a specific text/string. For example, if you want to find .txt files containing text 'abc', then this can be done in the following way:

`find -name "*.txt" | xargs grep "abc"`

[8 Practical Examples of Linux Xargs CLI](https://www.howtoforge.com/tutorial/linux-xargs-command/)

## Links

- [CLI: improved](https://remysharp.com/2018/08/23/cli-improved)
