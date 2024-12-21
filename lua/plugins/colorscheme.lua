return {
  -- Themes
  { "Mofiqul/dracula.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      styles = { transparency = true },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 900,
    opts = {
      transparent_background = true,
    },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine-moon",
    },
  },
}
