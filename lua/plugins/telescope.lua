-- treesitter.lua
-- From: https://gist.github.com/JoshDevHub/728f0c8d46b89fde37cf88bd1d6b7211
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.1.0",
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")

      local find_files_reset = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", { no_ignore = false, hidden = false, default_text = line })()
      end

      opts.extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      }
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<a-r>"] = find_files_reset,
          },
          n = { -- while in normal mode
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      })
    end,
    keys = {
      -- Replace default with grep with args
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        mode = { "n" },
        desc = "Grep (Root dir - With args)",
      },
      -- Grep visually selected content
      {
        "<leader>/",
        "<cmd>lua require('telescope-live-grep-args.shortcuts')"
          .. ".grep_visual_selection({ postfix = '', trim = true, quote = false })<cr>",
        mode = { "v" },
        desc = "Grep (Visual selection)",
      },
      -- Grep under cursor
      {
        "<leader>fg",
        "<cmd>lua require('telescope-live-grep-args.shortcuts')"
          .. ".grep_word_under_cursor({ postfix = '', trim = true, quote = false })<cr>",
        mode = { "n" },
        desc = "Grep (Under cursor)",
      },
      -- Restore previous session
      {
        "<leader>;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        mode = { "n" },
        desc = "Resume previous telescope picker",
      },
    },
  },
}
