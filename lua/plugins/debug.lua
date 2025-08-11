vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/mfussenegger/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
	{ src = "https://github.com/folke/trouble.nvim" },
})

local function setup_debugging()
	local dap = require("dap")
	local dapui = require("dapui")
	local trouble = require("trouble")

	vim.keymap.set("n", "<F5>", function()
		dap.continue()
	end, { desc = "Debug: Start/Continue" })
	vim.keymap.set("n", "<F1>", function()
		dap.step_into()
	end, { desc = "Debug: Step Into" })
	vim.keymap.set("n", "<F2>", function()
		dap.step_over()
	end, { desc = "Debug: Step Over" })
	vim.keymap.set("n", "<F3>", function()
		dap.step_out()
	end, { desc = "Debug: Step Out" })
	vim.keymap.set("n", "<leader>b", function()
		dap.toggle_breakpoint()
	end, { desc = "Debug: Toggle Breakpoint" })
	vim.keymap.set("n", "<leader>B", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "Debug: Set Breakpoint" })
	vim.keymap.set("n", "<F7>", function()
		dapui.toggle()
	end, { desc = "Debug: Toggle DAP UI" })

	vim.keymap.set("n", "<leader>xx", function()
		trouble.toggle()
	end, { desc = "Toggle Trouble" })
	vim.keymap.set("n", "<leader>xw", function()
		trouble.toggle("workspace_diagnostics")
	end, { desc = "Workspace Diagnostics" })
	vim.keymap.set("n", "<leader>xd", function()
		trouble.toggle("document_diagnostics")
	end, { desc = "Document Diagnostics" })

	require("mason-nvim-dap").setup({
		automatic_installation = true,
		ensure_installed = {
			"delve",
			"debugpy",
			"vscode-bash-debug",
			"lua-dbg",
			"pwa-node", -- Example for Go debugging. Add other debuggers here.
		},
	})

	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
		controls = {
			icons = {
				pause = "⏸",
				play = "▶",
				step_into = "⏎",
				step_over = "⏭",
				step_out = "⏮",
				step_back = "b",
				run_last = "▶▶",
				terminate = "⏹",
				disconnect = "⏏",
			},
		},
	})

	dap.listeners.after.event_initialized["dapui_config"] = dapui.open
	dap.listeners.before.event_terminated["dapui_config"] = dapui.close
	dap.listeners.before.event_exited["dapui_config"] = dapui.close

	require("dap-go").setup({
		delve = {
			detached = vim.fn.has("win32") == 0,
		},
	})

	require("trouble").setup()
end

setup_debugging()
