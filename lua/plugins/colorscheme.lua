return {
  -- Themes
  { "Mofiqul/dracula.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = function()
      local palette = require("rose-pine.palette")
      return {
        styles = { transparency = true },
        highlight_groups = {
          Visual = { fg = "#FF5DA9", bg = palette.base },
        },
      }
    end,
  },
  -- {
  --   "philosofonusus/morta.nvim",
  --   name = "morta",
  --   lazy = false,
  --   priority = 1001,
  --   opts = {
  --     transparent_background = true,
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false,
    -- priority = 900,
    opts = {
      transparent_background = true,
    },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "rose-pine-moon",
      -- colorscheme = "morta",
    },
  },
}
