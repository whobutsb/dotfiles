syntax on  " turn on highlighting
let mapleader=','

set nocompatible
set number " show line numbers
set backspace=indent,eol,start " make backspaces behave normally
set wrap "  wrap lines
set showmatch " set show matching parenthesis
set smartcase " ignore case if search patten is all lowercase, case sensitive otherwise
set smartindent
set autoindent
set hlsearch " highlight search terms 
set incsearch " highlight matches as you type
set ignorecase 
set title
set ruler
set encoding=utf-8
set cursorline

" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" core plugins
Bundle "gmark/vundle"
Bundle "scrooloose/nerdtree"
Bundle "altercation/vim-colors-solarized"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/syntastic"
Bundle "bling/vim-airline"

call vundle#end()
filetype plugin indent on

" theme 
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Default Tabs & Spaces
set tabstop=4 " a tab is four spaces

" ctrlp.vim settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" abbreviations
abbr hte the
abbr accross across

" NERDTree 
nnoremap <leader>t :NERDTreeToggle<cr>
let NerdTreeShowHidden=1

" Switch between buffers in the same window
" http://stackoverflow.com/questions/327411/how-do-you-prefer-to-switch-between-buffers-in-vim
map <C-Tab> :bnext <cr>
map <C-S-Tab> :bprevious <cr>

" Status Line
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
