vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/NMAC427/guess-indent.nvim" },
})

require('nvim-autopairs').setup()
require('conform').setup({
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black', 'ruff' },
    go = { 'gofumpt' },
    sql = { 'sql-formatter' },
    -- Add other file types and their formatters here.
  },
  notify_on_error = false,
})

