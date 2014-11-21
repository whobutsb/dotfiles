# Vim

Notes and thoughts on the dark arts of Vim.

## Abbreviations

Write them on the fly!

	:ab temlpate template

every time temlpate is spelled it will automatically be fixed


## Ag (The Silver Searcher)

	:Ag [options] {pattern} [directory]

Example, search for something in a certain file type

	:Ag --css ".widget"

## Buffers

Buffers are Vim's term for a "block of text stored in memory".

- `:e <filename>` - opens a new buffer with the contents of the file
- `:w <filename>` - save a buffer to a new location 
- `:ls` - lists the open buffers and buffer numbers
- `:b <buffer-number>` - switch to a specific buffer 
- `:bn` - next buffer
- `:bp` - previous buffer
- `:bd` - close buffer
- `:bd!` - close buffer without saving

## Code Folding

- `zi` - switch folding on and off
- `za` - toggle current fold open/closed
- `zc` - close the current fold
- `zR` - open all folds
- `zM` - close all folds
- `zv` - expand folds to reveal cursor

### Navigating

- `zj` - move down to the top of next fold
- `zk` - move up to bottom of previous fold

- `zf{motion}` - fold an area based on a motion. 

If you get "Cannot create flow with the current foldmethod" then change the
fold method type. 

	:set foldmethod=manual
	:help fold-methods

## CTags

Generating the CTags. Navigate to the project parent directory

	ctags -f php.tags --languages=PHP -R

Tell Vim to use the tag file: 

	:set tags+=~/path/to/php.tags

Search through the tags

	:tag /pattern // :tag /some_cool_class

- `CTRL-]` - jump to the definition 
- `CTRL-T` - jump back to where you were before

## EasyMotion

    Default Mapping      | Details
    ---------------------|----------------------------------------------
    <Leader>f{char}      | Find {char} to the right. See |f|.
    <Leader>F{char}      | Find {char} to the left. See |F|.
    <Leader>t{char}      | Till before the {char} to the right. See |t|.
    <Leader>T{char}      | Till after the {char} to the left. See |T|.
    <Leader>w            | Beginning of word forward. See |w|.
    <Leader>W            | Beginning of WORD forward. See |W|.
    <Leader>b            | Beginning of word backward. See |b|.
    <Leader>B            | Beginning of WORD backward. See |B|.
    <Leader>e            | End of word forward. See |e|.
    <Leader>E            | End of WORD forward. See |E|.
    <Leader>ge           | End of word backward. See |ge|.
    <Leader>gE           | End of WORD backward. See |gE|.
    <Leader>j            | Line downward. See |j|.
    <Leader>k            | Line upward. See |k|.
    <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
    <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
    <Leader>s            | Find(Search) {char} forward and backward.
                         | See |f| and |F|.

## External Commands !

Adding a dot in front of the command dumps the output on to the window. 

	:.! ls 

	:.! date " dumps the current date

Open the terminal in the background 

- `Ctrl-Z` - open the terminal 
- `fg` - open vim back up

## Filetypes

Set the filetype for a file

	:set filetype=php
	"" or
	:set ft=php

Set multiple file types with: 

	:set ft=html.php

this activates teh snippets for both HTML and PHP for the current file.


## Help in VimDoc

- `:` -  is used for command line/ex-mode commands (`:help :help`)
- `'` - is used for options (`:help 'incsearch'`)
- No prefix for normal mode commands (`:help CTRL-]`)
- `i_` - for insert mode (`:help i_CTRL-[`)
- `v_` - for visual mode (`:help v_CTRL-]`)

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

## Marks

- `m{a-zA-Z}` - Set Mark {a-zA-Z} at cursor position. 
- `` `{a-zA-Z} `` - Move to mark 
- `:marks ` - List all the current marks (not a motion command)
- `,m` - lists the marks
- `m,` - place next available mark
- `m.` - if no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
- `m-` - Delete all marks from teh current line
- `m<Space>` - delete all marks from the current buffer
- `'?` - open location list and display local marks

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
- `,p` - preview the markdown file in the browser

After previewing the file the vim buffer will disappear.  Need to use `:redraw!` to fix the screen. Fixed in my config with appending the command .vimrc :D.

_Links_

- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)

## Page Movement

- `Ctrl+b` - page up
- `Ctrl+f` - page down
- `Ctrl+u` - move up half a screen
- `Ctrl+d` - move down half a screen 
- `H` - move to the top of the screen 
- `M` - move to the middle of the screen 
- `L` - move to the bottom of the screen 
- `gg` - go to the top of the file
- `G` - go to the bottom of the file
- `zz` - move the current line to the middle of the screen
- `zt` - move the current line to the top of the screen
- `zb` - move the current line to the bottom of the screen

## PHP Specific Vim Tips

- `:php -l %` - lint the current php file

## Registers

Registers are simply containers that hold text.  They can be used in the manner of a clipboard for cutting, copying, and pasting text, or they can be used to record a macro by saving a sequence of keystrokes.  

## Scripting

__Links__

