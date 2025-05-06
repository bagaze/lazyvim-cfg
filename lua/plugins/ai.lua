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
    -- event = "VeryLazy",
    cmd = { "AvanteToggle" },
    lazy = true,
    version = false, -- set this if you want to always pull the latest change
    -- full config: https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
    -- cfg inspired by: https://github.com/gokhangeyik/dotfiles/blob/main/nvim/lua/plugins/avante.lua
    opts = {
      ---@alias Mode "agentic" | "legacy"
      mode = "legacy",
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "cp_o3_mini",
      cursor_applying_provider = nil,
      auto_suggestions_provider = nil,
      behaviour = {
        auto_suggestions = false,
      },
      windows = {
        ask = {
          start_insert = false,
        },
      },
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        -- timeout = 5 * 60 * 1000, -- Timeout in milliseconds
        -- temperature = 0,
        -- reasoning_effort = "high",
      },
      file_selector = {
        provider = "snacks",
      },
      vendors = {
        -- cp_gpt4o = {
        --   __inherited_from = "copilot",
        --   model = "gpt-4o-2024-08-06",
        --   timeout = 30000, -- Timeout in milliseconds
        --   temperature = 0,
        --   -- max_tokens = 8192,
        -- },
        cp_claude_35 = {
          __inherited_from = "copilot",
          model = "claude-3.5-sonnet",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          -- max_tokens = 8192,
        },
        cp_claude_37 = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          -- max_tokens = 8192,
        },
        cp_claude_37_thinking = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet-thought",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          -- max_tokens = 8192,
        },
        -- Unavailable
        cp_o1 = {
          __inherited_from = "copilot",
          model = "o1",
        },
        -- Unavailable
        cp_o3_mini = {
          __inherited_from = "copilot",
          model = "o3-mini",
        },
        -- Available
        cp_gemini = {
          __inherited_from = "copilot",
          model = "gemini-2.0-flash-001",
        },
      },
      -- Hide unavailable models
      aihubmix = {
        hide_in_model_selector = true,
      },
      ["aihubmix-claude"] = {
        hide_in_model_selector = true,
      },
      openai = {
        hide_in_model_selector = true,
      },
      ["openai-gpt-4o-mini"] = {
        hide_in_model_selector = true,
      },
      cohere = {
        hide_in_model_selector = true,
      },
      claude = {
        hide_in_model_selector = true,
      },
      ["claude-opus"] = {
        hide_in_model_selector = true,
      },
      ["claude-haiku"] = {
        hide_in_model_selector = true,
      },
      gemini = {
        hide_in_model_selector = true,
      },
      vertex = {
        hide_in_model_selector = true,
      },
      vertex_claude = {
        hide_in_model_selector = true,
      },
      bedrock = {
        hide_in_model_selector = true,
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
      { "<leader>at", "<Cmd>AvanteToggle<CR>", desc = "avante: toggle" },
    },
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
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
