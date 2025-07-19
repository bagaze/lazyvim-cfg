return {
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      ---@type table<string, Flash.Config>
      modes = {
        char = {
          enabled = false,
        },
      },
    },
  },
  {
    "samiulsami/fFtT-highlights.nvim",
    event = "VeryLazy",
    config = function()
      ---@module "fFtT-highlights"
      ---@type fFtT_highlights.opts
      require("fFtT-highlights"):setup({
        smart_motions = false, -- whether to use f/F/t/T to go to next/previous characters
      })
    end,
  },
}