- [Scripting the Vim Editor, Part 1: Variables, values, and expressions](http://www.ibm.com/developerworks/library/l-vim-script-1/)

## Snippets

Using the plugin [snipmate](https://github.com/msanders/snipmate.vim).  More
info here:
[http://www.bestofvim.com/plugin/snipmate/](http://www.bestofvim.com/plugin/snipmate/)
Help file can be found at `:h snipMate.txt`.

Snippets can be defined in two places: `snippets/<filetype>/<trigger>.snippet`
or `snippets/<filetype>.snippets`

Reload a snippet on the fly with: `:call ReloadAllSnippets()`

## Tabs

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

Split two vertically split windows to horizontally split

	ctrl-W K 

Horizontally to vertically

	ctrl-W H

__Split Navigation__

Remapping for moving around the buffers

    nnoremap <C-J> <C-W><C-J>    " CTRL+j move down a split
    nnoremap <C-K> <C-W><C-K>    " CTRL+k move up a split
    nnoremap <C-L> <C-W><C-L>    " CTRL+l move right a split
    nnoremap <C-H> <C-W><C-H>    " CTRL-h move left a split

### Jumplist

Allows you to jump back and forth in where you were in the file.  - `Ctrl+o` - allows you to jump back to your last jump location 
- `Ctrl+i` - jump forward to the next location

## Tabularize

Helps with aligning text in Vim. https://github.com/godlygeek/tabular

Align a row of text with equals signs

	" highlight selection with visual mode
	" eg: 
	" one = 1
	" two = 2
	" three = 3
	:Tab[ularize] /=

More Info: 

[Vimcasts - aligning text with tabular](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)

## Vim Verbs

Two types of vim verbs.  Some of them act on a single character, the others act on a motion or text object. 

### Operators

- `c` - change
- `d` - delete
- `y` - copy to register

### Single character verbs

- `x` - Delete character under the cursor
- `r` - Replace character under cursor with another character
- `s` - Delete character under cursor and move to insert mode

### Multi-character verbs

- `d` - Delete text specified by motion 
- `c` - delete text specified by motion and go into insert mode
- `y` - copy text specified by motion

###  Motions

- `$` - go to end of line
- `0` - move to the beginning of the line
- `w` - move forward one word
- `b` - move back one word
- `e` - move back one word
- `)` - move forward one sentence
- `}` - move forward one paragraph
- `G` - go to end of file
- `f.` - go to next occurrence of `.` on the current line
- `F.` - go to the previous occurrence of `.` on the current line
- `^` - go to beginning of the line

#### Words

-`aw` - a word (includes surrounding white space)
- `iw` - inner word (does not include surrounding white space)

#### Sentences

- `as` - a sentence
- `is` inner sentence

#### Paragraphs

- `ap` - a paragraph
- `ip` - inner paragraph

#### Tags

- `at` - a tag block
- `it` - inner tag block

#### Power

- `d$` - delete to the end of the line
- `cf)` - change though the next closing parentheses
- `yG` - copy everything through the end of the file 
- `cit` - change inside a tag

__Links__

- [Vim Text Objects: The Definitive Guide](http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)

### Undo and Redo

- `u` - undo your last action
- `CTRL+r` - redo last action

### Spell Check

Set the spell check in the `~/.vimrc`

    set spell spelllang=en_us

Disable spell check 

	set spell!

- `]s` - go to next misspelled word
- `[s` - go to last misspelled word
- `z=` - get some suggestions on the word
- `zg` - mark the misspelled word as correct
- `zw` - mark a good word as misspeleed

### Sorting

High selection of parameters in a function and run 

	:sort

### Repeating

- `.` - repeat the last normal mode command
- `n` - repeat the last search - `;` - repeat the last character-wise search
- `//` - repeat the last search
] `@:` - repeat the last ex-mode command
- `@@` - repeat the last macro used

## Visual Mode

- `v` - enter visual mode characterise
- `V` - enter visual mode line wise
- `CTRL-V` - enter visual mode block wise

_tip_: `o` switches cursor to the other corner. huge!

- `I<text><Esc>` - insert text before block on every line

## Windows

A window is a viewport on to a buffer.

- `<C-w>s` - split the current window horizontally
- `<C-w>v` - split the current window vertically
- `<C-w>w` - cycle between open windows
- `<C-w>c` - close the active window
- `<C-w>o` - keep only the active window, closing all others
- `<C-w>=` - equalize width and height of all windows
- `<C-w>_` - maximize height of the active window
- `<C-w>|` - maximize width of the active window
- `[N]<C-w>_` - set active window height to [N] rows
- `[N]<C-w>|` - set active window width to [N] columns
- `<C-w>T` - Move the current window into its own tab

## Links 

- [A Byte of Vim](http://files.swaroopch.com/vim/byte_of_vim_v051.pdf)
- [Learning Vim in 2014](http://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language/)
- [A Vim Primer](http://danielmiessler.com/study/vim/)
- [Vim for (PHP) Programmers](http://www.slideshare.net/ZendCon/vim-for-php-programmers-presentation?next_slideshow=1)
