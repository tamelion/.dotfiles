" Plugins {{{

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

" To research:
" tmux-plugins/tmux-resurrect
" tek/proteome.nvim

" Coding colour schemes
Plug 'chriskempson/base16-vim'
" Status bar and themes
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Snippeting
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
" Find in files
Plug 'mhinz/vim-grepper'
" Autocompletion
Plug 'Shougo/deoplete.nvim'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Git markers
Plug 'airblade/vim-gitgutter'
" Useful macros using [ and ]
Plug 'tpope/vim-unimpaired'
" Use . repeat for tpope plugins
Plug 'tpope/vim-repeat'
" Quick commenting
Plug 'tpope/vim-commentary'
" Change surroundings
Plug 'tpope/vim-surround'
" Cycle yanks
Plug 'vim-scripts/YankRing.vim'
" Move through vim
Plug 'Lokaltog/vim-easymotion'
" Undo tree
Plug 'mbbill/undotree'
" Auto close brackets
Plug 'jiangmiao/auto-pairs'
" Most recently used
Plug 'mhinz/vim-startify'
" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Multi-language linting
Plug 'benekastah/neomake'
" Emmet
Plug 'mattn/emmet-vim'
" CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax'
" LESS syntax highlighing
Plug 'groenewege/vim-less'
" HTML5 recognition
Plug 'othree/html5.vim'
" CSS colour of hex values
Plug 'ap/vim-css-color'
" Better JS indentation
Plug 'jelera/vim-javascript-syntax'
" Other crazy stuff
Plug 'vim-scripts/vimwiki'

call plug#end()

" Enable plugin and indent filetypes
filetype plugin indent on

"}}}
"  General {{{

" Change directory to the current buffer when opening files.
"set autochdir
" save changed files dialog
set confirm
" Backup and swap
set nobackup noswapfile
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Background without write
set hidden
" Search - ignore case, unless capital typed, don't hilight
set ignorecase smartcase nohlsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" No annoying sound on errors
set noerrorbells novisualbell tm=500
" Display line numbers
set number
" Give terminal vim a title
set title
" Scrolloff
set so=999
" Show matching brackets when text indicator is over them
set showmatch
" tab and manual indent sizes
set shiftwidth=4 tabstop=4
" Indent further after brackets
set smartindent
" Line wrap
set wrap
" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" }}}
" Colours and fonts {{{

" 24 bit colour
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
colorscheme base16-tomorrow
" Highlight current line
set cursorline
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Set extra options when running in GUI

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
" Plug settings {{{

"" Airline
let g:airline_theme='base16_tomorrow'
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"" Neosnippet
let g:neosnippet#snippets_directory = '~/code/snippets'

"" Undotree
let g:undotree_SetFocusWhenToggle = 1

"" Yankring
" Fix Y to y$ remap
"function! YRRunAfterMaps()
"	nnoremap Y :<C-U>YRYankCount 'y$'<CR>
"endfunction
"" Ignore
"let g:yankring_ignore_operator = 'd/'
"" History directory
"let g:yankring_history_dir = '~/.cache/'

" }}}
"  Filetype specific {{{

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xhtml setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType vim setlocal foldmethod=marker

" Start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" }}}
" Mappings - overrides {{{

" Cycle buffers
map <C-l> :bnext<cr>
tmap <C-l> <C-\><C-n>:bnext<cr>
map <C-h> :bprevious<cr>
tmap <C-h> <C-\><C-n>:bprevious<cr>

nnoremap <BS> :Startify<CR>

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

" Select last pasted
nnoremap gp `[v`]

" Easy on the pinky
"nnoremap ; :

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Switch CWD to the directory of the open buffer
nnoremap cd :cd %:p:h<CR>:pwd<CR>

" Easymotion
nmap f <Plug>(easymotion-s)

" Fuzzy find
nnoremap <C-p> :FZF<CR>

" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
vnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>
vnoremap kj <Esc>

" Terminal start
nnoremap <CR> :below 30new<CR>:terminal<CR>

" Terminal escapes
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w><C-l> <C-\><C-n><C-w>l
tnoremap <C-w>c <C-\><C-n><C-w>c

" Resize windows
nnoremap <Left>  :10wincmd <<CR>
nnoremap <right> :10wincmd ><CR>
nnoremap <up>    :10wincmd +<CR>
nnoremap <down>  :10wincmd -<CR>

" }}}
" Mappings - other {{{

" Map Leader
map <Space> <Leader>

" Saved searches
nnoremap <Leader>/u /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Remove trailing space and re-indent file
nnoremap <Leader>= mzggvG@tgv=`z
" Buffers
nnoremap <Leader>b :ls<CR>:b 
" Git status
nnoremap <Leader>g :Gstatus<CR>
" Create new file and set syntax
nnoremap <Leader>n :enew<CR>:set syntax=
" Open in browser
nnoremap <Leader>o :silent !google-chrome-beta %<CR>
" Yankring
nnoremap <Leader>p :YRShow<CR>
" Session mappings
"nnoremap <Leader>ss :mks ~/.config/nvim/session/
"nnoremap <Leader>so :so ~/.config/nvim/session/
" Toggle undo tree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
" Fast open vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
" Reload .vimrc
nnoremap <Leader>V :so $MYVIMRC<CR>
" File explorer pane
nnoremap <C-\> :Lexplore<CR>

" }}}
" Mappings - macros {{{

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
