return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    -- build = "./kitty/install-kittens.bash",
    opts = {
      -- 'wrap' => Wrap to opposite side - not supported on Kitty
      -- 'split' => Create a new split in the desired direction
      -- 'stop' => Do nothing
      at_edge = "stop",
      -- disable multiplexer navigation if current multiplexer pane is zoomed
      -- default: true
      disable_multiplexer_nav_when_zoomed = false,
    },
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above window",
      },
      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize left",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize right",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize down",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize up",
      },
    },
  },
}
