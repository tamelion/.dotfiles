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
Plugin 'chriskempson/base16-vim'        " colour scheme
Plugin 'bling/vim-airline'              " Status bar plus plus

""""" Helpers
Plugin 'kien/ctrlp.vim'                 " Quick file opener
Plugin 'Lokaltog/vim-easymotion'        " move through vim
Plugin 'Shougo/vimproc.vim'             " Multithreading
Plugin 'Shougo/neocomplete.vim'         " Omnicompletion plus plus
Plugin 'Shougo/neosnippet'              " Snippeting
Plugin 'Shougo/neosnippet-snippets'     " Basic snippets
Plugin 'scrooloose/syntastic'           " multi-language linting

""""" Language specific
Plugin 'tpope/vim-surround'             " changes tag surrounds
Plugin 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
Plugin 'groenewege/vim-less'            " LESS syntax highlighing
Plugin 'othree/html5.vim'               " HTML5 recognition
Plugin 'skammer/vim-css-color'          " colour of hex values

""""" Other crazy stuff
Plugin 'vim-scripts/vimwiki'            " vimwiki
Plugin 'mhinz/vim-startify'             " startup menu


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

""""" Emmet
let g:user_emmet_leader_key='<C-y>'

""""" Neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Insert / delimiter for filename completion
let g:neocomplete#enable_auto_delimiter = 1
" Only complete after 3 (for keywords only)
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Omnicompletion (Intellisense TM)
"set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Comple

" Completion menu use longest
"set completeopt=menu,preview

"" autocomplete with tab/shift+tab
"function! SuperCleverTab(direction)
"    let substr = strpart( getline('.'), 0, col('.')-1 )
"    if substr =~ '^\s*$'
"        return a:direction == 1 ? "\<Tab>" : "\<S-Tab>"
"    else
"        if pumvisible()
"            return a:direction == 1 ? "\<C-n>" : "\<C-p>"
"        elseif &omnifunc != ''
"            return "\<C-x>\<C-o>"
"        elseif match(substr, '\/') != -1
"            return "\<c-x>\<c-f>"
"        elseif &dictionary != ''
"            return "\<C-k>"
"        else
"            return a:direction == 1 ? "\<C-n>" : "\<C-p>"
"        endif
"    endif
"endfunction
"
"inoremap <Tab> <C-R>=SuperCleverTab(1)<CR>
"inoremap <S-Tab> <C-R>=SuperCleverTab(-1)<CR>

"Enable extended % matching
runtime macros/matchit.vim

" map leader
map ; <leader>

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Change directory to the current buffer when opening files.
set autochdir

" save changed files dialog
set confirm

" Display line numbers
set number

" Set relative line numbers
set relativenumber

" Always show the status line
set laststatus=2

" Backup and swap
set nobackup
set noswapfile

" Session options
set sessionoptions=blank,buffers,curdir,folds,tabpages,winpos,winsize

" Set shorter wait time for keys
set timeoutlen=200

" Return to last edit position when opening file
autocmd BufReadPost *
			\if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\endif

" Remember info about open buffers on close
"set viminfo^=%

" Command to save with sudo
 cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give terminal ViM a title
set title

" Scrolloff
set so=999

" Turn on the WiLd menu and add shell-style completion
set wildmode=list:longest

" Ignore files
set wildignore+=*/node_modules/*,*bower_components/* " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\bower_components\\* " Windows
set wildignore+=*.zip,*.exe,*.sh
set wildignore+=*.eot,*.svg,*.ttf,*.woff,*.ico
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

" Display full path always
"set statusline+=%F

"Always show current position
"set ruler

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Turn on case sensitivity when capital in search
set smartcase

" Highlight search results
set hlsearch

" Jump to search as you type
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Netrw window absolute width
"let g:netrw_winsize = -28
" Netrw banner info off
let g:netrw_banner = 0
" Netrw default to tree
let g:netrw_liststyle = 3
" Netrw keep current dir same as browsing dir
let g:netrw_keepdir = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
		set guifont=Terminus\ 9
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
		" For CJK
		set guifontwide=NSimsun:h10
	endif
endif

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight column 81 to help keep lines of code 80 characters or less "
set colorcolumn=81

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

" Move a line or block of text using Meta+[jk]
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse off in GUI (yuck)
set mouse-=a

" More convenient escape sequence
inoremap jk <Esc>
cnoremap jk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>

" Change windows seamlessly in vim and tmux
if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif

" Resize windows
nmap <left>  :10wincmd <<CR>
nmap <right> :10wincmd ><CR>
nmap <up>    :10wincmd +<CR>
nmap <down>  :10wincmd -<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom leader keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Create new file and set syntax
nmap <leader>n :enew<CR>:set syntax=

" Quick set syntax for new file
"nmap <Leader>s :set syntax=

" Session mappings
nmap <leader>ss :mks ~/.vim/session/
nmap <leader>so :so ~/.vim/session/

" Useful mappings for managing tabs
nmap <leader>tt :tabnew<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprev<CR>

" Fast open vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Fast quit
nmap <leader>q :q<CR>

" File re-indentation
nmap <leader>= mzgg=G`z

" Disable highlight
nmap <silent> <leader>/ :noh<CR>

" Remove trailing spaces
nmap <leader><Space> mz:%s/\s\+$//e<CR>`z

