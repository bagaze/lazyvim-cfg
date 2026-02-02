return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      {
        "<leader>uB",
        "<cmd>DBUIToggle<cr>",
        desc = "Toggle DBUI",
        mode = { "n", "v" },
      },
    },
  },
  {
    "Maxteabag/sqlit.nvim",
    opts = {},
    keys = {
      {
        "<leader>D",
        function()
          require("sqlit").open()
        end,
        desc = "Database (sqlit)",
      },
    },
  },
}
