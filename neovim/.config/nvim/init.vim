" Plugins {{{

call plug#begin()

" To research:
" tek/proteome.nvim

" Get font file and put in ~/.local/share/fonts (linux) or ~/Library/Fonts (Mac)
" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.ttf

Plug 'mhinz/neovim-remote'
" Pretty icons
Plug 'ryanoasis/vim-devicons'
" Coding colour schemes
Plug 'chriskempson/base16-vim'
" Slightly better than netrw
Plug 'scrooloose/nerdtree'
" Keep working directory at git base
Plug 'airblade/vim-rooter'
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
"Plug 'vim-scripts/YankRing.vim'
" Move through vim
Plug 'Lokaltog/vim-easymotion'
" Undo tree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Auto close brackets
"Plug 'jiangmiao/auto-pairs'
" Most recently used
Plug 'mhinz/vim-startify'
" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" Multi-language linting
Plug 'benekastah/neomake'
" Emmet
Plug 'mattn/emmet-vim', { 'for': ['html', 'ss'] }
" CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less', 'sass', 'scss'] }
" LESS syntax highlighing
Plug 'groenewege/vim-less', { 'for': 'less' }
" HTML5 recognition
Plug 'othree/html5.vim', { 'for' : 'html' }
" CSS colour of hex values
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] }
" Silverstripe highlighting
Plug 'phalkunz/vim-ss'
" Better JS indentation
Plug 'jelera/vim-javascript-syntax', { 'for' : 'js' }
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
"set wrap
" Splits in right direction
set splitbelow
set splitright
" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" }}}
" Colours and fonts {{{

" 24 bit colour
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Enable syntax highlighting
syntax enable
" Colour scheme
set background=dark
colorscheme base16-tomorrow
" Highlight current line
set cursorline
" Highlight column 81 to help keep lines of code 80 characters or less
set colorcolumn=81
" Neovim terminal colours
let g:terminal_color_0 = '#1d1f21'
let g:terminal_color_1 = '#912226'
let g:terminal_color_2 = '#778900'
let g:terminal_color_3 = '#ae7b00'
"let g:terminal_color_4 = '#1d2594'
let g:terminal_color_4 = '#81a2be'
let g:terminal_color_5 = '#682a9b'
let g:terminal_color_6 = '#2b6651'
let g:terminal_color_7 = '#929593'
let g:terminal_color_8 = '#969896'
let g:terminal_color_9 = '#cc6666'
let g:terminal_color_10 = '#b5bd68'
let g:terminal_color_11 = '#f0c674'
let g:terminal_color_12 = '#81a2be'
let g:terminal_color_13 = '#b294bb'
let g:terminal_color_14 = '#8abeb7'
let g:terminal_color_15 = '#ecebec'

" }}}
" Built-in extensions {{{

