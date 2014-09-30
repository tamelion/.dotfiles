" we loViMprovement
set nocompatible

" Plugins {{{

" turn off temporarily for vundle
filetype off

" add vundle to rtp and call
set rtp+=~/.vim/bundle/vundle.vim/
call vundle#rc()

Plugin 'gmarik/vundle.vim'              " vundle

" Vanity
Plugin 'ChrisKempson/vim-tomorrow-theme' " coding colour scheme
Plugin 'bling/vim-airline'              " Status bar

" Helpers
Plugin 'kien/ctrlp.vim'                 " Quick file opener
Plugin 'Lokaltog/vim-easymotion'        " move through vim
Plugin 'mbbill/undotree'                " Undo tree
Plugin 'Shougo/neocomplete.vim'         " Omnicompletion plus plus
Plugin 'Shougo/neosnippet'              " Snippeting
Plugin 'Shougo/neosnippet-snippets'     " Basic snippets
Plugin 'scrooloose/syntastic'           " multi-language linting
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'jiangmiao/auto-pairs'           " Auto close brackets
Plugin 'godlygeek/tabular'              " Line up text

" Language specific
Plugin 'tpope/vim-surround'             " changes tag surrounds
Plugin 'mattn/emmet-vim'                " Emmet
Plugin 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
Plugin 'groenewege/vim-less'            " LESS syntax highlighing
Plugin 'othree/html5.vim'               " HTML5 recognition
Plugin 'skammer/vim-css-color'          " CSS colour of hex values
Plugin 'pangloss/vim-javascript'        " Better JS indentation

" Other crazy stuff
Plugin 'vim-scripts/vimwiki'            " vimwiki
Plugin 'mhinz/vim-startify'             " startup menu
Plugin 'tomtom/tcomment_vim'            " quick commenting

"}}}
"  General {{{

" Sets how many lines of history VIM has to remember
set history=700
" Change directory to the current buffer when opening files.
"set autochdir
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
" Buffer gets hidden when closed
set hidden
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Search - ignore case, unless capital typed, highlight, jump as you type
set ignorecase smartcase hlsearch incsearch
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
" Give terminal ViM a title
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
" Persistant undo
set undodir='~/.vim/undo'
set undofile

" }}}
" Colours and fonts {{{

set t_Co=256
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
colorscheme Tomorrow-Night
" Highlight current line
set cursorline
""" Set extra options when running in GUI
if has("gui_running")
	set mouse-=a       "mouse OFF
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=e  "remove GUI tabs
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	if has("gui_gtk2")
		set guifont=Terminus\ 10
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
		" For CJK
		set guifontwide=NSimsun:h11
	endif
endif

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
set wildignore+=*.zip,*.exe
set wildignore+=*.eot,*.svg,*.ttf,*.woff,*.ico,*.db
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

""""" Macros
"Enable extended % matching
runtime macros/matchit.vim

" }}}
" Plugin settings {{{

""""" Airline
let g:airline_theme='tomorrow'
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_section_b = '%{getcwd()}'

""""" Ctrl-P
" Unlimited files
let g:ctrlp_max_files = 0
" Keep cache on exit
let g:ctrlp_clear_cache_on_exit = 0
" Ignore files
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }

""""" Neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Insert / delimiter for filename completion
let g:neocomplete#enable_auto_delimiter = 1
" Characters before keywords complete
let g:neocomplete#auto_completion_start_length = 1
" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

""""" Startify
let g:startify_custom_header = [
			\'     ____ _     _                   _ _           _ ',
			\'    / ___( ) __| | __ _ _   _      | (_)_ __ ___ | |',
			\'   | |  _|/ / _` |/ _` | | | |  _  | | | `_ ` _ \| |',
			\'   | |_| | | (_| | (_| | |_| | | |_| | | | | | | |_|',
			\'    \____|  \__,_|\__,_|\__, |  \___/|_|_| |_| |_(_)',
			\'                        |___/                       ',
			\ ]
" Specify for Windows
let g:startify_session_dir = '~/.vim/session'
let g:startify_files_number = 25

"""""" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

"""""" Undotree
let g:undotree_SetFocusWhenToggle = 1

" }}}
"  Filetype specific {{{

" Enable filetype plugins
filetype plugin on
filetype indent on

" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" HTML indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" }}}
" Mappings - overrides {{{

" Easy on the pinky
nnoremap ; :

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Easymotion
nnoremap f <Plug>(easymotion-s)

" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>

" Resize windows
nnoremap <left>  :10wincmd <<CR>
nnoremap <right> :10wincmd ><CR>
nnoremap <up>    :10wincmd +<CR>
nnoremap <down>  :10wincmd -<CR>

" }}}
" Mappings - leader {{{

" map Leader
map <Space> <Leader>
" map easy splits
nnoremap <Leader>\ <C-w>v
nnoremap <Leader>- <C-w>s
" Disable highlight
nnoremap <silent> <Leader>/ :noh<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
"nnoremap <Leader><S-Space> :set buftype=<CR>:w<CR>
nnoremap <Leader><S-Space> w !sudo tee > /dev/null %<CR>
" Switch buffer by name
nnoremap <Leader>b :CtrlPBuffer<CR>
" Switch CWD to the directory of the open buffer
nnoremap <Leader>c :cd %:p:h<CR>:pwd<CR>
" Close pane
nnoremap <Leader>d <C-w>c<CR>
" Close buffer (and pane)
nnoremap <Leader>D :bd<CR>
" Open operations
nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>f :CtrlP<CR>
" Switch or create windows
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>j <C-w>j
" Move windows
nnoremap <silent> <Leader>H <C-w>H
nnoremap <silent> <Leader>K <C-w>K
nnoremap <silent> <Leader>L <C-w>L
nnoremap <silent> <Leader>J <C-w>J
" Translate carriage returns, remove trailing space and re-indent
nnoremap <Leader>ii mz @r @t @i `z
" Fix unicode characters
nnoremap <silent> <Leader>iu :%s/’/'/ge<CR>:%s/\(“\|”\)/"/ge<CR>:%s/–/-/ge<CR>
" Remove blank lines
nnoremap <silent><Leader>i<space> :g/^\s*$/d<CR>
" Open startify menu
nnoremap <Leader>m :Startify<CR>
" Create new file and set syntax
nnoremap <Leader>n :enew<CR>:set syntax=
" Open in browser
if has("gui_win32")
	nnoremap <Leader>o :!cmd /cstart chrome.exe %<CR>
else
	nnoremap <Leader>o :!google-chrome-beta %<CR>
endif
" Paste last cut (not last delete)
nnoremap <Leader>p "0p
" Close window
"nnoremap <Leader>q <C-w>c<CR>
" Register list
nnoremap <Leader>r :reg<CR>
" Session mappings
"nnoremap <Leader>ss :mks ~/.vim/session/
"nnoremap <Leader>so :so ~/.vim/session/
" Session mappings using startify
nnoremap <Leader>ss :SSave<CR>
nnoremap <Leader>so :SLoad<CR>
nnoremap <Leader>sd :SDelete<CR>
" Toggle undo tree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
" Fast open vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
" Reload .vimrc
nnoremap <Leader>V :so $MYVIMRC<CR>

" }}}
" Mappings - macros {{{

" Append a line break
let @b = 'A<br />'
" Translate carriage returns
let @r = ':%s/\r\+$//e'
" Remove trailing space
let @t = ':%s/\s\+$//e'
" Re-indent whole file
let @i = 'gg=G'

" }}}

" Modeline to fold file:
" vim:foldmethod=marker:foldlevel=0
