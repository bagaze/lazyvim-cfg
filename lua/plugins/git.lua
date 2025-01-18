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
        "<leader>gbu",
        "<cmd>GitBlameToggle<cr>",
        desc = "toggle git blame",
      },
      {
        "<leader>gbe",
        "<cmd>GitBlameEnable<cr>",
        desc = "enable git blame",
      },
      {
        "<leader>gbd",
        "<cmd>GitBlameDisable<cr>",
        desc = "disable git blame",
      },
      {
        "<leader>gbh",
        "<cmd>GitBlameCopySHA<cr>",
        desc = "copy line commit SHA",
      },
      {
        "<leader>gbl",
        "<cmd>GitBlameCopyCommitURL<cr>",
        desc = "copy line commit URL",
      },
      {
        "<leader>gbo",
        "<cmd>GitBlameOpenCommitURL<cr>",
        desc = "opens commit in default browser",
      },
      {
        "<leader>gbc",
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
        { "<leader>gb", group = "git blame+" },
        { "<leader>gd", group = "git diff+" },
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
        "<leader>gdo",
        "<cmd>DiffviewOpen<cr>",
        desc = "open diffview",
      },
      {
        "<leader>gdm",
        "<cmd>DiffviewOpen origin/master<cr>",
        desc = "open diffview with origin/master",
      },
      {
        "<leader>gdb",
        "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>",
        desc = "open diffview with base branch",
      },
      {
        "<leader>gdf",
        "<cmd>DiffviewFileHistory --range=origin/HEAD...HEAD --right-only --no-merges<cr>",
        desc = "compare individual commits",
      },
      {
        "<leader>gdc",
        "<cmd>DiffviewClose<cr>",
        desc = "close diffview",
      },
    },
  },
}
