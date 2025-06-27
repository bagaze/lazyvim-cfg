return {
  "ThePrimeagen/harpoon",
  keys = {
    -- From: https://github.com/romgrk/barbar.nvim/issues/589#issuecomment-2197160787
    {
      "<leader>H",
      function()
        require("harpoon"):list():add()
        vim.cmd(":do User")
      end,
      desc = "Harpoon File",
    },
  },
}
