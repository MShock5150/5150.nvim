vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>oc", function()
	require("oil").open(vim.fn.stdpath("config"))
end, { desc = "Open Neovim config directory" })
