"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'unix' : 'make -f make_unix.mak',
			\    },
			\ }
NeoBundle 'Shougo/vimshell.vim'

" NeoCompleteCache
" https://github.com/Shougo/neocomplcache.vim
NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'majutsushi/tagbar'

"" https://github.com/xolox/vim-session
" NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'

"" Snippets
"" https://github.com/msanders/snipmate.vim
"" http://www.bestofvim.com/plugin/snipmate/
NeoBundle 'msanders/snipmate.vim'

"" Color
NeoBundle 'tomasr/molokai'

"" Custom bundles
NeoBundle 'kshenoy/vim-signature'

"" NeoBundle 'shougo/neocomplete'
NeoBundle 'gregsexton/matchtag'

"" HTML Bundle
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'

"" PHP Bundle
NeoBundle 'arnaud-lb/vim-php-namespace'

"" Javascript Bundle
NeoBundle "scrooloose/syntastic"

"" Markdown Bundle
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'nelstrom/vim-markdown-preview'
NeoBundle 'nelstrom/vim-markdown-folding'

"" Blade Bundles
NeoBundle 'johnhamelink/blade.vim'

" Vim Start Screen
" https://github.com/mhinz/vim-startify
NeoBundle 'mhinz/vim-startify'

" Ag - The Silver Searcher
" https://github.com/rking/ag.vim
NeoBundle 'rking/ag.vim'

" Tabular
" https://github.com/godlygeek/tabular
NeoBundle 'godlygeek/tabular'

" Surround Vim
" https://github.com/tpope/vim-surround
NeoBundle 'tpope/vim-surround'

" JSHint
" https://github.com/walm/jshint.vim
NeoBundle 'walm/jshint.vim'

" Vim Easy-Motion
" https://github.com/Lokaltog/vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" allow plugins by file type
filetype on
filetype plugin on

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','
"let mapleader="\<Space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
set shell=/bin/zsh
set history=1000 " remember more than 20 previous searches/command

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme molokai

set mouse=a
set mousemodel=popup
set t_Co=256
" set cursorline
set guioptions=egmrti
set gfn=Monospace\ 8

if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	let g:CSApprox_loaded = 1

	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
	else
		if $TERM == 'xterm'
			set term=xterm-256color
		endif
	endif
endif

if &term =~ '256color'
	set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"*****************************************************************************
"" Backups
"*****************************************************************************

" set backupdir=~/.vim/backup

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"" NERDTree configuration
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30

" Add <leader> t to open NerdTree
nnoremap <leader>t :NERDTreeToggle<cr>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

"*****************************************************************************
"" Functions
"*****************************************************************************
function s:setupWrapping()
	set wrap
	set wm=2
	set textwidth=79
endfunction

function TrimWhiteSpace()
	let @*=line(".")
	%s/\s*$//e
	''
endfunction

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt
au BufRead,BufNewFile *.txt call s:setupWrapping()

"" make/cmake
au FileType make set noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

if has("gui_running")
	autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Get rid of Ex mode, its dumb and i dont need it
nnoremap Q <nop>

"" remap : to ;, make my life easier and open up more commands
nnoremap ; :
nnoremap : ;

"" Remap ESC to jk
inoremap jk <ESC>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <C-J> <C-W><C-J>    " CTRL+j move down a split
nnoremap <C-K> <C-W><C-K>    " CTRL+k move up a split
nnoremap <C-L> <C-W><C-L>    " CTRL+l move right a split
nnoremap <C-H> <C-W><C-H>    " CTRL-h move left a split

" Use the arrow keys to resize the windows
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gs :!git status<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :!git d<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gl :!git lg<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
"" Shift Tab creates a new tab
nnoremap <silent> <S-t> :tabnew<CR>

"" Marks
nnoremap <leader>m :marks<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Save the page with ctrl+s
noremap <Leader>s :w<CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'

" snippets
let g:snips_author='Steve Barbera'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" vim-airline
let g:airline_enable_syntastic = 1

"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhiteSpace()<cr>:let @/=''<CR>

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

"" Code Folding
set foldmethod=indent	" fold based on indent
set foldnestmax=10		" deepest fold is 10 levels
set nofoldenable		" dont fold by default
set foldlevel=1

"" Space to toggle folds
" nnoremap <Space> za
" vnoremap <Space> za

if has('macunix')
	" pbcopy for OSX copy/paste
	vmap <C-x> :!pbcopy<CR>
	vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap ,q :bp<CR>
noremap ,w :bn<CR>

"" Close buffer
noremap ,c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
" noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR>

"" Custom configs

"" Tagbar Toggle
nmap <F8> :TagbarToggle<CR>

"" Vim Markdown
"" disable folding
let g:vim_markdown_folding_disabled=0
"" set initial foldlevel
"" let g:vim_markdown_initial_foldlevel=1

"" Markdown Preview
noremap <leader>p :Mm<CR>:redraw!<CR>

" Turn off spellcheck 
set nospell

" Markdown syntax highlighting and spell check for .md files
" autocmd BufNewFile,BufRead *.md set ft=markdown spell

let g:javascript_enable_domhtmlcss = 1

"" NeoCompleteCache Settings

" use neocomplcache at startup
let g:neocomplcache_enable_at_startup = 1

" use smartcase
let g:neocomplcache_enable_smart_case = 1

" set minimum syntax keyboard length
let g:neocomplcache_min_syntax_length = 3

" highlight first canidate
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" neocomplcache dictonary
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS> close popup and delete backward char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
	let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

" Tabularize Mappings
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>

" if silver surfer plugin is installed use 
" this to search with CtrlP, much faster
if executable('ag')
	" Use ag in CtrlP
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --stats -g  ""'
	let g:ctrlp_use_caching=0
endif

" Easy Motion Configuration
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1

" Use Easy Motion for searches
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
