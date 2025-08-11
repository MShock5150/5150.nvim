vim.pack.add({"https://github.com/folke/tokyonight.nvim"})
vim.cmd[[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
