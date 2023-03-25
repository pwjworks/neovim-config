return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        update_in_insert = true,
      },
      format = {
        timeout_ms = 5000,
      },
      ---@type lspconfig.options
      servers = {
        clangd = {
          cmd = { "clangd",
            "--all-scopes-completion",
            "--background-index",
            "--clang-tidy",
            "--fallback-style=google",
            "--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
            "--completion-parse=always",
            "--completion-style=bundled",
            "--cross-file-rename",
            "--debug-origin",
            "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
            "--folding-ranges",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
            "--pch-storage=memory", -- could also be disk
            "--suggest-missing-includes",
            "-j=4",                 -- number of workers
            -- "--resource-dir="
            "--log=error",
            --[[ "--query-driver=/usr/bin/g++", ]]
          },
          init_options = {
            compilationDatabasePath = "./build",
          },
        }
      },
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
        },
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = {
      automatic_installation = true,
    },
  },
  -- language specific extension modules
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.golang" },
  { import = "plugins.extras.lang.nodejs" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.cpp" },
}
