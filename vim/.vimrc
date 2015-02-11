set nocompatible	" be iMproved, required
filetype off		  " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplete'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'xsbeats/vim-blade'

" Colors
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/xoria256.vim'

"" Snippets
"" https://github.com/msanders/snipmate.vim
"" http://www.bestofvim.com/plugin/snipmate/
Plugin 'msanders/snipmate.vim'


call vundle#end()		    " required
filetype plugin indent on	" required	

" Disable background color erase so that color schemes
" work properly when Vim is used inside tmux
if &term =~ '256color'
	set t_ut=
endif

" Basic Options
let mapleader=','
set t_Co=256 		    " all the colors
set title		        " change the terminal title
set encoding=utf-8	    " show utf8 chars
set showcmd		        " count highlighted
set ruler		        " show where i'am in the command area
set showmode		    " show the current mode we are in
set laststatus=2	    " always show the status line
set mouse=a		        " use the mouse

set modelines=0		    " dont read first/last lines of file for settings
set hidden		        " stash unwritten files in buffer
set vb			        " dont beep at me
set cursorline		    " highlight current line
set scrolloff=3		    " start scrolling when i'm 3 lines from top/bottom
set history=1000	    " remember commands and search history
set backspace=indent,eol,start		    " backspace over indent, eol, and insert
set binary		        " don't add empty newlines at the end of files
set noeol

set number		        " show line numbers
set wrap		        " turn on linewrap
" set list		        " show invisible chars
set tabstop=4		    " 4 spaces
set shiftwidth=4	    " indent by 4 spaces when using >>, <<, ==, etc
set softtabstop=0	    " indent 4 spaces when pressing <TAB>
set expandtab		    " use softtabstop spaces instead of tab characters for indentation 
set modelines=0

set hlsearch            " highlight my search
set incsearch           " incremental search
set wrapscan            " set the search scan to wrap around the file

set ignorecase          " when searching
set smartcase           " unless I use an uppercase character

syntax on                   " syntax highlighting
syntax sync minlines=256    " makes big files slow
set synmaxcol=2048          " alos long lines are slow
set autoindent              " keep indentation from previous line
set copyindent
set smartindent             " automatically insert indentation in some cases
set cindent                 " like smart indent, but stricter, and more customisable 
set formatoptions=tcqr      " smart comments

if has ("autocmd")
    " File type detection. indent based on filetype. Recommended.
    filetype plugin indent on
endif

" no backup or swap files
set nobackup
set nowritebackup
set noswapfile

" Color Scheme
set background=dark
" colorscheme molokai
" colorscheme solarized
colorscheme xoria256

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set clipboard=unnamed
    endif
endif

" Airline Settings
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTree configuration
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '\.DS_Store', '\.git$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30

" Add <leader> t to open NerdTree
nnoremap <leader>t :NERDTreeToggle<cr>
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$\|node_modules\|DS_Store\|git'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>g :CtrlPTag<CR>
noremap <leader>r :CtrlPBufTag<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'

" if silver surfer plugin is installed use 
" this to search with CtrlP, much faster
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --stats -g  ""'
    let g:ctrlp_use_caching=0
endif

" EasyMotion Configuration
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1

" Easy Motion Search
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" NeoComplete Settings
if v:version >= 704 && has("lua")
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " I will probably never hit <TAB> 10 times
    let g:neocomplete#max_list = 10

    " Automatically open and close the popup menu / preview window
    " https://github.com/JessicaKMcIntosh/TagmaBufMgr/issues/8
     au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
     set completeopt=menuone,menu,longest
     
     " define dictionary
     let g:neocomplete#sources#dictionary#dictionaries = {
           \ 'default' : '',
           \ 'vimshell' : $HOME.'/.vimshell_hist',
           \ 'scheme' : $HOME.'/.gosh_completions'
               \ }

     " define keywords
     if !exists('g:neocomplete#keyword_patterns')
         let g:neocomplete#keyword_patterns = {}
     endif
     let g:neocomplete#keyword_patterns['default'] = '\h\w*'

     " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

     " Recommended key-mappings.
     " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
         return neocomplete#smart_close_popup() . "\<CR>"
         " For no inserting <CR> key.
         " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction

    " <TAB> completion
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    " inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " Enable omni completion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP

    " enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:airline_enable_syntastic = 1

" Mappings

" get ride of Ex mode, its dumb and i don't use it
nnoremap Q <nop>

" remap : to ;, make life easier using commands
nnoremap ; :
nnoremap : ;

" remap ESC to jk
inoremap jk <ESC>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Moving in splits
nnoremap <C-J> <C-W><C-J>    " CTRL+j move down a split
nnoremap <C-K> <C-W><C-K>    " CTRL+k move up a split
nnoremap <C-L> <C-W><C-L>    " CTRL+l move right a split
nnoremap <C-H> <C-W><C-H>    " CTRL-h move left a split

" use the arrow keys to resize the windows
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

"" Buffer nav
noremap ,q :bp<CR>
noremap ,w :bn<CR>

"" Close buffer
noremap ,c :bd<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" Shift Tab creates a new tab
nnoremap <silent> <S-t> :tabnew<CR>

" Marks"
nnoremap <leader>m :marks<CR>

" Save the page with ctrl+s
noremap <Leader>s :w<CR>

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" hit ,f to find the definition of the current class
" generate tags: ctags -f tags --languages=PHP -R
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" Set the 80th column
if(exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=235
endif