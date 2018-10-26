" vim: set fdm=marker foldenable foldlevel=0 nospell

set nocompatible        " be iMproved, required
filetype off            " required by vundle

" Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplete'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'junegunn/vim-peekaboo'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/neosnippet'
" vim-markdown-folding
" https://github.com/nelstrom/vim-markdown-folding
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'majutsushi/tagbar'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" vim table mode - https://github.com/dhruvasagar/vim-table-mode
Plugin 'dhruvasagar/vim-table-mode'

" Languages
Plugin 'tpope/vim-markdown'
Plugin 'sheerun/vim-polyglot'
Plugin 'avakhov/vim-yaml'
Plugin 'StanAngeloff/php.vim'

" https://github.com/chrisbra/csv.vim
Plugin 'chrisbra/csv.vim'
" Plugin 'arnaud-lb/vim-php-namespace'

" JSX Specific
Plugin 'mxw/vim-jsx'
Plugin 'yannickcr/eslint-plugin-react'

" Colors
" Plugin 'tomasr/molokai'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'vim-scripts/xoria256.vim'
Plugin 'jacoborus/tender'
" Plugin 'sjl/badwolf'

"" Snippets
"" https://github.com/msanders/snipmate.vim
"" http://www.bestofvim.com/plugin/snipmate/
Plugin 'msanders/snipmate.vim'

call vundle#end()               " required
filetype plugin indent on       " required

" }}}

" Options {{{
let mapleader=','
set ttyfast                     " testing this for speed
set t_Co=256                    " all the colors
set title                       " change the terminal title
set encoding=utf-8              " show utf8 chars
set showcmd                     " count highlighted
set ruler                       " show where i'am in the command area
set showmode                    " show the current mode we are in
set modeline
set modelines=5
set laststatus=2                " always show the status line
set mouse=a                     " use the mouse
set hidden                      " stash unwritten files in buffer
set vb                          " dont beep at me
set cursorline                  " highlight current line
set scrolloff=3                 " start scrolling when i'm 3 lines from top/bottom
set history=1000                " remember commands and search history
set backspace=indent,eol,start  " backspace over indent, eol, and insert
set number                      " show line numbers
set relativenumber              " use relative numbers
set wrap                        " turn on linewrap
set clipboard=unnamed           " set the clipboard to the system clipboard
" Always 4 spaces never tabs.  Hitting tab creates for spaces

set tabstop=4                   " 4 spaces
set shiftwidth=4                " indent by 4 spaces when using >>, <<, ==, etc
set softtabstop=4               " indent 4 spaces when pressing <TAB>
set expandtab                   " use softtabstop spaces instead of tab characters for indentation

set hlsearch                    " highlight my search
set incsearch                   " incremental search
set wrapscan                    " set the search scan to wrap around the file

set ignorecase                  " when searching
set smartcase                   " unless I use an uppercase character

syntax on                       " syntax highlighting
syntax sync minlines=256        " makes big files slow
set autoindent                  " keep indentation from previous line
set copyindent
set smartindent                 " automatically insert indentation in some cases
set cindent                     " like smart indent, but stricter, and more customisable
set formatoptions=tcqr          " smart comments

" Hidden Characters
set list                        " show hidden characters
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\

" no backup or swap files
set nobackup
set nowritebackup
set noswapfile

" color schemes
set background=dark
" colorscheme molokai
" colorscheme solarized
 colorscheme tender

" stuff to ignore
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig,.DS_Store
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" }}}

" Functions {{{
"
" Disable background color erase so that color schemes
" work properly when Vim is used inside tmux
if &term =~ '256color'
    set t_ut=
endif

" reload .vimrc whenever it is saved
au BufWritePost .vimrc so $MYVIMRC
if has ("autocmd")
    " File type detection. indent based on filetype. Recommended.
    filetype plugin indent on
endif

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set clipboard=unnamed
    endif
endif

