return {
  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinLeave" },
    opts = {
      -- choose between "single", "rounded", "bold" and "double".
      border = "bold",
      animate = {
        ---@type "shift"|"progressive"|false
        enabled = false,
      },
      indicator_for_2wins = {
        -- only work when the total of windows is two
        position = "center", -- false to disable or choose between "center", "start", "end" and "both"
      },
    },
  },
}
