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
Plugin 'tomasr/molokai'                 " colour scheme
Plugin 'bling/vim-airline'              " Status bar plus plus
Plugin 'Lokaltog/vim-easymotion'        " move through vim
Plugin 'tpope/vim-surround'             " changes tag surrounds

Plugin 'hail2u/vim-css3-syntax'         " CSS3 syntax highlighting
Plugin 'groenewege/vim-less'            " LESS syntax highlighing
Plugin 'othree/html5.vim'               " HTML5 recognition
Plugin 'scrooloose/syntastic'           " multi-language linting
Plugin 'skammer/vim-css-color'          " colour of hex values

Plugin 'mattn/emmet-vim'                " HTML zen
Plugin 'mattn/webapi-vim'               " For Gist
Plugin 'mattn/gist-vim'                 " Gists
Plugin 'Shougo/neocomplete.vim'         " Omnicompletion plus plus
Plugin 'Shougo/neosnippet'              " Snippeting
Plugin 'Shougo/neosnippet-snippets'     " Basic snippets
"Plugin 'Shougo/unite.vim'               " unite menu
Plugin 'szw/vim-ctrlspace'              " Ctrl-space


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_theme='molokai'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_section_b = '%{getcwd()}'
let g:airline_exclude_preview = 1       " for ctrl-space

" CtrlSpace
"let g:ctrlspace_workspace_file=[$HOME."/.vim/sessions/cs_workspaces"]
"let g:ctrlspace_files_cache=0 "disable
"let g:ctrlspace_save_workspace_on_exit=1
"let g:ctrlspace_load_last_workspace_on_start=1

" Unite
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
"  " Enable navigation with control-j and control-k in insert mode
"  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction

" Easymotion mapping
nmap s <Plug>(easymotion-s)

" emmet mapping
let g:user_emmet_leader_key='<C-y>'

" Enable NeoComplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Select first match in menu
"let g:neocomplete#enable_auto_select = 1
" Insert / delimiter for filename completion
let g:neocomplete#enable_auto_delimiter = 1
" Only complete after 3
let g:neocomplete#auto_completion_start_length = 1

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Complete snippet or move through menu
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
" Undo completion
imap <expr><S-Tab> neocomplete#undo_completion()


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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

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

" map space as leader
map <space> <leader>

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Change directory to the current buffer when opening files.
"set autochdir              " off for ctrl-space

" save changed files dialog
set confirm

" Display line numbers
set number

" Set relative line numbers
set relativenumber

" Always show the status line
set laststatus=2

" Directories
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

" For sessions
nmap <leader>ss :mks ~/.vim/sessions/
nmap <leader>so :so ~/.vim/sessions/

" Fast saving
nmap <leader>w :w<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Return to last edit position when opening file
autocmd BufReadPost *
    \if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give terminal ViM a title
set title

" Scrolloff
set so=999

" Turn on the WiLd menu and add shell-style completion
set wildmode=list:longest

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Display full path always
set statusline+=%F

"Always show current position
set ruler

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

" Makes search act like search in modern browsers
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

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Colour scheme
let g:rehash256=1      "closer terminal colours
set background=dark
colorscheme molokai

" Transparent bg
hi Normal ctermbg=NONE

" Highlight current line
set cursorline
hi CursorLine ctermbg=black guibg=black

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
set expandtab

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

" File re-indentation
nmap <leader>= mzgg=G`z

" Move a line or block of text using Meta+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More convenient escape sequence
imap jk <Esc>
cmap jk <Esc>
imap kj <Esc>
cmap kj <Esc>

" Disable highlight
map <silent> <leader>/ :noh<cr>

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

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Resize windows
nmap <left>  :10wincmd <<cr>
nmap <right> :10wincmd ><cr>
nmap <up>    :10wincmd +<cr>
nmap <down>  :10wincmd -<cr>

" Open buffer
"nmap <leader>e :e<space>

"" Switch buffer by name
"nmap <leader>b :ls<cr>:b<space>
"" Switch buffers back and forth
"nmap <leader>n :bn<cr>
"nmap <leader>p :bp<cr>

" Close buffer without closing windows
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<cr>

" Useful mappings for managing tabs
nmap <leader>tt :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprev<cr>

" Switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
