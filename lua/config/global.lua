-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font
vim.g.have_nerd_font = true

-- configuration files
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- plugin files
require("plugins.tokyonight")
require("plugins.treesitter")
require("plugins.lspconfig")
require("plugins.snippet")
require("plugins.autocompletion")
require("plugins.telescope")
require("plugins.formatting")
require("plugins.appearance")
require("plugins.lint")
require("plugins.file-navigation")
require("plugins.floaterminal")
require("plugins.git-config")
require("plugins.debug")
