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
        -- Preselect the currently open buffer
        ---@type boolean
        preselect_current = true,
        -- Changes how the items are aligned: e.g. "<tag> foo    " vs "<tag>    foo"
        -- Can be "left", "right" or "file-first"
        -- NOTE: "file-first" puts the file name first and then the directory name
        ---@type "left"|"right"|"file-first"
        text_align = "file-first",
        -- Whether to remember mappings from bufnr -> tag
        persist_tags = false,
      },
      hints = {
        -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
        ---@type string
        dictionary = "asdflewcmpghio",
      },
      navigate = {
        -- You can also just use normal navigation to go to the item you want
        -- this option just sets the keybind for selecting the item under the
        -- cursor
        under_cursor = "L",
        -- In case you changed your mind, provide a keybind that lets you
        -- cancel the snipe and close the window.
        ---@type string|string[]
        cancel_snipe = { "<esc>", "q" },
      },
    },
  },
}
