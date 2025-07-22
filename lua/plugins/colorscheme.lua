return {
  -- Themes
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    -- priority = 1001,
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
        dark_orange = "#FF4D00",
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
          ["@keyword.conditional"] = { fg = colors.pink, italic = true },
          ["@keyword.repeat"] = { fg = colors.pink, italic = true },
          ["@keyword"] = { fg = colors.pink, italic = true },
          ["@keyword.function"] = { fg = colors.cyan, italic = true },
          ["@keyword.function.ruby"] = { fg = colors.pink, italic = true },
          ["@keyword.operator"] = { fg = colors.pink, italic = true },
          ["@keyword.exception"] = { fg = colors.purple, italic = true },
          ["@keyword.include"] = { fg = colors.pink, italic = true },
          CursorLineNr = { fg = colors.dark_orange, bold = true },
        }
      end,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    -- lazy = true,
    -- priority = 1000,
    opts = {
      transparent = true,
      dimInactive = false,
      -- From: https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#transparent-floating-windows
      overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Dark completion (popup) menu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency,,
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = colors.palette.boatYellow2 },
          BlinkCmpMenuBorder = { fg = "", bg = "" },

          -- Tint background of diagnostic messages with their foreground color
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

          -- Visual
          Visual = { fg = colors.palette.waveRed, bg = theme.ui.bg_p3 },
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
    lazy = true,
    -- lazy = false,
    -- priority = 900,
    opts = {
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false, -- Enable this to disable setting the background color
      on_colors = function(colors)
        colors.comment = "#5872a4"
      end,
      on_highlights = function(hl, colors)
        hl.LineNr = { fg = colors.orange, bold = true }
        hl.CursorLineNr = { fg = colors.green, bold = true }
        hl.LineNrAbove = { fg = colors.orange }
        hl.LineNrBelow = { fg = colors.orange }
        hl.Visual = { fg = colors.red, bg = colors.highlight_low }
        hl.VisualNonText = { fg = colors.nontext, bg = colors.highlight_low }
        hl.comment = { fg = colors.comment }
        hl.perlComment = { fg = colors.comment }
        hl.Comment = { fg = colors.comment }
      end,
      styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "normal", -- style for sidebars, see below
        floats = "normal", -- style for floating windows
      },
    },
  },
  -- Default theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine-moon",
      colorscheme = "tokyonight",
    },
  },
}
