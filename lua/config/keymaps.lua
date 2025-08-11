-- local variables
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- clear hilights on search
set("n", "<Esc>", ":nohlsearch<CR>", opts)

-- exit terminal mode
set("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- netrw
set("n", "<leader>e", ":Oil<CR>", opts)

-- window navigation
set("n", "<C-h>", "<C-w>h", opts)
set("n", "<C-j>", "<C-w>j", opts)
set("n", "<C-k>", "<C-w>k", opts)
set("n", "<C-l>", "<C-w>l", opts)

-- sourse and execute lua
set("n", "<leader>so", ":source %<CR>", opts)
set("n", "<leader>x", ":.lua<CR>", opts)
set("v", "<leader>x", ":lua<CR>", opts)
