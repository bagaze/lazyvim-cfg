return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        -- See: https://github.com/akinsho/bufferline.nvim/blob/655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3/doc/bufferline.txt#L168
        sort_by = "insert_at_end",
      },
    },
  },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = { "ThePrimeagen/harpoon" },
    -- From: https://github.com/romgrk/barbar.nvim/issues/589
    config = function()
      local barbar = require("barbar")
      local state = require("barbar.state")
      local render = require("barbar.ui.render")
      local harpoon = require("harpoon")

      barbar.setup({
        -- Automatically hide the tabline when there are this many buffers left.
        -- Set to any value >=0 to enable.
        auto_hide = false,

        -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
        -- Valid options are 'left' (the default), 'previous', and 'right'
        focus_on_close = "right",
        hide = {
          -- inactive = true,
        },
        icons = {
          pinned = { filename = true, buffer_index = true },
          diagnostics = { { enabled = true } },
        },
      })

      local function unpin_all()
        for _, buf in ipairs(state.buffers) do
          local data = state.get_buffer_data(buf)
          data.pinned = false
        end
      end

      local function get_buffer_by_mark(mark)
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local buffer_path = vim.api.nvim_buf_get_name(buf)

          if buffer_path == "" or mark.value == "" then
            goto continue
          end

          local mark_pattern = mark.value:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
          if string.match(buffer_path, mark_pattern) then
            return buf
          end

          local buffer_path_pattern = buffer_path:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
          if string.match(mark.value, buffer_path_pattern) then
            return buf
          end

          ::continue::
        end
      end

      local function refresh_all_harpoon_tabs()
        local list = harpoon:list()
        unpin_all()

        for i = 1, list:length() do
          local mark = list.items[i]
          if mark == nil then
            goto continue
          end

          local buf = get_buffer_by_mark(mark)
          if buf == nil then
            vim.cmd("badd " .. mark.value)
            buf = get_buffer_by_mark(mark)
          end
          if buf ~= nil then
            state.toggle_pin(buf)
          end

          ::continue::
        end
        render.update()
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufLeave", "User" }, {
        callback = refresh_all_harpoon_tabs,
      })
    end,
    keys = {
      { "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    },
  },
}