""""" Netrw
" Netrw banner info off
let g:netrw_banner=0
" Netrw default to tree
let g:netrw_liststyle=3
" Netrw keep working dir (don't change to browsing dir)
let g:netrw_keepdir = 1

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
let g:airline_theme='base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" FZF
let g:fzf_layout = { 'down': '~33%' }

"" Neosnippet
let g:neosnippet#snippets_directory = '~/code/snippets'

"" NERDTree
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1

" NERDTree file extension highlighting
function! HighlightFileExtension(ex, fg, bg)
	exec 'autocmd FileType netrw,nerdtree,startify highlight '. a:ex .' guibg='. a:bg .' guifg='. a:fg
	" match extension, possibly with 'executable' asterisk on end
	exec 'autocmd FileType netrw,nerdtree,startify syn match '. a:ex .' #^.*\.'. a:ex .'\*\=$#'
endfunction

call HighlightFileExtension('php', '#b294bb', 'none')
call HighlightFileExtension('js', '#f0c674', 'none')
call HighlightFileExtension('json', '#f0c674', 'none')
call HighlightFileExtension('html', '#cc6666', 'none')
call HighlightFileExtension('ss', '#cc6666', 'none')
call HighlightFileExtension('yml', '#cc6666', 'none')
call HighlightFileExtension('css', '#b5bd68', 'none')
call HighlightFileExtension('scss', '#8abeb7', 'none')
call HighlightFileExtension('less', '#8abeb7', 'none')
call HighlightFileExtension('config', '#969896', 'none')
call HighlightFileExtension('conf', '#969896', 'none')
call HighlightFileExtension('gitconfig', '#969896', 'none')
call HighlightFileExtension('gitignore', '#969896', 'none')

"" Startify
" When opening a file, don't change to its directory
let g:startify_change_to_dir = 0
" When opening file, change to its git root
"let g:startify_change_to_vcs_root = 1

"" Undotree
let g:undotree_SetFocusWhenToggle = 1

"" Vim rooter
" Don't echo
let g:rooter_silent_chdir = 1

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
autocmd FileType html,markdown,xhtml,ss.html setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType vim setlocal foldmethod=marker

" }}}
" Mappings - overrides {{{

" Easy on the pinky
nnoremap ; :

" File explorer pane
nnoremap <C-\> :NERDTreeFind<CR>

" Home row friendly navigation
nnoremap H ^
nnoremap L $

" Keep selection afer indent
vnoremap < <gv
vnoremap > >gv

" Select last pasted
nnoremap gp `[v`]

" Buffers
nnoremap <CR> :Buffers<CR>

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

" Grepper (motion and visual)
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Fuzzy find files
nnoremap <C-p> :Files<CR>

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Switch CWD to the directory of the open buffer
nnoremap cd :cd %:p:h<CR>:pwd<CR>

" Easymotion
nmap f <Plug>(easymotion-s)

" More convenient escape sequence
" (using jk causes delays in last line of visual selection)
inoremap ,j <Esc>
cnoremap ,j <Esc>
vnoremap ,j <Esc>
tnoremap ,j <C-\><C-n>
nnoremap ,j <Nop>

" Resize windows
nnoremap <Left>  :10wincmd <<CR>
nnoremap <right> :10wincmd ><CR>
nnoremap <up>    :10wincmd +<CR>
nnoremap <down>  :10wincmd -<CR>

" }}}
" Mappings - leader {{{

" Map Leader
map <Space> <Leader>

" Splits
nnoremap <Leader>- <C-w>s<CR>
nnoremap <Leader>\ <C-w>v<CR>
" Buffers (from places where <CR> is not good enough)
nnoremap <Leader><CR> :Buffers<CR>
" Blurred lines
nnoremap <Leader>/ :Lines<CR>
" Saved searches
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Move tabs
nmap <leader>, <Plug>AirlineSelectPrevTab
nmap <leader>. <Plug>AirlineSelectNextTab
" Tab IDs
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Remove trailing space and re-indent file
nnoremap <Leader>= mzggvG@tgv=`z
" Git blame panel
nnoremap <Leader>b :Gblame<CR>
" Fuzzy find stuff
nnoremap <Leader>c :Commits<CR>
" Find in project files
"nnoremap <Leader>f :Grepper -tool git -i<CR>
nnoremap <Leader>f :Ag -i
vnoremap <Leader>f "fy:Ag -i <C-r>f<CR>
" Fugitive
nnoremap <Leader>g :Gstatus<CR>
" Window moves
nnoremap <Leader>h <C-w>h
nnoremap <Leader>H <C-w>H
nnoremap <Leader>j <C-w>j
nnoremap <Leader>J <C-w>J
nnoremap <Leader>k <C-w>k
nnoremap <Leader>K <C-w>K
nnoremap <Leader>l <C-w>l
nnoremap <Leader>L <C-w>L
" Create new file and set syntax
nnoremap <Leader>n :enew<CR>:set syntax=
" Open in browser
nnoremap <Leader>o :silent !google-chrome-beta %<CR>
" Startify
nnoremap <Leader>s :Startify<CR>
" Terminal start
nnoremap <Leader>t :below 30new<CR>:terminal<CR>
" Toggle undo tree
nnoremap <silent><Leader>u :UndotreeToggle<CR>
" Fast open vimrc
nnoremap <Leader>v :e ~/.dotfiles/neovim/.config/nvim/init.vim<CR>
" Reload .vimrc
nnoremap <Leader>V :so $MYVIMRC<CR>
" Window close
nnoremap <Leader>x <C-w>c

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
