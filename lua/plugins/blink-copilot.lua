-- From: https://github.com/fang2hou/blink-copilot?tab=readme-ov-file#with--lazyvim-copilot-extra
return {
  -- Import copilot extra (you can also use `:LazyExtras` to install it)
  { import = "lazyvim.plugins.extras.ai.copilot" },

  -- Source replacement
  {
    "giuxtaposition/blink-cmp-copilot",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        providers = {
          copilot = {
            module = "blink-copilot",
          },
        },
      },
    },
  },
}
