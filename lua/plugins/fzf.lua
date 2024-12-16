return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        fzf_opts = {
          ["--layout"] = "default",
        },
        winopts = {
          -- Only valid when using a float window
          -- (i.e. when 'split' is not defined, default)
          height = 0.90, -- window height
          width = 0.90, -- window width
          preview = {
            delay = 0,
            -- vertical = "down:45%", -- up|down:size
            -- horizontal = "right:60%", -- right|left:size
            horizontal = "right:65%",
          },
        },
        defaults = {
          -- file_icons = "mini",
          -- copen        = "topleft copen",
          no_header = true, -- hide grep|cwd header?
        },
        files = {
          -- resume = true,
          -- cwd_prompt = true,
          -- no_header = true, -- hide grep|cwd header?
          -- no_header_i = false, -- hide interactive header?
        },
        grep = {
          rg_glob = true,
          glob_flag = "--iglob",
          glob_separator = "%s%-%-",
          -- no_header = true,
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
