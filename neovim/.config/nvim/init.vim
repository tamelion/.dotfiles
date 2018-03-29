" Plugins {{{

" Auto-install plug for new deploys
if (!filereadable(expand("$HOME/.config/nvim/autoload/plug.vim")))
	call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
endif

call plug#begin()

" To research:
"Plug 'tek/proteome.nvim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'
" Tagbar
Plug 'majutsushi/tagbar'
" Tmux config syntax highlighting
Plug 'ericpruitt/tmux.vim'
" Function signature help
Plug 'Shougo/echodoc.vim'
" Snippets engine
Plug 'SirVer/ultisnips'
" General snippets
Plug 'honza/vim-snippets'
" Editor config
Plug 'editorconfig/editorconfig-vim'
" Preview yanks when pasting
Plug 'junegunn/vim-peekaboo'
" Replace by yanking to black hole
Plug 'vim-scripts/ReplaceWithRegister'
" Coding colour schemes
Plug 'chriskempson/base16-vim'
" Ranger
Plug 'Mizuchi/vim-ranger'
" Status bar and themes
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Completion menu
Plug 'Shougo/deoplete.nvim', { 'tag': '4.0-serial', 'do': ':UpdateRemotePlugins' }
" TS completion
Plug 'mhartington/nvim-typescript'
" PHP completion
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" HTML5 completion and syntax highlighting
Plug 'othree/html5.vim', { 'for' : 'html' }
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
Plug 'w0rp/ale'
" One stop syntax highlighting
Plug 'sheerun/vim-polyglot'
" CSS colour of hex values
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] }
" Silverstripe syntax highlighting
Plug 'phalkunz/vim-ss'
" JS and TS syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
" JS and TS doc
Plug 'heavenshell/vim-jsdoc'
" Tab management
Plug 'gcmt/taboo.vim'
" Session restore
Plug 'tpope/vim-obsession'

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
set synmaxcol=500
set completeopt+=noinsert " Wait for manual insertion of completion candidate
set pumheight=20 " Limit omnicomplete to 20 visible items
set shortmess+=c " Hide 'match x of y' messages in deoplete
set sessionoptions+=tabpages,globals " Save tab names in sessions

"" Indentation
set tabstop=4 " Width of existing tabs to display on file open
set shiftwidth=4 " Width of new indentation
set expandtab " New indentation with spaces, not tabs
set shiftround " Within text, indent is calculated from col 1, not from cursor position
set softtabstop=-1 " Within text, backspace removes same number of spaces as shiftwidth
set list listchars=tab:┊\ ,nbsp:.,precedes:«,extends:» " Set various symbols
set linebreak showbreak=↪\  " Symbol for line breaks

""  Filetype specific
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType html,markdown,xhtml,ss.html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript,typescript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType yaml,python setlocal expandtab shiftwidth=2 tabstop=2

"" Colours and fonts
set termguicolors " 24 bit colour
syntax enable " Enable syntax highlighting
set background=dark
set cursorline " Highlight current line
set colorcolumn=80,120 " Highlight columns for target max length
colorscheme base16-tomorrow-night
highlight Whitespace guifg=#444444 " list characters
highlight SignColumn guibg=#222222 " gitgutter and parsers"

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
set wildignore+=*.jpg,*.jpeg,*.JPG,*.png,*.gif,*.tiff,*.eps,*.psd
set wildignore+=*.pdf,*.doc,*.docx,*.DOCX,*.ppt,*.xls

"" Macros
runtime macros/matchit.vim "Enable extended % matching

" }}}
" Plugin settings {{{

"" Airline
let g:airline_theme='base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width = {} "disable trunc

function! AirlineInit()
	let g:airline_section_y = airline#section#create(['obsession'])
	let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0 " taboo handles numbers
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_min_count = 1 
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = 'Session'
let g:airline#extensions#taboo#enabled = 1

"" ALE
let g:ale_fixers = {
			\   'javascript': ['eslint'],
			\   'php': ['phpcbf'],
			\}
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = '🛈'

"" Auto pairs
let g:AutoPairsMultilineClose = 0

"" EchoDoc
let g:echodoc#enable_at_startup = 1

"" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" GitGutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'δ'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '±'
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd guifg=#b5bd68
highlight GitGutterChange guifg=#81a2be
highlight GitGutterDelete guifg=#cc6666
highlight GitGutterChangeDelete guifg=#b294bb

"" Gutentags
let ctagsdir = expand("$HOME/.cache/ctags")
if !isdirectory(ctagsdir)
	call mkdir(ctagsdir)
endif
let g:gutentags_cache_dir=ctagsdir

"" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

"" JSDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1

"" Peekaboo
let g:peekaboo_window = 'vert bo 50new'

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

"" Taboo
let g:taboo_tabline = 0 " Airline manages tabs
let g:taboo_tab_format = '%N: general[%W]'
let g:taboo_renamed_tab_format = '%N: %l[%W]'

