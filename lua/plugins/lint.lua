vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

local lint = require('lint')
lint.linters_by_ft = {
  bash = { 'shellcheck' },
  go = { 'golangcilint' },
  html = { 'htmlhint' },
  htmx = { 'htmlhint' },
  json = { 'jsonlint' },
  lua = { 'luacheck' },
  markdown = { 'markdownlint', 'vale' },
  python = { 'flake8', 'pylint' },
  yaml = { 'yamllint' },
}

