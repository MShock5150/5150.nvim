-- local variable
local o = vim.opt

-- line numbers
o.number = true
o.relativenumber = true

-- clipboard sync
o.clipboard = 'unnamedplus'

-- indent and tab
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true

-- better ui
o.termguicolors = true
o.cursorline = true
o.scrolloff = 8
o.ignorecase = true
o.smartcase = true

-- text wrapping
o.wrap = true
o.textwidth = 80
o.linebreak = true

-- signcolumn
o.signcolumn = 'yes'

-- default floating window boarder
o.winborder = 'double'
