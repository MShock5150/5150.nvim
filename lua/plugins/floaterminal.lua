local M = {}
local terminal_window = nil

-- The `toggle_terminal` function creates a floating terminal window with
-- customizable dimensions and a specified command.
-- @param cmd The command to run in the terminal (e.g., "bash", "lazygit").
-- @param options A table with optional width and height.
M.toggle_terminal = function(cmd, options)
	options = options or {}

	-- If the window already exists, close it.
	if terminal_window and vim.api.nvim_win_is_valid(terminal_window) then
		vim.api.nvim_win_close(terminal_window, true)
		terminal_window = nil
		return
	end

	-- Get the current window dimensions.
	local screen_width = vim.api.nvim_get_option("columns")
	local screen_height = vim.api.nvim_get_option("lines")

	-- Set default dimensions if not provided, 80% of the screen size.
	local width = options.width or math.floor(screen_width * 0.8)
	local height = options.height or math.floor(screen_height * 0.8)

	-- Calculate position for centering the window.
	local col = math.floor((screen_width - width) / 2)
	local row = math.floor((screen_height - height) / 2)

	-- Create the floating window.
	local buffer = vim.api.nvim_create_buf(false, true)
	terminal_window = vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		border = "rounded",
	})

	-- Open the terminal with the specified command.
	vim.api.nvim_set_current_buf(buffer)
	vim.cmd("startinsert")
	vim.fn.termopen(cmd, {
		on_exit = function()
			-- Automatically close the window when the terminal process exits.
			if vim.api.nvim_win_is_valid(terminal_window) then
				vim.api.nvim_win_close(terminal_window, true)
				terminal_window = nil
			end
		end,
	})

	-- Set terminal options to improve usability.
	vim.wo.winhl = "Normal:Normal"
	vim.api.nvim_buf_set_option(buffer, "buftype", "terminal")
	vim.api.nvim_buf_set_option(buffer, "filetype", "terminal")
end

-- Create a Vim Command to toggle the terminal window with the current buffer.
vim.api.nvim_create_user_command("Terminal", function()
	M.toggle_terminal("bash", {})
end, {
	desc = "Toggle a floating terminal window.",
})

-- === Keymaps ===

-- Open a terminal for the current buffer.
vim.keymap.set("n", "<leader>tt", function()
	M.toggle_terminal("bash", {})
end, { desc = "Floating Terminal" })

-- Open a LazyGit window in the floating terminal.
vim.keymap.set("n", "<leader>tg", function()
	M.toggle_terminal("lazygit", {})
end, { desc = "Floating LazyGit" })

-- Open a LazyDocker window in the floating terminal.
vim.keymap.set("n", "<leader>td", function()
	M.toggle_terminal("lazydocker", {})
end, { desc = "Floating LazyDocker" })

-- You can also create a keymap with custom dimensions:
-- vim.keymap.set('n', '<leader>fs', function()
--   M.toggle_terminal('bash', { width = 100, height = 20 })
-- end, { desc = 'Floating small terminal' })

return M
