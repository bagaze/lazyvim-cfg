return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      copilot_model = "gpt-4o-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      nes = {
        ---@type boolean|fun(buf:integer):boolean?
        enabled = false,
      },
    },
  },
}
