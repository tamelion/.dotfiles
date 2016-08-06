" Plugins {{{

" Auto-install plug for new deploys
if (!filereadable(expand("$HOME/.config/nvim/autoload/plug.vim")))
	call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
endif
" Auto-install patched font (move to ~/Library/Fonts for Mac)
if (!filereadable(expand("$HOME/.local/share/fonts/icon-mono.ttf")))
	call system(expand("curl -fLo ~/.local/share/fonts/icon-mono.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.ttf"))
endif

call plug#begin()

" To research:
"Plug 'tek/proteome.nvim'
"Plug 'airodactyl/neovim-ranger'

" Remote
Plug 'mhinz/neovim-remote'
" Pretty icons
Plug 'ryanoasis/vim-devicons'
" Coding colour schemes
Plug 'chriskempson/base16-vim'
" Ranger
Plug 'Mizuchi/vim-ranger'
" Status bar and themes
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Snippeting
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
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
" Move through vim
Plug 'Lokaltog/vim-easymotion'
" Undo tree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Auto close brackets
Plug 'jiangmiao/auto-pairs'
" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.local/lib/fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" Multi-language linting
Plug 'benekastah/neomake'
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

"}}}
"  General {{{

set confirm " Save changed files prompt
set ffs=unix,dos,mac " Use Unix as the standard file type
set hidden " Allow background buffers without writing
set ignorecase smartcase nohlsearch " Search - ignore case, unless capital typed, don't highlight
set iskeyword-=_ " Treat extra characters as word break for movements
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set nobackup noswapfile " No backup or swap files
set noerrorbells novisualbell tm=500 " No sound or flash on errors
set number " Display line numbers
set showmatch " Show matching brackets when text indicator is over them
set noshowmode " Mode already displayed in airline
set so=999 " Scrolloff - keep cursor centred
set splitbelow splitright " Window split direction
set undofile undodir=~/.config/nvim/undo " Persistent undo

"" Indentation
set tabstop=4 " Width of existing tabs to display on file open
set shiftwidth=4 " Width of new indentation (multiplies tabstop if necessary)
set noexpandtab " New indentation with tabs, not spaces
set shiftround " Within text, indent is calculated from col 1, not from cursor position
set softtabstop=-1 " Within text, backspace removes same number of spaces as shiftwidth
set list " Show indentation characters
set listchars=tab:▸—,precedes:«,extends:» " Set symbols used with list
"

""  Filetype specific
filetype plugin indent on " Enable filetype detection and filetype plugin/indent scripts
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xhtml,ss.html setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS expandtab shiftwidth=2 tabstop=2
autocmd FileType vim setlocal foldmethod=marker

"" Colours and fonts
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " 24 bit colour
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Allow insert cursor shape
syntax enable " Enable syntax highlighting
set background=dark
set cursorline " Highlight current line
set cursorcolumn " Highlight current column
set colorcolumn=81 " Highlight column 81
colorscheme base16-tomorrow-night
hi SpecialKey guifg=#444444 " Override colour for list characters
" Set neovim's build-in terminal colours
let g:terminal_color_0 = '#1d1f21'
let g:terminal_color_1 = '#912226'
let g:terminal_color_2 = '#778900'
let g:terminal_color_3 = '#ae7b00'
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

"" Netrw
let g:netrw_banner=0 " Netrw banner info off
let g:netrw_liststyle=3 " Netrw default to tree
let g:netrw_keepdir = 1 " Netrw don't cd to current browsed dir