"" Ultisnips
let g:UltiSnipsSnippetsDir='~/code/snippets/UltiSnips'
let g:UltiSnipsEditSplit='vertical'

"" Undotree
let g:undotree_SetFocusWhenToggle = 1

" }}}
" Mappings - overrides {{{

" Easy on the pinky
nnoremap ; :

" Home row friendly navigation
nnoremap H ^
nnoremap L $

" Keep selection afer indent
vnoremap < <gv
vnoremap > >gv

" Select last pasted
nnoremap gp `[v`]

" Open file from git repo
nnoremap <CR> :GitFiles<CR>

" Ban ex mode
nnoremap Q <Nop>

" Fix Y
nnoremap Y y$

" Change dir to git repo which contains current file (then pwd)
nnoremap cd :Gcd<CR>:pwd<CR>

" Easymotion
nmap f <Plug>(easymotion-s)

" More convenient escape sequence
tnoremap <C-[> <C-\><C-n>
inoremap ,j <Esc>
cnoremap ,j <Esc>
vnoremap ,j <Esc>
tnoremap ,j <C-\><C-n>
nnoremap ,j <Nop>

" Edit from current directory
nnoremap <C-\> :e %:p:h<CR>

" Omnicomplete with Tab or CR
inoremap <expr> <Tab> pumvisible() ? "\<c-y>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" New tab
nnoremap <C-w>t :tabnew<CR>

" }}}
" Mappings - meta {{{

" Toggle git blame panel
nnoremap <M-b> :Gblame<CR>
" Toggle tagbar (ctags) tree
nnoremap <M-t> :TagbarToggle<CR>
" Toggle undo tree
nnoremap <M-u> :UndotreeToggle<CR>

" }}}
" Mappings - leader {{{

" Map Leader
map <Space> <Leader>
" Write operations
nnoremap <Leader><Space> :w<CR>
" Change tab type
nnoremap <Leader><Tab> :setlocal <C-R>=&expandtab ? 'noexpandtab' : 'expandtab'<CR><CR>
" Open from cwd
nnoremap <Leader><CR> :Files<CR>
" Marks
nnoremap <Leader>' :Marks<CR>
" Commands
nnoremap <Leader>; :Commands<CR>
" FZF show commands
nmap <Leader>. <plug>(fzf-maps-n)
" Blurred lines
nnoremap <Leader>/ :Lines<CR>
" Find next non-unicode character
nnoremap <Leader>@ /[^[:alnum:][:punct:][:space:]]<CR>:echo "Searching for non-unicode characters"<CR>
" Move to current tab format, remove trailing space and re-indent file
nnoremap <Leader>= :retab<CR>mzggvG@tgv=`z
" Fix linting issues
nnoremap <Leader>a :ALEFix<CR>
" Switch to buffer
nnoremap <Leader>b :Buffers<CR>!term ![No Name] 
" Find (respect .gitignore, include hidden files, ignore .git dir)
nnoremap <Leader>fg :FindGit 
" Find (disregard .gitignore, include hidden files, ignore .git dir)
nnoremap <Leader>ff :FindAll
" write and git add
nnoremap <Leader>ga :Gwrite<CR>
" git commit
nnoremap <Leader>gc :Gcommit<CR>i
" git diff
nnoremap <Leader>gd :Git diff<CR>
" git diff staged
nnoremap <leader>gD :Git diff --staged<CR>
" git commit --amend
nnoremap <Leader>gC :Git commit --amend --reuse-message HEAD<CR>
" git log (repo)
nnoremap <Leader>gl :Commits!<CR>
" git push
nnoremap <Leader>gp :Git push<CR>
" git push force
nnoremap <Leader>gP :Git push --force-with-lease<CR>
" git status
nnoremap <Leader>gs :Gstatus<CR>
" Git hunk controls
nmap <Leader>h <Plug>GitGutterPreviewHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
" Shortcut for alt file
nmap <Leader>p <C-^>
" Reload config
nnoremap <Leader>R :so $MYVIMRC<CR>
" Search non-UTF8 characters
nnoremap <Leader>u /[^\x00-\x7F]<CR>
" Fast open config
nnoremap <Leader>v :e ~/.dotfiles/neovim/.config/nvim/init.vim<CR>
" Sudo write
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

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
		" pane is visible
		:exe pane . "wincmd c"
	elseif buf > 0
		" buffer is not in pane
		:exe "topleft split"
	else
		" buffer is not loaded, create
		:exe "topleft split"
		:terminal
		:exe "f " a:termname
	endif
endfunction

" Add FZF commands to use ripgrep
command! -bang -nargs=* FindGit
			\ call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
command! -bang -nargs=* FindAll
			\ call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!.git/*" --color "always" --no-ignore '.shellescape(<q-args>), 1, fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
"}}}