" Set the 80th column
if(exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=234
endif

" Set the spaces to an arg.  usage: :SetSpaces 4
function! SetSpaces(arg)
    echo "settings spaces to: " . a:arg
    execute 'set tabstop=' . a:arg
    execute 'set shiftwidth=' . a:arg
    execute 'set softtabstop=' . a:arg
endfunction

command! -nargs=1 SetSpaces :call SetSpaces(<f-args>)

" }}}

" Plugin Options {{{

" FZF {{{
" https://github.com/junegunn/fzf.vim

set rtp+=/usr/local/opt/fzf

" Ignore .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

noremap <Leader>e :Files<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>r :Tags<CR>

" Key bindings for splits
let g:fzf_action = {
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~25%' }

" }}}

" Vim Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" NERDTree {{{
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
" }}}

" Silver Searcher (Ag) {{{
" this to search with CtrlP, much faster
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --stats -g  ""'
    let g:ctrlp_use_caching=0
endif
" }}}

" EasyMotion {{{
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1

" Easy Motion Search
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" }}}

" NeoSnippet {{{

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

let g:neosnippet#disable_runtime_snippets = { "_": 1, }

" let python use python and django snippets
" let g:neosnippet#scope_aliases = {}
" let g:neosnippet#scope_aliases['python'] = 'django,python'
" let g:neosnippet#scope_aliases['htmldjango'] = 'html,htmldjango'

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate.vim/snippets'

" }}}

" NeoComplete {{{
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
    " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
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
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" let g:syntastic_javascript_checkers = ['eslint'];
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:syntastic_html_tidy_ignore_errors = [
    \ '<html> proprietary attribute "class"',
    \ 'trimming empty <i>'
    \ ]
" }}}

" Match Tag Always  {{{
let g:mta_filetypes = {
    \ 'html': 1,
    \ 'xhtml': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'blade': 1
\}
" }}}

" Emmet {{{
" remap emmet leader to <C-Y>
let g:user_emmet_leader_key='<C-J>'

let g:user_emment_settings = {
\  'javascript.jsx': {
\     'extends': 'jsx',
\   },
\}

" }}}

" Yaml Indenting {{{

if exists("b:did_indent")
    finish
endif
"runtime! indent/ruby.vim
""unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent sw=2 et
setlocal indentexpr=GetYamlIndent()
setlocal indentkeys=o,O,*<Return>,!^F

function! GetYamlIndent()
    let lnum = v:lnum - 1
    if lnum == 0
        return 0
    endif
    let line = substitute(getline(lnum),'\s\+$','','')
    let indent = indent(lnum)
    let increase = indent + &sw
    if line =~ ':$'
        return increase
    else
        return indent
    endif
endfunction
" }}}
"
" Snipmate Snippets Variables {{{
let g:snips_author='Steve Barbera'
let g:author='Steve Barbera'
let g:snips_email='steve@customchannels.net'
let g:email='steve@customchannels.net'
" }}}

" vim-jsx {{{
" https://github.com/mxw/vim-jsx

" Allow jsx in normal JS files
let g:jsx_ext_required = 0

" }}}

" vim-commentary {{{
" https://github.com/tpope/vim-commentary
autocmd FileType blade setlocal commentstring={{--%s--}}

" }}}

" tagbar {{{
" https://github.com/majutsushi/tagbar

nmap <F8> :TagbarToggle<CR>

" }}}

" Surround {{{

" }}}

" }}}

" Mappings {{{

" set folding za to space space
nnoremap <space><space> za

" panic button
nnoremap <f9> mzggg?G`z

" set filetype to htmldjango -https://www.vim.org/scripts/script.php?script_id=1487
:command DjangoHtml execute 'setfiletype htmldjango'

" get ride of Ex mode, its dumb and i don't use it
nnoremap Q <nop>

" remap : to ;, make life easier using commands
nnoremap ; :
nnoremap : ;

" start an external command with a bang
nnoremap ! :!

" remap ESC to jk
inoremap jk <ESC>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Close All Buffers
noremap <Leader>Q :bufdo bd<cr>

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
cmap tra %s/\s\+$//

" pbcopy for OSX copy/paste
if has('macunix')
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" hit ,f to find the definition of the current class
" generate tags: ctags -f tags --languages=PHP -R
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" global find and replace
noremap S :%s//g<LEFT><LEFT>



" Python Django Mapping -
" https://code.djangoproject.com/wiki/UsingVimWithDjango#Mappings {{{

let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

" }}}
" }}}

" Autocmd Options {{{

" turn on spell checking for markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell

" spell check for git commits
  autocmd FileType gitcommit setlocal spell

" set folding method fo vimrc
  autocmd BufRead, .vimrc set fdm=marker

" python / django settings
  autocmd FileType python set sw=4
  autocmd FileType python set ts=4
  autocmd FileType python set sts=4

  autocmd FileType php set sw=4
  autocmd FileType php set ts=4
  autocmd FileType php set sts=4

  autocmd FileType javascript set sw=2
  autocmd FileType javascript set ts=2
  autocmd FileType javascript set sts=2

" }}}

" Vim Plugins to Test {{{

" https://github.com/wellle/targets.vim

" }}}
