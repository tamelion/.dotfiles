" Plugins {{{

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
	if &compatible
		set nocompatible " because we loViMprovement
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin()

NeoBundleFetch 'Shougo/neobundle.vim'      " Neobundle

" Vanity
NeoBundle 'chriskempson/base16-vim'        " coding colour schemes
NeoBundle 'bling/vim-airline'              " Status bar

" Helpers
NeoBundle 'Shougo/neosnippet'              " Snippeting
NeoBundle 'Shougo/neosnippet-snippets'     " Basic snippets
NeoBundle 'tpope/vim-fugitive'             " Git wrapper
NeoBundle 'tpope/vim-unimpaired'           " Useful macros using [ and ]
NeoBundle 'tpope/vim-repeat'               " Use . repeat for tpope plugins
NeoBundle 'tpope/vim-commentary'           " Quick commenting
NeoBundle 'tpope/vim-surround'             " Change surroundings
NeoBundle 'vim-scripts/YankRing.vim'       " Cycle yanks
NeoBundle 'Lokaltog/vim-easymotion'        " Move through vim
NeoBundle 'mbbill/undotree'                " Undo tree
NeoBundle 'jiangmiao/auto-pairs'           " Auto close brackets
NeoBundle 'mhinz/vim-startify'     		   " Most recently used
NeoBundle 'ervandew/supertab'              " Supertab

" Syntax
NeoBundle 'scrooloose/syntastic'           " Multi-language linting
NeoBundle 'mattn/emmet-vim'                " Emmet
NeoBundle 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
NeoBundle 'groenewege/vim-less'            " LESS syntax highlighing
NeoBundle 'othree/html5.vim'               " HTML5 recognition
NeoBundle 'ap/vim-css-color'               " CSS colour of hex values
NeoBundle 'jelera/vim-javascript-syntax'   " Better JS indentation
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" Other crazy stuff
NeoBundle 'vim-scripts/vimwiki'            " vimwiki

call neobundle#end()

" Enable plugin and indent filetypes
filetype plugin indent on

" Check for bundles which need installing
NeoBundleCheck

"}}}
"  General {{{

" Sets how many lines of history VIM has to remember
set history=1000
" Change directory to the current buffer when opening files.
set autochdir
" save changed files dialog
set confirm
" Backup and swap
set nobackup noswapfile
" Session options (when saving)
set sessionoptions=blank,buffers,curdir,folds,tabpages,winpos,winsize
" Set utf8 as standard encoding
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Background without write
set hidden
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" Search - ignore case, unless capital typed, jump as you type
set ignorecase smartcase incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" No annoying sound on errors
set noerrorbells novisualbell t_vb= tm=500
" Display line numbers
set number
" Always show the status line
set laststatus=2
" Give terminal vim a title
set title
" Scrolloff
set so=999
" Show matching brackets when text indicator is over them
set showmatch
" tab and manual indent sizes
set shiftwidth=4 tabstop=4
" Keep indent for new line, indent further after brackets
set autoindent smartindent
" Line wrap
set wrap
" Join comments
set formatoptions+=j
" Persistent undo
set undofile
set undodir=~/.vim/undo

" }}}
" Colours and fonts {{{

set t_Co=256
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
colorscheme base16-tomorrow
" Transparency
hi Normal ctermbg=NONE
" Highlight current line
set cursorline
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Set extra options when running in GUI
if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=e  "remove GUI tabs
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set mouse-=a
	map <MiddleMouse> <nop>
	if has("gui_gtk2")
		set guifont=DejaVu\ Sans\ Mono\ 8
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
		" For CJK
		set guifontwide=NSimsun:h11
	endif
endif
" Characters to use in list
set listchars=trail:·,tab:»·

" }}}
" Built-in extensions {{{

