return {
  "gbprod/yanky.nvim",
  opts = {
    system_clipboard = {
      sync_with_ring = false,
      clipboard_register = nil,
    },
  },
  keys = {
    { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
    { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
  },
}
