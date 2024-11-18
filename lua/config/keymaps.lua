-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- For wezterm
vim.keymap.set({ "n", "v" }, "<Char-0xAA>", '"+y', { desc = "Copy to clipboard" }) -- cmd+c to copy to system clipboard
vim.keymap.set({ "i", "x", "n", "s" }, "<Char-0xAB>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })
-- For Kitty
vim.keymap.set({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to clipboard" }) -- cmd+c to copy to system clipboard
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste from clipboard" }) -- cmd+v to paste from system clipboard

vim.keymap.set({ "i", "x", "n", "s" }, "<D-p>", ":Telescope find_files<ESC>", { desc = "Find files" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- From: https://stackoverflow.com/a/59029500
vim.keymap.set("n", "#", "#N")
vim.keymap.set("n", "*", "*N")
