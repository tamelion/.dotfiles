"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set up for Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" we loViMprovement
set nocompatible
" turn off temporarily for vundle
filetype off
" add vundle to rtp and call
set rtp+=~/.vim/bundle/vundle.vim/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/vundle.vim'                  " vundle
""""" Vanity
Plugin 'chriskempson/base16-vim'        " coding colour scheme
Plugin 'bling/vim-airline'              " Status bar
""""" Helpers
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
""""" Language specific
Plugin 'tpope/vim-surround'             " changes tag surrounds
Plugin 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
Plugin 'groenewege/vim-less'            " LESS syntax highlighing
Plugin 'othree/html5.vim'               " HTML5 recognition
Plugin 'skammer/vim-css-color'          " colour of hex values
Plugin 'pangloss/vim-javascript'        " Better JS indentation
Plugin 'marijnh/tern_for_vim'           " JS code analysis
""""" Other crazy stuff
Plugin 'vim-scripts/vimwiki'            " vimwiki
Plugin 'mhinz/vim-startify'             " startup menu
Plugin 'tomtom/tcomment_vim'            " quick commenting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" A buffer becomes hidden when it is abandoned
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
" Display line numbers (and relatively)
set number relativenumber
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow
" Highlight current line
set cursorline
" Set highlights for terminal
"hi CursorLine ctermbg=235
"hi CursorLineNr ctermbg=235
"hi LineNr ctermbg=235
"hi SignColumn ctermbg=235
"hi Pmenu ctermbg=235
""" Set extra options when running in GUI
if has("gui_running")
	set mouse-=a       "mouse off
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=e  "remove GUI tabs
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	if has("gui_gtk2")
		set guifont=Terminus\ 10
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
		" For CJK
		set guifontwide=NSimsun:h11
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on
" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Built-in extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set wildignore+=*.eot,*.svg,*.ttf,*.woff,*.ico
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls
""""" Macros
"Enable extended % matching
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""" Easymotion
nmap f <Plug>(easymotion-s)
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
""""" Neosnippet
" Complete snippet or move through menu
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings, functions and commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>
" Move a line or block of text using Meta+[jk]
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
" Resize windows
nnoremap <left>  :10wincmd <<CR>
nnoremap <right> :10wincmd ><CR>
nnoremap <up>    :10wincmd +<CR>
nnoremap <down>  :10wincmd -<CR>
" Command to save with sudo
cnoremap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings - leader (alphabetical)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader
map <Space> <leader>
" map easy splits
nnoremap <leader>' <C-w>v
nnoremap <leader>; <C-w>s
" Switch buffer by name
nnoremap <leader>b :CtrlPBuffer<CR>
" Switch CWD to the directory of the open buffer
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>
" Close buffer without closing window
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<cr>
" Open operations
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :Explore<CR>
" Switch or create windows
nnoremap <silent> <leader>h <C-W>h
nnoremap <silent> <leader>k <C-W>k
nnoremap <silent> <leader>l <C-W>l
nnoremap <silent> <leader>j <C-W>j
" Move windows
nnoremap <silent> <leader>H <C-W>H
nnoremap <silent> <leader>K <C-W>K
nnoremap <silent> <leader>L <C-W>L
nnoremap <silent> <leader>J <C-W>J
" Translate carriage returns, remove trailing space and re-indent
nnoremap <leader>i mz:%s/\r\+$//e<CR>:%s/\s\+$//e<CR>gg=G`z
" Open startify menu
nnoremap <leader>m :Startify<CR>
" Create new file and set syntax
nnoremap <leader>n :enew<CR>:set syntax=
" Close operations
nnoremap <leader>q <C-w>c<CR>
nnoremap <leader>Q :qa<CR>
" Rotate windows
nnoremap <leader>r <C-W>r
" Session mappings
"nnoremap <leader>ss :mks ~/.vim/session/
"nnoremap <leader>so :so ~/.vim/session/
" Session mappings using startify
nnoremap <leader>ss :SSave
nnoremap <leader>so :SLoad
nnoremap <leader>sd :SDelete
" Toggle undo tree
nnoremap <silent> <leader>u :UndotreeToggle<CR>
" Fast open vimrc
nnoremap <leader>v :e $MYVIMRC<CR>
" Disable highlight
nnoremap <silent> <leader>/ :noh<CR>
" Write operations
nnoremap <leader><Space> :w<CR>
nnoremap <leader><S-Space> :set buftype=<CR>:w<CR>
