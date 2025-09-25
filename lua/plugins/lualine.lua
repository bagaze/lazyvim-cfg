return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, {
        "harpoon2",
        color_active = { fg = Snacks.util.color("CursorLineNr") },
      })
    end,
  },
}
