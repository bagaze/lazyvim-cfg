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
vim.keymap.set({ "i", "x", "n", "s" }, "<D-w>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })
-- Global
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
vim.keymap.set({ "v" }, "p", '"P', { desc = "Paste without updating register" })

vim.keymap.set({ "i", "x", "n", "s" }, "<D-p>", ":Telescope find_files<ESC>", { desc = "Find files" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- From: https://stackoverflow.com/a/59029500
vim.keymap.set("n", "#", "#Nzz")
vim.keymap.set("n", "*", "*Nzz")

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yy<cmd>normal gcc<CR>p", { desc = "Duplicate line and comment" })

-- greatest remap ever
-- vim.keymap.set("n", "<C-c>", "ciw")
vim.keymap.set("n", "<C-x>", "viw")

-- Buffers
vim.keymap.set("n", "<leader>ba", function()
  Snacks.bufdelete.all()
end, { desc = "Delete All Buffers" })

-- Navigation
--- From: https://github.com/folke/snacks.nvim/discussions/1030#discussioncomment-12109404
vim.keymap.set("n", "<C-d>", function()
  vim.wo.scrolloff = 999
  vim.defer_fn(function()
    vim.wo.scrolloff = 8
  end, 500)
  return "<c-d>"
end, { expr = true })

vim.keymap.set("n", "<C-u>", function()
  vim.wo.scrolloff = 999
  vim.defer_fn(function()
    vim.wo.scrolloff = 8
  end, 500)
  return "<c-u>"
end, { expr = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
-- -- In insert mode
vim.keymap.set("i", "<C-h>", "<Esc>I")
vim.keymap.set("i", "<C-l>", "<Esc>A")

-- Delete to void
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void" })
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace to void" })
