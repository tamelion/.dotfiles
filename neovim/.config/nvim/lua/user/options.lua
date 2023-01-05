local options = {
  backup = false,                          -- doesn't create a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  colorcolumn= "120",                      -- highlight columns for target max length
  completeopt = { "longest", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  confirm = true,                          -- save changed files prompt
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- convert tabs to spaces
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                        -- turn off search highlighting
  ignorecase = true,                       -- ignore case in search patterns
  linebreak = true,                        -- don't split words
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  pumheight = 10,                          -- pop up menu height
  scrolloff = 8,                           -- minimal number of screen lines to keep above/below the cursor
  shiftround = true,                       -- indent is calculated from col1, not from cursor
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  showmatch = true,                        -- show matching bracket when cursor is over one
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  signcolumn = "yes",                      -- always show, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  softtabstop = -1,                        -- backspace removes same number of spaces as shiftwidth
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- doesn't create a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time (ms) to wait for a mapped sequence to complete
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  wildmode = "longest:full,full",          -- show matches and complete longest common
  wrap = true,                             -- display lines as one long line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use
