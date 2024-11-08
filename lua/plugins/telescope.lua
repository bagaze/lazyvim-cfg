-- treesitter.lua
-- From: https://gist.github.com/JoshDevHub/728f0c8d46b89fde37cf88bd1d6b7211
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  keys = {
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Grep (Root dir - With args)" },
  },
  config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
        -- your config
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end
}
