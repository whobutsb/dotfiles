# Vim

Notes and thoughts on the dark arts of Vim.

## Marks

- `m{a-zA-Z}` - Set Mark {a-zA-Z} at cursor position. 
- `` `{a-zA-Z} `` - Move to mark 
- `:marks ` - List all the current marks (not a motion command)

## Markdown Options

- `]]` - go to next header
- `[[` - go to previous header
- `][` - go to next sibiling header 
- `[]` - go to prvious sibling header 
- `]c` - go to current header
- `]u` - got to parent header
- `:Toc` - create a vertical split of table of contents 
- `:Toch` - create a horizontal split of the TOC 
- `:Toct` - create a new tab with TOC

_Links_

- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)

## Splits / Buffers

- `Ctrl+b` - move text up the window 
- `Ctrl+f` - move text down the window
- `H` - move to the top of the screen 
- `M` - move to the middle of the screen 
- `L` - move to the bottom of the screen 

Buffers are Vim's term for a "block of text stored in memory".

- `:e <filename>` - opens a new buffer with the contents of the file
- `:w <filename>` - save a buffer to a new location 
- `:ls` - lists the open buffers and buffer numbers
- `:b <buffer-number>` - switch to a specific buffer 
- `:bn` - next buffer
- `:bp` - previous buffer

### Jumplist 

Allows you to jump back and forth in where you were in the file. 

- `Ctrl+o` - allows you to jump back to your last jump location 
- `Ctrl+i` - jump forward to the next location 

### Splits

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

## Vim Verbs

Two types of VIm verbs.  Some of them act on a single character, the others act on a motion or text object. 

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
- `G` - go to end of file
- `f.` - go to next occurence of `.` on the current line
- `F.` - go to the previous occurence of `.` on the current line
- `^` - go to beginning of the line

__Power__

- `d$` - delete to the end of the line
- `cf)` - change though the next closing parentheses
- `yG` - copy everything through the end of the file 

_Links_

- [Learning Vim in 2014](http://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language/)
