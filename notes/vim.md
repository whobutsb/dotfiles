# Vim

Notes and thoughts on the dark arts of Vim.

## Marks

- `m{a-zA-Z}` - Set Mark {a-zA-Z} at cursor position. 
- `` `{a-zA-Z} `` - Move to mark 
- `:marks ` - List all the current marks (not a motion command)
- `,m` - lists the marks
- `m,` - place next available mark
- `m.` - if no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
- `m-` - Delete all marks from teh current line
- `m<Space>` - delete all marks from the current buffer
- `'?` - open location list and display local marks'?` - open location list and display local marks

## Markdown Options

- `]]` - go to next header
- `[[` - go to previous header
- `][` - go to next sibling header 
- `[]` - go to previous sibling header 
- `]c` - go to current header
- `]u` - got to parent header
- `:Toc` - create a vertical split of table of contents 
- `:Toch` - create a horizontal split of the TOC 
- `:Toct` - create a new tab with TOC

_Links_

- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)

## Splits / Buffers / Tabs

*Movement around the page* 

- `Ctrl+b` - page up
- `Ctrl+f` - page down
- `Ctrl+u` - move up half a screen
- `Ctrl+d` - move down half a screen 
- `H` - move to the top of the screen 
- `M` - move to the middle of the screen 
- `L` - move to the bottom of the screen 
- `gg` - go to the top of the file
- `G` - go to the bottom of the file


*Buffers*

Buffers are Vim's term for a "block of text stored in memory".

- `:e <filename>` - opens a new buffer with the contents of the file
- `:w <filename>` - save a buffer to a new location 
- `:ls` - lists the open buffers and buffer numbers
- `:b <buffer-number>` - switch to a specific buffer 
- `:bn` - next buffer
- `:bp` - previous buffer
- `:bd` - close buffer

*Tabs* 

- `:tabedit <filename>` - edit a specified file in a new tab
- `:tabfind <filename>` - open a new tab with filename given, searching the 'path' to find it
- `:tabclose` - close current tab
- `:tabonly` - close all other tabs
- `gt` - next tab
- -`Gt` - previous tab

__Links__

- [Using tab pages - Vim Wiki](http://vim.wikia.com/wiki/Using_tab_pages)

*Splits*

- `ctrl+w q` - close split

Create a vertical split using `:vsp` and horizontal `:sp`. 

    :vsp ~/.vimrc

You can specify the new split height by prefixing with a number: 

    :10sp ~/.zshrc

__Split Navigation__

Remapping for moving around the buffers

    nnoremap <C-J> <C-W><C-J>    " CTRL+j move down a split
    nnoremap <C-K> <C-W><C-K>    " CTRL+k move up a split
    nnoremap <C-L> <C-W><C-L>    " CTRL+l move right a split
    nnoremap <C-H> <C-W><C-H>    " CTRL-h move left a split

### Jumplist

Allows you to jump back and forth in where you were in the file.

- `Ctrl+o` - allows you to jump back to your last jump location 
- `Ctrl+i` - jump forward to the next location

## Vim Verbs

Two types of VIm verbs.  Some of them act on a single character, the others act on a motion or text object. 

### Operators

- `c` - change
- `d` - delete
- `y` -rcopy to register

### Single character verbs

- `x` - Delete character under the cursor
- `r` - Replace character under cursor with another character
- `s` - Delete character under curosor and move to insert mode

### Multi-character verbs

- `d` - Delete text specified by motion 
- `c` - delete text specified by motion and go into insert mode
- `y` - copy text specifed by motion

###  Motions

- `$` - go to end of line
- `0` - move to the beginning of the line
- `w` - move forward one word
- `b` - move back one word
- `e` - move back one word
- `)` - move forward one sentence
- `}` - move foward one paragraph
- `G` - go to end of file
- `f.` - go to next occurence of `.` on the current line
- `F.` - go to the previous occurence of `.` on the current line
- `^` - go to beginning of the line

__Power__

- `d$` - delete to the end of the line
- `cf)` - change though the next closing parentheses
- `yG` - copy everything through the end of the file 

### Undo and Redo

- `u` - undo your last action
- `CTRL+r` - redo last action

### Spell Check

Set the spell check in the `~/.vimrc`

    set spell spelllang=en_us

- `]s` - go to next misspelled word
- `[s` - go to last misspelled word
- `z=` - get some suggestions on the word
- `zg` - mark the misspelled word as correct
- `zw` - mark a good word as misspeleed

### Repeating

- `.` - repeat the last normal mode command
- `n` - repeat the last search
- `;` - repeat the last character-wise search
- `//` - repeat the last search
- `@:` - repeast the last ex-mode command
- `@@` - repeat the last macro used

## Find and Replace

- `:%s/find text/replacement text/g`  

## Key Commands 

- `<ESC>` - Escape Key
- `<C-G>` - CTRL-G
- `<Up>` - cursor up key
- `<C-LeftMouse>` - Control- left mouse click
- `<S-F11>` - Shifted functon key 11
- `<M-a>` - Meta- a ('a' with bit 8 set)
- `<M-A>` - Meta- A ('A' with bit 8 set)
- `<t_kd>` - "kd" termcap entry (cursor down key)

## Mappings Keys

Get a list of the current keys mappings

    :map 
    :map!

- `:verbose map <key>` - determine the script or plugin that defines a map for a key sequence

WIP - http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)

## CTags

Generating the CTags. Navigate to the project parent directory

	ctags -f php.tags --languages=PHP -R

Tell Vim to use the tag file: 

	:set tags=~/path/to/php.tags

## PHP Specific Vim Tips

- `:php -l %` - lint the current php file

## General Vim Links

- [Learning Vim in 2014](http://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language/)
- [A Vim Primer](http://danielmiessler.com/study/vim/)
