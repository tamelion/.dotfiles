local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({"i","c","v"}, ",j", "<Esc>", opts, { desc = "Convenient escape sequence" })
map("n", "<S-l>", ":bnext<CR>", opts, { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", opts, { desc = "Previous buffer" })
map("n", ",j", "<Nop>", opts) -- dont use combo in n mode
map("n", "<CR>", ":w<CR>", opts, { desc = "Quick write" })
map("n", "H", "^", opts, { desc = "Home row start of line" })
map("n", "L", "$", opts, { desc = "Home row end of line" })
map("v", "<", "<gv", opts, { desc = "Keep selection afer indent left" })
map("v", ">", ">gv", opts, { desc = "Keep selection after indent right" })
map("n", "gp", "`[v`]", opts, { desc = "Visually select last paste" })
map("n", "Q", "<Nop>", opts, { desc = "" }) -- Ban ex mode
map("n", "<Leader>R", ":so $MYVIMRC<CR>", opts, { desc = "Reload config" })
map("n", "<Leader>v", ":e $MYVIMRC<CR>", opts, { desc = "Fast open config" })
map("n", "Y", "y$", opts, { desc = "Yank to end of line" })

-- TODO old maps which need a plugin
--map("n", "cd", ":Gcd<CR>:pwd<CR>", opts, { desc = "" }) -- Change dir to git repo which contains current file (then pwd)
--map("n", "<C-p>", ":GitFiles<CR>", opts, { desc = "" }) -- Open file from git repo
--map("n", "<M-b>", ":Gblame<CR>", opts, { desc = "" }) -- Toggle git blame panel
--map("n", "<M-u>", ":UndotreeToggle<CR>", opts, { desc = "" }) -- Toggle undo tree
