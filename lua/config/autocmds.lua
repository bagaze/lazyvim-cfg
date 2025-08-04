-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Rubocop
-- vim.opt.signcolumn = "yes"
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "ruby",
--   callback = function()
--     vim.lsp.start {
--       name = "rubocop",
--       cmd = { "bundle", "exec", "rubocop", "--lsp" },
--     }
--   end,
-- })

-- RubyLSP
-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")
-- local util = require("lspconfig.util")
--
-- if not configs.ruby_lsp then
-- 	local enabled_features = {
-- 		"documentHighlights",
-- 		"documentSymbols",
-- 		"foldingRanges",
-- 		"selectionRanges",
-- 		-- "semanticHighlighting",
-- 		"formatting",
-- 		"codeActions",
-- 	}
--
-- 	configs.ruby_lsp = {
-- 		default_config = {
-- 			cmd = { "bundle", "exec", "ruby-lsp" },
-- 			filetypes = { "ruby" },
-- 			root_dir = util.root_pattern("Gemfile", ".git"),
-- 			init_options = {
-- 				enabledFeatures = enabled_features,
-- 			},
-- 			settings = {},
-- 		},
-- 		commands = {
-- 			FormatRuby = {
-- 				function()
-- 					vim.lsp.buf.format({
-- 						name = "ruby_lsp",
-- 						async = true,
-- 					})
-- 				end,
-- 				description = "Format using ruby-lsp",
-- 			},
-- 		},
-- 	}
-- end
--
-- lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })

-- Disable spelling in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Disable autoformat for eruby (.erb) and typescript files
-- To find FileType use: `lua print(vim.bo.filetype)`
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "eruby", "typescriptreact", "typescript" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Copy last yanked text to clipboard on focusLost
-- From: https://www.reddit.com/r/neovim/comments/1l4tubm/copy_last_yanked_text_to_clipboard_on_focuslost/
-- vim.api.nvim_create_autocmd("FocusLost", {
--   desc = "Copy to clipboard on FocusLost",
--   callback = function()
--     vim.fn.setreg("+", vim.fn.getreg("0"))
--   end,
-- })
