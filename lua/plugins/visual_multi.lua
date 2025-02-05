return {
  "mg979/vim-visual-multi",
  lazy = false,
  -- From: https://github.com/mg979/vim-visual-multi/issues/243#issuecomment-2519928885
  init = function()
    -- Fixes conflict with treesitter-textobjects bindings
    vim.g.VM_maps = {
      ["Find Under"] = "<D-d>",
      ["Find Subword Under"] = "<D-d>",
      ["Goto Next"] = "]v", -- can be any bind
      ["Goto Prev"] = "[v",
      ["Add Cursor Down"] = "<M-Down>",
      ["Add Cursor Up"] = "<M-Up>",
    }
  end,
  -- config = function()
  --   -- Hack around issue with conflicting insert mode <BS> mapping
  --   -- between this plugin and nvim-autopairs
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "visual_multi_start",
  --     callback = function()
  --       pcall(vim.keymap.del, "i", "<BS>", { buffer = 0 })
  --     end,
  --   })
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "visual_multi_exit",
  --     callback = function()
  --       require("nvim-autopairs").force_attach()
  --     end,
  --   })
  -- end,
}
