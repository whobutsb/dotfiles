# ZSH notes

## Tips

- Open command in the $EDITOR

    CTRL+X CTRL+E

## Plugins

- OSX

## Shortcuts & Aliaes

Shortcut  | Action
---       | ---
CTRL+A    | Move to the Beginning of the line
CTRL+E    | Move to the end of the line
CTRL+U    | Clear the entire line
CTRL+K    | Clear the character on the line after the current cursor position
ESC+Backspace | Delete the word in front the cursor
CTRL+W    | Delete the word in front of the cursor
`CTRL+_`    | Undo the last change
!!        | Execute last command in history
!abc      | Execute last command in history beginning with `abc`
!abc:p    | Print last command in history  beginning with `abc`


**OSX Plugin**

- `tab` - open the current directory in a new tab
- `pfd` - return the path of the frontmost Finder window
- `pfs` - return the current Finder selection
- `cdf` - cd to the current finder directory
- `pushdf` - pushd to the current Finder directory
- `quick-look` - Quick Look a specfied file
- `man-preview` - open a specified man page in Preview
- `trash` - move a specified file to the Trash

ZSH Line Editing with Vi Mode

```
bindkey -v
```

*Kill the lag*

By default, there is a 0.4 second delay after you hit `ESC` key and when the mode
change is registered.  Reduce this delay to 0.1 seconds.

```
export KEYTIMEOUT=1
```

__Links__

- [My favorite Zsh features](http://code.joejag.com/2014/why-zsh.html)
- [Shortcuts to improve your bash & zsh productivity](http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html)
