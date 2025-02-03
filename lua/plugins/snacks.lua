return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        -- can be set to "bottom", "top", "float"
        position = "float",
      },
    },
    picker = {
      ---@class snacks.picker.formatters.Config
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
          truncate = 80, -- truncate the file path to (roughly) this length
        },
      },
      sources = {
        files = {
          layout = {
            preset = "vscode",
          },
        },
        smart = {
          layout = {
            preset = "vscode",
          },
        },
        explorer = {
          hidden = true,
        },
      },
      layout = {
        cycle = true,
        --- Use the default layout or vertical if the window is too narrow
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
    },
  },
  keys = {
    -- Restore previous session
    {
      "<leader>;",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume previous picker",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find files (Smart)",
    },
  },
}
