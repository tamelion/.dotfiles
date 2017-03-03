" Plugins {{{

" Auto-install plug for new deploys
if (!filereadable(expand("$HOME/.config/nvim/autoload/plug.vim")))
	call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
endif

call plug#begin()

" To research:
"Plug 'tek/proteome.nvim'
"Plug 'airodactyl/neovim-ranger'

" Connect to already running neovim
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
Plug 'Shougo/deoplete.nvim' | Plug 'mhartington/deoplete-typescript'
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
Plug 'neomake/neomake'
" CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less', 'sass', 'scss'] }
" CSS colour of hex values
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] }
" LESS syntax highlighing
Plug 'groenewege/vim-less', { 'for': 'less' }
" HTML5 omnicompletion and syntax highlighting
Plug 'othree/html5.vim', { 'for' : 'html' }
" Silverstripe highlighting
Plug 'phalkunz/vim-ss'
" JS and TS syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
" JS and TS doc
Plug 'heavenshell/vim-jsdoc'
" PHP improved omnicompletion
"Plug 'shawncplus/phpcomplete.vim', { 'for' : 'php' }
" PHP standards
"Plug 'beanworks/vim-phpfmt'


call plug#end()

"}}}
"  General {{{

set confirm " Save changed files prompt
set ffs=unix,dos,mac " Use Unix as the standard file type
set hidden " Allow background buffers without writing
set ignorecase smartcase nohlsearch " Search - ignore case, unless capital typed, don't highlight
"set iskeyword-=_ " Treat extra characters as word break for movements
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

""  Filetype specific
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType html,markdown,xhtml,ss.html setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=4 tabstop=4
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript,typescript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal noexpandtab shiftwidth=4 tabstop=4
autocmd FileType zsh,yaml,python,json setlocal expandtab shiftwidth=2 tabstop=2
autocmd! BufWritePost * Neomake

"" Colours and fonts
set termguicolors " 24 bit colour
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Allow insert cursor shape
syntax enable " Enable syntax highlighting
set background=dark
set cursorline " Highlight current line
set colorcolumn=80,100,120 " Highlight columns for target max length
colorscheme base16-tomorrow-night
hi SpecialKey guifg=#444444 " Override colour for list characters
" Set neovim's build-in terminal colours
let g:terminal_color_0 = '#1d1f21'
let g:terminal_color_1 = '#cc6666'
let g:terminal_color_2 = '#b5bd68'
let g:terminal_color_3 = '#f0c674"'
let g:terminal_color_4 = '#81a2be'
let g:terminal_color_5 = '#b294bb'
let g:terminal_color_6 = '#8abeb7'
let g:terminal_color_7 = '#c5c8c6'
let g:terminal_color_8 = '#1d1f21'
let g:terminal_color_9 = '#cc6666'
let g:terminal_color_10 = '#b5bd68'
let g:terminal_color_11 = '#f0c674"'
let g:terminal_color_12 = '#81a2be'
let g:terminal_color_13 = '#b294bb'
let g:terminal_color_14 = '#8abeb7'

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
	let g:airline_section_a = airline#section#create(['%{expand("%:h")}'])
	let g:airline_section_c = airline#section#create(['%t'])
	let g:airline_section_x = airline#section#create([''])
	let g:airline_section_z = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
endfunction
"autocmd User AirlineAfterInit call AirlineCustomInit()

"" JSDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1

"" PHPfmt
let g:phpfmt_standard = 'PSR2'
let g:phpfmt_autosave = 0

"" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#tss#javascript_support = 1

"" FZF
let g:fzf_layout = { 'down': '~33%' }
let g:fzf_buffers_jump = 1 " Jump to open buffer if matched

"" Neosnippet
let g:neosnippet#snippets_directory = '~/code/snippets'

"" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

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
nnoremap <CR> :Buffers<CR>!term 

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
" Tab new
nnoremap <M-t> :tabnew<CR>
" Edit current pane in new tab
nnoremap <M-e> :tabedit %<CR>
" Tab move
nmap <M-,> gT
nmap <M-.> gt
" Tab by ID
nmap <M-1> 1gt
nmap <M-2> 2gt
nmap <M-3> 3gt
nmap <M-4> 4gt
nmap <M-5> 5gt
nmap <M-6> 6gt
nmap <M-7> 7gt
nmap <M-8> 8gt
nmap <M-9> 9gt
" Move to tab by ID (index in command is for tab before)
nmap <M-!> :tabm0<CR>
nmap <M-@> :tabm1<CR>
nmap <M-#> :tabm2<CR>
nmap <M-$> :tabm3<CR>
nmap <M-$> :tabm3<CR>
nmap <M-%> :tabm4<CR>
nmap <M-^> :tabm5<CR>
nmap <M-&> :tabm6<CR>
nmap <M-*> :tabm7<CR>
nmap <M-(> :tabm8<CR>

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
nnoremap <Left>  :10wincmd <<CR>
nnoremap <Right> :10wincmd ><CR>
nnoremap <Up>    :10wincmd +<CR>
nnoremap <Down>  :10wincmd -<CR>
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
" Marks
nnoremap <Leader>' :Marks<CR>
" Blurred lines
nnoremap <Leader>/ :Lines<CR>
" Find next non-unicode character
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Write operations
nnoremap <Leader><Space> :w<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Move to current tab format, remove trailing space and re-indent file
nnoremap <Leader>= :retab<CR>mzggvG@tgv=`z
" Fuzzy find git commits
nnoremap <Leader>c :Commits<CR>
" Find in project files
nnoremap <Leader>f :Rag -u 
vnoremap <Leader>f "fy:Rag -u <C-r>f<CR>
" Change tab type
nnoremap <Leader><Tab> :setlocal <C-R>=&expandtab ? 'noexpandtab' : 'expandtab'<CR><CR>
nnoremap <Leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <Leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
nnoremap <Leader>8 :set tabstop=8<CR>:set shiftwidth=8<CR>
" Search non-UTF8 characters
nnoremap <Leader>u /[^\x00-\x7F]<CR>
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
" Turn Hex into proper unicode character
let @v = ':%s/ / /ge:%s//‘/ge:%s//’/ge:%s//“/ge:%s//”/ge:%s//–/ge:%s//—/ge:%s//…/ge'

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
