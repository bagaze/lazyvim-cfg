return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
    },
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
    -- Experimental signature help support
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
}
