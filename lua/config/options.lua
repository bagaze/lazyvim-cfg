-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
-- vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"

-- Global settings
local opt = vim.opt

-- No swapfile
opt.swapfile = false

-- Active case on search
opt.ignorecase = false

-- Don't use the system clipboard by default
-- opt.clipboard = "unnamedplus"

-- Autoformat on save
vim.g.autoformat = false

-- Relative line number
vim.wo.relativenumber = false

-- Deactivate vim cursorline
vim.g.cursorline = false

-- For luarocks
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "14.7")

-- From: https://github.com/LazyVim/LazyVim/issues/2327#issuecomment-1882020758
-- Don't sync clipboard with system
opt.clipboard = ""
-- Don't make popup menu transparent
opt.pumblend = 0
