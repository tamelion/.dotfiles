" Plugins {{{

" Auto-install plug for new deploys
if (!filereadable(expand("$HOME/.config/nvim/autoload/plug.vim")))
	call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
endif

call plug#begin()

" To research:
"Plug 'tek/proteome.nvim'
"Plug 'airodactyl/neovim-ranger'

" Preview yanks when pasting
Plug 'junegunn/vim-peekaboo'
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
" Github gists
Plug 'mattn/gist-vim'
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
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
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
autocmd FileType zsh,yaml,python,json,coffee setlocal expandtab shiftwidth=2 tabstop=2
autocmd! BufWritePost * Neomake

"" Colours and fonts
set termguicolors " 24 bit colour
syntax enable " Enable syntax highlighting
set background=dark
set cursorline " Highlight current line
set colorcolumn=80,100,120 " Highlight columns for target max length
colorscheme base16-tomorrow-night
hi SpecialKey guifg=#444444 " Override colour for list characters

" Terminal: 8 normal colors 
let g:terminal_color_0 = '#1d1f21' "black
let g:terminal_color_1 = '#cc6666' "red
let g:terminal_color_2 = '#b5bd68' "green
let g:terminal_color_3 = '#f0c674' "yellow
let g:terminal_color_4 = '#81a2be' "blue
let g:terminal_color_5 = '#b294bb' "magenta
let g:terminal_color_6 = '#8abeb7' "cyan
let g:terminal_color_7 = '#c5c8c6' "white

" Terminal: 8 bright colors
let g:terminal_color_8 = '#969896' "black
let g:terminal_color_9 = '#cc6666' "red
let g:terminal_color_10 = '#b5bd68' "green
let g:terminal_color_11 = '#f0c674' "yellow
let g:terminal_color_12 = '#81a2be' "blue
let g:terminal_color_13 = '#b294bb' "magenta
let g:terminal_color_14 = '#8abeb7' "cyan
let g:terminal_color_15 = '#ffffff' "white

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

"" Auto pairs
let g:AutoPairsMultilineClose = 0

"" JSDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1

"" Peekaboo
let g:peekaboo_window = 'vert bo 50new'

"" PHPfmt
let g:phpfmt_standard = 'PSR2'
let g:phpfmt_autosave = 0

"" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#tss#javascript_support = 1
" Ignore omni in favour of phpcd
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

"" FZF
let g:fzf_layout = { 'down': '~33%' }
let g:fzf_buffers_jump = 1 " Jump to open buffer if matched
let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-x': 'split',
  \ 'alt-v': 'vsplit' }

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

" Files
nnoremap <CR> :GFiles!<CR>

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

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
" Move current pane to new tab
nnoremap <M-f> :tabedit %<CR>gT<C-w>cgt
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
nnoremap <M-`> :call ChooseTerm("term-default")<CR>
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
" Write operations
nnoremap <Leader><Space> :w<CR>
" Buffers
nnoremap <Leader><CR> :Buffers<CR>!term: 
" Change tab type and width
nnoremap <Leader><Tab> :setlocal <C-R>=&expandtab ? 'noexpandtab' : 'expandtab'<CR><CR>
nnoremap <Leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nnoremap <Leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>
nnoremap <Leader>8 :set tabstop=8<CR>:set shiftwidth=8<CR>
" Marks
nnoremap <Leader>' :Marks<CR>
" Commands
nnoremap <Leader>; :Commands<CR>
" Blurred lines
nnoremap <Leader>/ :Lines<CR>
" Find next non-unicode character
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>
" Move to current tab format, remove trailing space and re-indent file
nnoremap <Leader>= :retab<CR>mzggvG@tgv=`z
" git commits in buffer
nnoremap <Leader>b :BCommits<CR>
" git commits in repo
nnoremap <Leader>c :Commits<CR>
" Find in project files (or in all modules)
nnoremap <Leader>f :Ag! 
nnoremap <Leader>F :Ag! -U 
" git changes (status)
nnoremap <Leader>s :GFiles?<CR>
" Open from all files in CWD
nnoremap <Leader>o :Files!<CR>
" Recently opened files
nnoremap <Leader>r :History<CR>!term: 
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

" Override FZF commands to include preview windows
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
"  }}}
