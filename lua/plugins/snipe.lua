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
        max_height = 2, -- -1 means dynamic height
        -- Where to place the ui window
        -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
        position = "center",
      },
      navigate = {
        -- In case you changed your mind, provide a keybind that lets you
        -- cancel the snipe and close the window.
        cancel_snipe = "q",
      },
    },
  },
}
