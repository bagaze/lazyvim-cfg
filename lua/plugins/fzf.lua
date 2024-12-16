return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        fzf_opts = {
          ["--layout"] = "default",
        },
        files = {
          -- resume = true,
          -- cwd_prompt = true,
        },
        grep = {
          rg_glob = true,
          glob_flag = "--iglob",
          glob_separator = "%s%-%-",
          -- resume = true,
          -- cwd_prompt = true,
        },
      })
    end,
    keys = {
      -- Grep visually selected content
      {
        "<leader>/",
        "<cmd>lua require('fzf-lua').grep_visual()<cr>",
        mode = { "v" },
        desc = "Grep (Visual selection)",
      },
      -- Grep under cursor
      {
        "<leader>fg",
        "<cmd>lua require('fzf-lua').grep_cword()<cr>",
        mode = { "n" },
        desc = "Grep (Under cursor)",
      },
      -- Restore previous session
      {
        "<leader>;",
        "lua require('fzf-lua').resume()",
        mode = { "n" },
        desc = "Resume previous fzf picker",
      },
    },
  },
}
