"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set up for Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"we loViMprovement
set nocompatible

" turn off temporarily
filetype off

" add vundle to rtp
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/vundle'                  " vundle

""""" Vanity
Plugin 'chriskempson/base16-vim'        " coding colour scheme
Plugin 'reedes/vim-colors-pencil'       " writing colour scheme
Plugin 'bling/vim-airline'              " Status bar

""""" Helpers
Plugin 'kien/ctrlp.vim'                 " Quick file opener
Plugin 'Lokaltog/vim-easymotion'        " move through vim
Plugin 'sjl/gundo.vim'                  " Undo tree
Plugin 'Shougo/neocomplete.vim'         " Omnicompletion plus plus
Plugin 'Shougo/neosnippet'              " Snippeting
Plugin 'Shougo/neosnippet-snippets'     " Basic snippets
Plugin 'scrooloose/syntastic'           " multi-language linting
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'tpope/vim-vinegar'              " Tweak Netrw
Plugin 'jiangmiao/auto-pairs'           " Auto close brackets

""""" Language specific
Plugin 'tpope/vim-surround'             " changes tag surrounds
Plugin 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
Plugin 'groenewege/vim-less'            " LESS syntax highlighing
Plugin 'othree/html5.vim'               " HTML5 recognition
Plugin 'skammer/vim-css-color'          " colour of hex values
Plugin 'reedes/vim-pencil'       		" writing helper

""""" Other crazy stuff
Plugin 'vim-scripts/vimwiki'            " vimwiki
Plugin 'mhinz/vim-startify'             " startup menu
Plugin 'tomtom/tcomment_vim'            " quick commenting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse off in GUI (yuck)
set mouse-=a

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Change directory to the current buffer when opening files.
set autochdir

" save changed files dialog
set confirm

" Display line numbers (and relatively)
set number relativenumber

" Always show the status line
set laststatus=2

" Backup and swap
set nobackup noswapfile

" Session options (when saving)
set sessionoptions=blank,buffers,curdir,folds,tabpages,winpos,winsize

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Give terminal ViM a title
set title

" Scrolloff
set so=999

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

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells novisualbell t_vb= tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight column 81 to help keep lines of code 80 characters or less "
set colorcolumn=81

" Enable syntax highlighting
syntax enable

" Colour scheme
set background=dark
colorscheme base16-tomorrow

" Transparent bg
hi Normal ctermbg=NONE

" Highlight current line
set cursorline

" Set extra options when running in GUI
if has("gui_running")
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
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab
autocmd filetype python set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set local options for specific filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings, functions and commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>

" Move or create window -- from http://www.agillo.net/simple-vim-window-management/
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr()) "we havent moved
		if (match(a:key,'[jk]')) "were we going up/down
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" Move a line or block of text using Meta+[jk]
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z

" Resize windows
nmap <left>  :10wincmd <<CR>
nmap <right> :10wincmd ><CR>
nmap <up>    :10wincmd +<CR>
nmap <down>  :10wincmd -<CR>

" Command to save with sudo
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings - leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader
map <Space> <leader>

" Update if necessary
nmap <leader>a :update<CR>

" Switch buffer by name
"nmap <leader>b :ls<CR>:b
nmap <leader>b :CtrlPBuffer<CR>

" Switch CWD to the directory of the open buffer
nmap <leader>c :cd %:p:h<CR>:pwd<CR>

" Close buffer without closing windows
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<cr>

" Toggle Netrw
nmap <silent> <leader>e :Explore<CR>

" Fuzzy search for files
nmap <leader>f :CtrlP<CR>

" Switch or create windows
map <leader>h :call WinMove('h')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>
map <leader>j :call WinMove('j')<cr>

" Move windows
map <leader>H :wincmd H<cr>
map <leader>K :wincmd K<cr>
map <leader>L :wincmd L<cr>
map <leader>J :wincmd J<cr>

" File re-indentation
nmap <leader>i mzgg=G`z

" Open startify menu
nmap <leader>m :Startify<CR>

" Create new file and set syntax
nmap <leader>n :enew<CR>:set syntax=

" Close window
nmap <leader>q :q<CR>

" Rotate windows
nmap <leader>r <C-W>r

" Session mappings
"nmap <leader>ss :mks ~/.vim/session/
"nmap <leader>so :so ~/.vim/session/

" Session mappings using startify
nmap <leader>ss :SSave
nmap <leader>so :SLoad
nmap <leader>sd :SDelete

" Useful mappings for managing tabs
nmap <leader>tt :tabnew<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprev<CR>

""""" Gundo
nmap <leader>u :GundoToggle<CR>

" Fast open vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Fast quit
nmap <leader>q :q<CR>

" Disable highlight
nmap <silent> <leader>/ :noh<CR>

" Remove trailing spaces
nmap <leader><Space> mz:%s/\s\+$//e<CR>`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Built-in extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw banner info off
let g:netrw_banner = 0
" Netrw default to tree
let g:netrw_liststyle = 3
" Netrw keep current dir same as browsing dir
"let g:netrw_keepdir = 0

" Turn on the WiLd menu and add shell-style completion
set wildmode=list:longest

" Ignore files
set wildignore+=*/node_modules/*,*bower_components/* " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\bower_components\\* " Windows
set wildignore+=*.zip,*.exe,*.sh
set wildignore+=*.eot,*.svg,*.ttf,*.woff,*.ico
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

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
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
" Ignore files
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }

""""" Easymotion
nmap f <Plug>(easymotion-s)

""""" Gundo
let g:gundo_preview_bottom=1

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
