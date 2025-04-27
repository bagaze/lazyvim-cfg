return {
  {
    -- git blame plugin
    "f-person/git-blame.nvim",
    -- dir = "~/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      enabled = true,
      message_template = "  <author> • <date> • <summary> • <<sha>>",
      date_format = "%r",
      virtual_text_column = 1,
      schedule_event = "CursorHold",
      clear_event = "CursorHoldI",
      delay = 150,
    },
    keys = {
      {
        "<leader>gtu",
        "<cmd>GitBlameToggle<cr>",
        desc = "toggle git blame",
      },
      {
        "<leader>gte",
        "<cmd>GitBlameEnable<cr>",
        desc = "enable git blame",
      },
      {
        "<leader>gtd",
        "<cmd>GitBlameDisable<cr>",
        desc = "disable git blame",
      },
      {
        "<leader>gth",
        "<cmd>GitBlameCopySHA<cr>",
        desc = "copy line commit SHA",
      },
      {
        "<leader>gtl",
        "<cmd>GitBlameCopyCommitURL<cr>",
        desc = "copy line commit URL",
      },
      {
        "<leader>gto",
        "<cmd>GitBlameOpenCommitURL<cr>",
        desc = "opens commit in default browser",
      },
      {
        "<leader>gtc",
        "<cmd>GitBlameCopyFileURL<cr>",
        desc = "copy file url to clipboard",
      },
    },
  },
  {
    "folke/which-key.nvim",
    -- default show git blame when open git files
    opts = {
      spec = {
        { "<leader>gt", group = "git blame+" },
        { "<leader>gi", group = "git diff+" },
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>gio",
        "<cmd>DiffviewOpen<cr>",
        desc = "open diffview",
      },
      {
        "<leader>gim",
        "<cmd>DiffviewOpen origin/master<cr>",
        desc = "open diffview with origin/master",
      },
      {
        "<leader>gib",
        "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>",
        desc = "open diffview with base branch",
      },
      {
        "<leader>gif",
        "<cmd>DiffviewFileHistory --range=origin/HEAD...HEAD --right-only --no-merges<cr>",
        desc = "compare individual commits",
      },
      {
        "<leader>gic",
        "<cmd>DiffviewClose<cr>",
        desc = "close diffview",
      },
    },
    config = function(_, opts)
      require("diffview").setup(opts)

      local function set_diff_highlights()
        local is_dark = vim.o.background == "dark"

        if is_dark then
          vim.api.nvim_set_hl(0, "DiffAdd", { fg = "none", bg = "#2e4b2e", bold = true })
          vim.api.nvim_set_hl(0, "DiffDelete", { fg = "none", bg = "#4c1e15", bold = true })
          vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "#45565c", bold = true })
          vim.api.nvim_set_hl(0, "DiffText", { fg = "none", bg = "#996d74", bold = true })
        else
          vim.api.nvim_set_hl(0, "DiffAdd", { fg = "none", bg = "palegreen", bold = true })
          vim.api.nvim_set_hl(0, "DiffDelete", { fg = "none", bg = "tomato", bold = true })
          vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "lightblue", bold = true })
          vim.api.nvim_set_hl(0, "DiffText", { fg = "none", bg = "lightpink", bold = true })
        end
      end

      set_diff_highlights()

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("DiffColors", { clear = true }),
        callback = set_diff_highlights,
      })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = true,
    opts = {
      mappings = {
        commit_editor = {
          ["<c-s><c-s>"] = "Submit",
          ["<c-s><c-k>"] = "Abort",
        },
        commit_editor_I = {
          ["<c-s><c-s>"] = "Submit",
          ["<c-s><c-k>"] = "Abort",
        },
        rebase_editor = {
          ["<c-s><c-s>"] = "Submit",
          ["<c-s><c-k>"] = "Abort",
        },
        rebase_editor_I = {
          ["<c-s><c-s>"] = "Submit",
          ["<c-s><c-k>"] = "Abort",
        },
      },
    },
    keys = {
      {
        "<leader>gn",
        "<cmd>Neogit<cr>",
        desc = "open neogit",
      },
    },
  },
}
