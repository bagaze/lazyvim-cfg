local layouts = require("snacks.picker.config.layouts")

layouts.custom = vim.tbl_deep_extend("keep", { layout = { height = 0.95, width = 0.95 } }, layouts.default)
layouts.custom.layout[2].width = 0.6

layouts.vscode_custom = vim.tbl_deep_extend("keep", { layout = { width = 0.60 } }, layouts.vscode)

return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        -- can be set to "bottom", "top", "float"
        position = "float",
      },
    },
    styles = {
      lazygit = {
        width = 0.96,
        height = 0.95,
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
            preset = "vscode_custom",
          },
        },
        smart = {
          layout = {
            preset = "vscode_custom",
          },
        },
        explorer = {
          hidden = true,
        },
        lsp_symbols = {
          layout = {
            preset = "vscode",
            preview = "main",
          },
        },
        treesitter = {
          layout = {
            preset = "vscode",
            preview = "main",
          },
        },
      },
      layout = {
        cycle = true,
        --- Use the default layout or vertical if the window is too narrow
        preset = function()
          return vim.o.columns >= 120 and "custom" or "vertical"
        end,
      },
    },
  },
  keys = {
    -- Deactivate lsp_symbols
    -- { "<leader>ss", false },
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
    {
      "<leader>gr",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git branches",
    },
  },
}
