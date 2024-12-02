return {
  -- Themes
  { "maxmx03/solarized.nvim" },
  { "shaunsingh/moonlight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "olimorris/onedarkpro.nvim" },
  {
    "sainnhe/sonokai",
    -- lazy = false,
    -- priority = 1000,
  },
  { "tanvirtin/monokai.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "ofirgall/ofirkai.nvim" },
  { "sainnhe/everforest" },
  { "oxfist/night-owl.nvim" },
  { "Shatur/neovim-ayu" },
  { "EdenEast/nightfox.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      styles = { transparency = true },
    },
  },
  {
    "catppuccin/nvim",
    -- lazy = false,
    -- priority = 900,
    -- opts = {
    --   transparent_background = true,
    -- },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "rose-pine-moon",
    },
  },
}
