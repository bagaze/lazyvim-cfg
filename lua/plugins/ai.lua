return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    -- opts = {
    --   copilot_model = "gpt-41-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
    -- },
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
    keys = {
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = "opencode", focus = true })
        end,
        desc = "Sidekick Toggle Opencode",
      },
    },
  },
}