"" Wildmenu
set wildmode=list:longest " WiLd menu with shell-style completion
" Ignore files
set wildignore+=*/node_modules/*,*bower_components/* " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\bower_components\\* " Windows
set wildignore+=*.zip,*.exe,*.ini,*.db,*.ics,*.db,*.ics
set wildignore+=*.eot,*.ttf,*.woff,*.ico
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.svg,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

"" Macros
runtime macros/matchit.vim "Enable extended % matching

" }}}
" Plugin settings {{{

"" Airline
let g:airline_theme='base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_extensions = ['branch', 'tabline']

function! AirlineCustomInit()
	let g:airline_section_a = airline#section#create(['%{getcwd()}'])
	let g:airline_section_c = airline#section#create(['%t'])
	let g:airline_section_x = airline#section#create([''])
	let g:airline_section_z = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
endfunction
autocmd User AirlineAfterInit call AirlineCustomInit()

"" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" FZF
let g:fzf_layout = { 'down': '~33%' }
let g:fzf_buffers_jump = 1 " Jump to open buffer if matched

"" Neosnippet
let g:neosnippet#snippets_directory = '~/code/snippets'

"" Undotree
let g:undotree_SetFocusWhenToggle = 1

" }}}
" Mappings - overrides {{{

" Easy on the pinky
nnoremap ; :

" Edit from current directory
nnoremap <C-\> :e %:p:h<CR>

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
inoremap ,j <Esc>
cnoremap ,j <Esc>
vnoremap ,j <Esc>
tnoremap ,j <C-\><C-n>
nnoremap ,j <Nop>

" }}}
" Mappings - meta {{{

"" Tabs
" Tab open
nnoremap <M-t> :tabnew<CR>
" Tab move
nmap <M-,> <Plug>AirlineSelectPrevTab
nmap <M-.> <Plug>AirlineSelectNextTab
" Tab by ID
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

"" Panes
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
" Pane resize
nnoremap <M-Left>  :10wincmd <<CR>
nnoremap <M-right> :10wincmd ><CR>
nnoremap <M-up>    :10wincmd +<CR>
nnoremap <M-down>  :10wincmd -<CR>
" Pane close
nnoremap <M-w> <C-w>c

"" Special panes
" Toggle 'default' terminal
nnoremap <M-CR> :call ChooseTerm("term-default")<CR>
" Git blame panel
nnoremap <M-b> :Gblame<CR>
" Fugitive git status panel
nnoremap <M-g> :Gstatus<CR>
" Create new file and set syntax
nnoremap <M-n> :enew<CR>:set syntax=
" Toggle undo tree
nnoremap <M-u> :UndotreeToggle<CR>
" }}}
" Mappings - leader {{{

" Map Leader
map <Space> <Leader>
" Buffers (from places where <CR> is not good enough)
nnoremap <Leader><CR> :Buffers<CR>
" Change all existing tabs to spaces (specified by shiftwidth)
nnoremap <Leader><Tab> :retab<CR>
" Marks
nnoremap <Leader>' :Marks<CR>
" Blurred lines
nnoremap <Leader>/ :Lines<CR>
" Find next non-unicode character
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Remove trailing space and re-indent file
nnoremap <Leader>= mzggvG@tgv=`z
" Fuzzy find git commits
nnoremap <Leader>c :Commits<CR>
" Find in project files
nnoremap <Leader>f :Ag
vnoremap <Leader>f "fy:Ag <C-r>f<CR>
" Change tab options
nnoremap <Leader>t :setlocal <C-R>=&expandtab ? 'noexpandtab' : 'expandtab'<CR><CR>
nnoremap <Leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <Leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
nnoremap <Leader>8 :set tabstop=8<CR>:set shiftwidth=8<CR>
" Fast open vimrc
nnoremap <Leader>v :e ~/.dotfiles/neovim/.config/nvim/init.vim<CR>
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
let @u = ':s/“\|”/"/ge:s/‘\|’\|`/\&rsquo;/ge:s/–/-/ge:s/…/.../ge:s/﻿/\&#xfeff;/ge'

" }}}
"  Functions and commands {{{

function! ChooseTerm(termname)
	let pane = bufwinnr(a:termname)
	let buf = bufexists(a:termname)
	if pane > 0
		" buffer is visible, close
		:exe pane . "wincmd c"
	elseif buf > 0
		" buffer is not in pane, show
		:exe "topleft split"
		:exe "buffer " . a:termname
	else
		" buffer is not loaded, create
		:exe "topleft split"
		:terminal
		:exe "f " a:termname
	endif
endfunction

" Make :Rag take flags for Ag
command! -nargs=+ -complete=file Rag call fzf#vim#ag_raw(<q-args>)
"  }}}
