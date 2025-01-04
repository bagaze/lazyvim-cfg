return {
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({})
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>k",
        function()
          require("lazydocker").open()
        end,
        desc = "Lazydocker",
      },
    },
  },
}
