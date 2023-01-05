local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to exit insert mode 
map("i", ",j", "<ESC>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
