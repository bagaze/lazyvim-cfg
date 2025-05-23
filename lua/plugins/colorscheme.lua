return {
  -- Themes
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1001,
    opts = {
      italic_comment = true,
      -- Ref: https://github.com/Mofiqul/dracula.nvim/blob/main/lua/dracula/palette.lua
      colors = {
        bg = "#232137",
        comment = "#7081b5",
        nontext = "#768291",
        -- pink = "#50fa7b",
        -- green = "#FF79C6",
        black = "#44475A",
        highlight_low = "#4A4B54",
        highlight_med = "#403d52",
        dark_pink = "#FF5DA9",
      },
      -- miss dracula from: https://github.com/MariaSolOs/dotfiles/blob/main/.config/nvim/colors/miss-dracula.lua
      -- colors = {
      --   bg = "#0E1419",
      --   black = "#000000",
      --   bright_blue = "#D0B5F3",
      --   bright_cyan = "#BCF4F5",
      --   bright_green = "#97EDA2",
      --   bright_magenta = "#E7A1D7",
      --   bright_red = "#EC6A88",
      --   bright_white = "#FFFFFF",
      --   bright_yellow = "#F6F6B6",
      --   comment = "#B08BBB",
      --   cyan = "#A7DFEF",
      --   fg = "#F6F6F5",
      --   fuchsia = "#E11299",
      --   green = "#87E58E",
      --   grey = "#A9ABAC",
      --   gutter_fg = "#4B5263",
      --   lavender = "#6272A4",
      --   lilac = "#6D5978",
      --   menu = "#21222C",
      --   neon_cyan = "#00DFDF",
      --   nontext = "#3B4048",
      --   orange = "#FFBFA9",
      --   pink = "#E48CC1",
      --   purple = "#BAA0E8",
      --   red = "#E95678",
      --   selection = "#3C4148",
      --   transparent_black = "#1E1F29",
      --   transparent_blue = "#19272C",
      --   transparent_green = "#22372c",
      --   transparent_red = "#342231",
      --   transparent_yellow = "#202624",
      --   visual = "#3E4452",
      --   white = "#F6F6F5",
      --   yellow = "#E8EDA2",
      -- },
      overrides = function(colors)
        return {
          Visual = { fg = colors.red, bg = colors.highlight_low },
          VisualNonText = { fg = colors.nontext, bg = colors.highlight_low },
          RenderMarkdownH1Bg = { fg = colors.white, bg = colors.bg },
          RenderMarkdownH2Bg = { fg = colors.pink, bg = colors.bg },
          RenderMarkdownH3Bg = { fg = colors.cyan, bg = colors.bg },
          RenderMarkdownH4Bg = { fg = colors.green, bg = colors.bg },
          RenderMarkdownH5Bg = { fg = colors.purple, bg = colors.bg },
          SpellBad = { sp = colors.red, undercurl = true },
          LspReferenceText = { bg = colors.highlight_med },
          LspReferenceRead = { bg = colors.highlight_med },
          LspReferenceWrite = { bg = colors.highlight_med },
        }
      end,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    -- lazy = false,
    -- priority = 1000,
    -- opts = function()
    --   return {
    --     -- styles = { transparency = true },
    --     highlight_groups = {
    --       Visual = { fg = "#FF5DA9", bg = "#FFFFFF" },
    --     },
    --   }
    -- end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false,
    -- priority = 900,
    opts = {
      transparent_background = true,
    },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine-moon",
      colorscheme = "dracula",
    },
  },
}
