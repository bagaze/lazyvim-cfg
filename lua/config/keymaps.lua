-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ 'n', 'v' }, '<D-c>', '"+y') -- cmd+c to copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+p') -- cmd+v to paste from system clipboard
