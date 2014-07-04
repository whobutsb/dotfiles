let mapleader=','

set nocompatible              " Use Vim mode, not vi mode
syntax on                     " turn on highlighting
set encoding=utf-8

" Options
set hidden                    " Edit multiple unsaved files at the same time
set confirm                   " Prompt to save unsaved changes when exits
set viminfo='1000,f1,<500,:100,/100,h   "Keep various historires between edits

" Search Options
set hlsearch            " highlight search terms 
set ignorecase          " Do case insensitive matching
set incsearch           " highlight matches as you type
set smartcase           " ignore case if search patten is all lowercase, case sensitive otherwise

" Insert (Edit) Options
set backspace=indent,eol,start  " Better handling of backspace key
set autoindent                  " Sane indenting
set nostartofline               " Emulate typical editor navigation behaviour
set nopaste                     " Start in normal (non-paste) mode
set smartindent                 " Smarter indenting
set formatoptions=tcqr          " Smart Comments

-
" Status / Command Line Options
set wildmenu                    " Better commandline completion
set wildmode=longest:full,full  " Expand match on first Tab complete
set showcmd                     " show (partial) command in status line
set showmode                    " show current mode we're in
set laststatus=2                " Always show a status line
set cmdheight=2                 " Prevent "Press Enter" messages
" set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v][%p%%\ line\ %l\ of\ %L]

" Status Line
augroup ft_statuslinecolor
    au!
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END
set statusline=%f       " Path
set statusline+=%m      " modified flag
set statusline+=%r      " readonly flag
set statusline+=w       " preview window flag
set statusline+=\       " space
set statusline+=%=      " right align
" Line and column position and counts
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" Interface Options
set guifont=Source\ Code\ Pro\ 14
set t_Co=256                    " Lotso colors
set number                      " show line numbers
set visualbell                  " Flash the screen instead of beeping on errors
set mouse=a                     " enable mouse usage (all modes) in terminals
set wrap                        " wrap lines
set showmatch                   " set show matching parenthesis
set title
set ruler
set cursorline
set expandtab                   " Expand tabs to spaces
" set list                        " Show invisible characters
" Quickly time out on keycodes but never time out on mappings 
set notimeout ttimeout ttimeoutlen=200

" Indentation Options
set tabstop=8                   " NEVER change this!
set shiftwidth=4                " number of spaces
set softtabstop=4               " ...each indent level 

" start vundler
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" core plugins
Bundle "gmark/vundle"
Bundle "scrooloose/nerdtree"
Bundle "altercation/vim-colors-solarized"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/syntastic"
Bundle "bling/vim-airline"
Bundle "majutsushi/tagbar"
Bundle "shawncplus/phpcomplete.vim"
Bundle "xsbeats/vim-blade"
Bundle "jelera/vim-javascript-syntax"
Bundle "ervandew/supertab"
Bundle "plasticboy/vim-markdown"


call vundle#end()
filetype plugin indent on     " Enable automatic settings based on file type

" theme 
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Disable Background Color Erase (BCE) so that color shemes
" work properly when Vim is used inside tmux and GNU scree.
if &term =~ '256color'
	set t_ut=
endif

" ctrlp.vim settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" abbreviations
abbr hte the
abbr accross across

" NERDTree 
nnoremap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Switch between buffers in the same window
" http://stackoverflow.com/questions/327411/how-do-you-prefer-to-switch-between-buffers-in-vim
map <C-Tab> :bnext <cr>
map <C-S-Tab> :bprevious <cr>

" Status Line
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" tab navigation 
 nnoremap <C-S-tab> :tabprevious<CR>
 nnoremap <C-tab>   :tabnext<CR>
 nnoremap <C-t>     :tabnew<CR>
 nnoremap tj :tabnext<CR>
 nnoremap tk :tabprev<CR>
 
 " PHP Syntax Highlighting
 let php_sql_query=1
 let php_htmlInStrings=1

" Tagbar
nmap <f8> :TagbarToggle<CR>
