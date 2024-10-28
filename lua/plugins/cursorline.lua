return { "yamatsum/nvim-cursorline",
  opts = {
    cursorline = {
      enable = true,
      timeout = 150,
      number = false,
    },
    cursorword = {
      enable = false,
      min_length = 3,
      hl = { underline = false },
    }
  },
}
