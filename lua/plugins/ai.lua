return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      copilot_model = "gpt-4o-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    version = false, -- set this if you want to always pull the latest change
    -- full config: https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
    opts = {
      behaviour = {
        auto_suggestions = false,
      },
      windows = {
        ask = {
          start_insert = false,
        },
      },
      provider = "copilot",
      copilot = {
        model = "claude-3.7-sonnet",
        temperature = 0,
        max_tokens = 8192,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- dynamically build it, taken from astronvim
    build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    dependencies = {
      -- "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
    keys = {
      -- { "<c-s>", "<CR>", ft = "codecompanion", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aC",
        "<cmd>AvanteClear<cr>",
        desc = "avante: clear",
        mode = { "n", "v" },
      },
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   version = "*", -- use latest release instead of latest commit
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "j-hui/fidget.nvim",
  --   },
  --   opts = {
  --     adapters = {
  --       copilot = function()
  --         return require("codecompanion.adapters").extend("copilot", {
  --           schema = {
  --             model = {
  --               default = "claude-3.7-sonnet",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = "copilot",
  --       },
  --       inline = {
  --         adapter = "copilot",
  --       },
  --       agent = {
  --         adapter = "copilot",
  --       },
  --     },
  --     opts = {
  --       -- Set debug logging
  --       -- log_level = "DEBUG",
  --     },
  --   },
  --   keys = {
  --     -- { "<c-s>", "<CR>", ft = "codecompanion", desc = "Submit Prompt", remap = true },
  --     { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
  --     {
  --       "<leader>aa",
  --       "<cmd>CodeCompanionChat Toggle<cr>",
  --       desc = "Toggle (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>aq",
  --       "<cmd>CodeCompanion",
  --       desc = "Quick Chat (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>ap",
  --       "<cmd>CodeCompanionActions<cr>",
  --       desc = "Prompt Actions (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --   },
  --   init = function()
  --     require("plugins.codecompanion.fidget-spinner"):init()
  --   end,
  -- },
}
