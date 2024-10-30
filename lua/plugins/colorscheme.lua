return {
  -- add gruvbox
  { "maxmx03/solarized.nvim" },
  { "shaunsingh/moonlight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "olimorris/onedarkpro.nvim", priority = 100 },
  { "sainnhe/sonokai" },
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      transparent_background = false,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
