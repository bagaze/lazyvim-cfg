return {
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {
  --     preview = {
  --       icon_provider = "mini", -- "devicons" or "mini" or "internal"
  --     },
  --   },
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto", "Avante" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "quarto", "Avante" },
    },
  },
}
