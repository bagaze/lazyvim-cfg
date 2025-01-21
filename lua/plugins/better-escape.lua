return {
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
      require("better_escape").setup({
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              -- These can all also be functions
              k = "<Esc>",
            },
          },
        },
      })
    end,
  },
}
