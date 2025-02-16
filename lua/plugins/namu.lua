return {
  {
    "bassamsdata/namu.nvim",
    opts = {
      -- Enable the modules you want
      namu_symbols = {
        enable = true,
        options = {
          movement = {
            next = { "<C-j>", "<DOWN>" },
            previous = { "<C-k>", "<UP>" },
            close = { "<C-c>", "<ESC>" },
          },
        },
      },
      colorscheme = { enable = false },
      ui_select = { enable = false },
    },
    keys = {
      {
        "<leader>sN",
        ":lua require('namu.namu_symbols').show()<CR>",
        mode = "n",
        silent = true,
        desc = "LSP Symbols",
      },
      -- {
      --   "<leader>th",
      --   ":lua require('namu.colorscheme').show()<CR>",
      --   mode = "n",
      --   silent = true,
      --   desc = "Colorscheme Picker",
      -- },
    },
  },
}
