return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
  },
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
    sources = {
      -- Add 'avante' to the list
      -- default = { "copilot" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {
            -- options for blink-cmp-avante
            file_selector = {
              --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
              provider = "snacks",
              -- Options override for custom providers
              provider_opts = {},
            },
          },
        },
      },
    },
  },
}
