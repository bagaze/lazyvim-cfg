return {
  -- add gruvbox
  { "maxmx03/solarized.nvim" },
  { "shaunsingh/moonlight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "olimorris/onedarkpro.nvim", priority = 100 },
  { "sainnhe/sonokai" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
