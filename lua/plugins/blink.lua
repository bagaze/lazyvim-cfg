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
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
  },
}
