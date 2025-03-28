return {
  "arnamak/stay-centered.nvim",
  lazy = false,
  name = "stay-centered",
  priority = 800,
  init = function()
    require("which-key").add({
      "<leader>ut",
      function()
        local state = require("stay-centered").cfg.enabled
        if state then
          require("stay-centered").disable()
        else
          require("stay-centered").enable()
        end
      end,
      icon = function()
        local state = require("stay-centered").cfg.enabled
        return { icon = state and " " or " ", color = state and "green" or "yellow" }
      end,
      desc = function()
        local state = require("stay-centered").cfg.enabled
        return state and "Disable Stay-centered" or "Enable Stay-centered"
      end,
    })
  end,
  opts = {
    enabled = false,
    skip_filetypes = { "typescript" },
  },
}
