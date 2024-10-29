local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Useful for debugging formatter issues
      format_notify = false,
      inlay_hints = { enabled = false },
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        ruby_lsp = {
          -- mason = false,
          -- cmd = { "bundle", "exec", "ruby-lsp" },
          -- init_options = {
          --   formatter = "auto",
          -- },
        },
        -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
        -- rubocop = {
        --   mason = false,
        --   cmd = { "bundle", "exec", "rubocop", "--lsp" },
        --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        -- },
        -- solargraph = {},
        -- sqlls = {},
        -- terraformls = {},
        -- tsserver = {},
        -- yamlls = {},
      },
    },
  },
}
