-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- Disable smooth scrolling
vim.g.snacks_animate = false

-- Global settings
local opt = vim.opt

-- No swapfile
opt.swapfile = false

-- Active case on search
opt.ignorecase = false

-- Don't use the system clipboard by default
-- opt.clipboard = "unnamedplus"

-- Autoformat on save
vim.g.autoformat = true
-- Disable autoformat for eruby (.erb) files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "eruby" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Relative line number
vim.wo.relativenumber = true

-- Deactivate vim cursorline
vim.g.cursorline = false

-- For luarocks
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "14.7")

-- From: https://github.com/LazyVim/LazyVim/issues/2327#issuecomment-1882020758
-- Don't sync clipboard with system
opt.clipboard = ""
-- Don't make popup menu transparent
opt.pumblend = 0

-- Customize line number appearance
-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
--   callback = function()
--     local separator = " ▎ "
--     vim.opt.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum."'
--       .. separator
--       .. '":""}'
--       .. '%#LineNr3#%{(v:relnum == 3)?v:relnum."'
--       .. separator
--       .. '":""}'
--       .. '%#LineNr2#%{(v:relnum == 2)?v:relnum."'
--       .. separator
--       .. '":""}'
--       .. '%#LineNr1#%{(v:relnum == 1)?v:relnum."'
--       .. separator
--       .. '":""}'
--       .. '%#LineNr0#%{(v:relnum == 0)?v:lnum." '
--       .. separator
--       .. '":""}'
--
--     vim.cmd("highlight LineNr0 guifg=#dedede")
--     vim.cmd("highlight LineNr1 guifg=#bdbdbd")
--     vim.cmd("highlight LineNr2 guifg=#9c9c9c")
--     vim.cmd("highlight LineNr3 guifg=#7b7b7b")
--     vim.cmd("highlight LineNr4 guifg=#5a5a5a")
--   end,
-- })
