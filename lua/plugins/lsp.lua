return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      ansiblels = {
        settings = {
          ansible = {
            validation = {
              lint = {
                -- this is also handled by prettier, and they don't quite agree
                arguments = "--skip-list=yaml",
              },
            },
          },
        },
      },
      eslint = {},
      -- Use local ruby_lsp/solargraph and rubocop instead of mason's
      -- From: https://github.com/ianchesal/dotfiles/blob/4314a33bac8b7d32133268f7db528e783b4c9f26/nvim/lua/plugins/nvim-lspconfig.lua#L32
      solargraph = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/solargraph"), "stdio" },
        settings = {
          solargraph = {
            autoformat = true,
            completion = true,
            diagnostics = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
          },
        },
      },
      -- From: https://github.com/mason-org/mason.nvim/issues/1777#issuecomment-3092418054
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
        init_options = {
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
      rubocop = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/rubocop"), "--lsp" },
      },
      -- From: https://www.lazyvim.org/extras/lang/python#nvim-lspconfig
      ruff = {
        mason = false,
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
      basedpyright = {
        -- From: https://docs.basedpyright.com/latest/configuration/language-server-settings/
        settings = {
          basedpyright = {
            disableOrganizeImports = true,
            analysis = {
              -- ignore = { "*" }, --usually used to ignore specific files or folders, can be used for all
              typeCheckingMode = "standard", -- ["off", "basic", "standard", "strict", "recommended", "all"] - set this to "off" (or one of the other 4 levels of strictness) if you don't want it to type check, can also uncomment the above ignore = {"*"} line for only LSP feats
              diagnosticMode = "openFilesOnly", -- "openFilesOnly" or "workspace"
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
              autoSearchPaths = true,
            },
          },
        },
      },
      jinja_lsp = {
        filetypes = { "jinja" },
      },
    },

    -- a copy of LazyVim's setup function with one change (marked inline) to fix
    -- auto-fixing on neovim 0.11.
    setup = {
      eslint = function()
        local function get_client(buf)
          return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
        end

        local formatter = LazyVim.lsp.formatter({
          name = "eslint: lsp",
          primary = false,
          priority = 200,
          filter = "eslint",
        })

        -- Use EslintFixAll on Neovim < 0.10.0
        -- Changed from upstream: check the version explicitly instead of
        -- looking for `vim.lsp._require`. Seems like that check stopped working
        -- with Neovim 0.11.
        if vim.fn.has("nvim-0.10") == 0 then
          formatter.name = "eslint: EslintFixAll"
          formatter.sources = function(buf)
            local client = get_client(buf)
            return client and { "eslint" } or {}
          end
          formatter.format = function(buf)
            local client = get_client(buf)
            if client then
              local pull_diagnostics =
                vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id, false) })
              -- Older versions of the ESLint language server send push
              -- diagnostics rather than using pull. We support both for
              -- backwards compatibility.
              local push_diagnostics =
                vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id, true) })
              if (#pull_diagnostics + #push_diagnostics) > 0 then
                vim.cmd("EslintFixAll")
              end
            end
          end
        end

        -- register the formatter with LazyVim
        LazyVim.format.register(formatter)
      end,
    },
  },
}
