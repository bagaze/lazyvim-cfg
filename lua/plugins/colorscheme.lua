return {
  -- Themes
  { "maxmx03/solarized.nvim" },
  { "shaunsingh/moonlight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "olimorris/onedarkpro.nvim" },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
  },
  { "tanvirtin/monokai.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "ofirgall/ofirkai.nvim" },
  { "sainnhe/everforest" },
  { "oxfist/night-owl.nvim" },
  { "Shatur/neovim-ayu" },
  { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    -- priority = 1000,
    opts = {
      transparent_background = false,
    },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
