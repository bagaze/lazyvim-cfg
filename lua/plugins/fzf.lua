return {
  {
    "ibhagwan/fzf-lua",
    opts = {
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
      oldfiles = {
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB
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
    },
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
        "<cmd>lua require('fzf-lua').resume()<cr>",
        mode = { "n" },
        desc = "Resume previous fzf picker",
      },
    },
  },
}
