return {
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "gb",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = {
      ui = {
        ---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
        position = "center",
        ---@type vim.api.keyset.win_config
        open_win_override = {
          ---@type "single"|"rounded"
          border = "rounded", -- use "single" for single border
        },
      },
      navigate = {
        ---@type string|string[]
        cancel_snipe = { "<esc>", "q" },
      },
    },
  },
}
