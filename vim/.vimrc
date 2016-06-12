" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" because we loViMprovement
set nocompatible
" Set folds in .vimrc
autocmd FileType vim setlocal foldmethod=marker

"  General {{{

" Sets how many lines of history VIM has to remember
set history=1000
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
" Treat underscore as word break
set iskeyword-=_

" }}}
" Colours and fonts {{{

set t_Co=256
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
colorscheme desert
" Transparency
hi Normal ctermbg=NONE
" Highlight current line
set cursorline
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Set extra options when running in GUI
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
" Mappings - overrides {{{

" Easy on the pinky
nnoremap ; :

" Pane open
nnoremap <M--> <C-w>s<CR>
nnoremap <M-\> <C-w>v<CR>
" Pane move
nnoremap <M-h> <C-w>h
nnoremap <M-H> <C-w>H
nnoremap <M-j> <C-w>j
nnoremap <M-J> <C-w>J
nnoremap <M-k> <C-w>k
nnoremap <M-K> <C-w>K
nnoremap <M-l> <C-w>l
nnoremap <M-L> <C-w>L
" Pane close
nnoremap <M-w> <C-w>c

" File explorer pane
nnoremap <C-\> :Explore<CR>

" Home row friendly navigation
nnoremap H ^
nnoremap L $

" Keep selection afer indent
vnoremap < <gv
vnoremap > >gv

" Select last pasted
nnoremap gp `[v`]

" Buffers
nnoremap <CR> :ls<CR>:b 

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

" Switch CWD to the directory of the open buffer
nnoremap cd :cd %:p:h<CR>:pwd<CR>

" More convenient escape sequence
" (using jk causes delays in last line of visual selection)
inoremap ,j <Esc>
cnoremap ,j <Esc>
vnoremap ,j <Esc>
nnoremap ,j <Nop>

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
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Remove trailing space and re-indent file
nnoremap <Leader>= mzggvG@tgv=`z
" Create new file and set syntax
nnoremap <Leader>n :enew<CR>:set syntax=
" Fast open vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
" Reload .vimrc
nnoremap <Leader>V :so $MYVIMRC<CR>

" }}}
" Mappings - macros {{{

" Append a line break
let @b = 'A<br />'
" CSS one per line
let @c = ':s/;\s/;\r/ge'
" HTML nbsp
let @d = ':s/﻿/\&#160;/g'
" Make e-mail link from visual selection
let @e = 'a</a>gv"zyi<a href="mailto:z">'
" MRO img src
let @f = '^ivar f:as ='
" Remove blank lines
let @l = ':g/^\s*$/d'
" Translate carriage returns
let @r = ':s/\r\+$//e'
" Remove trailing space
let @t = ':s/\s\+$//e'
" Unicode replacements: quotes, hyphens, ellipses and spaces
let @u = ':s/“\|”/"/ge:s/‘\|’\|`/''/ge:s/–/-/ge:s/…/.../ge:s/﻿/\&#xfeff;/ge'

" }}}