""""" Netrw
" Netrw banner info off
let g:netrw_banner=0
" Netrw default to tree
let g:netrw_liststyle=3
" Netrw keep current dir same as browsing dir
let g:netrw_keepdir = 0

""""" Wildmenu
" Turn on the WiLd menu and add shell-style completion
set wildmode=list:longest
" Ignore files
set wildignore+=*/node_modules/*,*bower_components/* " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\bower_components\\* " Windows
set wildignore+=*.zip,*.exe,*.ini,*.db,*.ics,*.db,*.ics
set wildignore+=*.eot,*.ttf,*.woff,*.ico
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.svg,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

""""" Macros
"Enable extended % matching
runtime macros/matchit.vim

" }}}
" Plugin settings {{{

"" Airline
let g:airline_theme='base16'
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_section_b = '%{getcwd()}'

"" Neosnippet
let g:neosnippet#snippets_directory = '~/code/snippets'

"" Supertab
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabLongestEnhanced = 1
"let g:SuperTabLongestHighlight = 0

"" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_html_checkers = ['jshint', 'w3']

"" Undotree
let g:undotree_SetFocusWhenToggle = 1

"" Yankring
" Fix Y to y$ remap
function! YRRunAfterMaps()
	nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction
" Ignore
let g:yankring_ignore_operator = 'd/'
" History directory
let g:yankring_history_dir = '~/.cache/'

" }}}
"  Filetype specific {{{

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xhtml setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType vim setlocal foldmethod=marker

" }}}
" Mappings - overrides {{{

" Cycle buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

nnoremap <BS> :Startify<CR>

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

" Select last pasted
nnoremap gp `[v`]

" Easy on the pinky
"nnoremap ; :

" File browser
nnoremap <CR> :Explore<CR>

" For line wraps
nnoremap j gj
nnoremap k gk

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Switch CWD to the directory of the open buffer
nnoremap cd :cd %:p:h<CR>:pwd<CR>

" Easymotion
nmap f <Plug>(easymotion-s)

" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
vnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>
vnoremap kj <Esc>

" Resize windows
nnoremap <Left>  :10wincmd <<CR>
nnoremap <right> :10wincmd ><CR>
nnoremap <up>    :10wincmd +<CR>
nnoremap <down>  :10wincmd -<CR>

" }}}
" Mappings - leader {{{

" Map Leader
map <Space> <Leader>

" Saved searches
nnoremap <Leader>/u /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>S :w !sudo tee % > /dev/null<CR>
" Remove trailing space and re-indent file
nnoremap <Leader>= mzggvG@tgv=`z
" Buffers
nnoremap <Leader>b :ls<CR>:b
" Files
nnoremap <Leader>f :call DmenuOpen("e")<CR>
" Git status
nnoremap <Leader>g :Gstatus<CR>
" Create new file and set syntax
nnoremap <Leader>n :enew<CR>:set syntax=
" Open in browser
if has("gui_win32")
	nnoremap <Leader>o :silent !chrome "%"<CR>
else
	nnoremap <Leader>o :silent !google-chrome-beta %<CR>
endif
" Paste clipboard XML encoded (unimpaired), stripped of unicode and trailing space
"nmap <Leader>p "+[pmz`[v`][xgv@ugv@t`z
" Yankring
nnoremap <Leader>p :YRShow<CR>
" Session mappings
"nnoremap <Leader>ss :mks ~/.vim/session/
"nnoremap <Leader>so :so ~/.vim/session/
" Toggle undo tree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
" Fast open vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
" Reload .vimrc
nnoremap <Leader>V :so $MYVIMRC<CR>

" }}}
" Mappings - macros {{{

let @p = '/{"postload_img/: "/"vi"y/src/"ci"0?classd/src'

" Remove blank lines
let @l = ':g/^\s*$/d'
" Append a line break
let @b = 'A<br />'
" Make e-mail link from visual selection
let @e = 'a</a>gv"zyi<a href="mailto:z">'
" Translate carriage returns
let @r = ':s/\r\+$//e'
" Remove trailing space
let @t = ':s/\s\+$//e'
" Unicode replacements: quotes, hyphens, ellipses and spaces
let @u = ':s/“\|”/"/ge:s/‘\|’\|`/''/ge:s/–/-/ge:s/…/.../ge:s/﻿/\&#xfeff;/ge'
let @d = ':s/﻿/\&#160;/g'
" MRO img src
let @f = '^ivar f:as ='

" }}}
" Functions {{{

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("find . | dmenu `echo $DMENU_OPTIONS` -l 20 -p vim:" . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" }}}
