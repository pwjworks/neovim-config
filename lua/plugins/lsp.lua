return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function()
      require("plugins.config.nvim-lspconfig")
    end
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
  -- overseer for launching tasks
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        templates = { "user.xmake" },
        strategy = {
          "toggleterm",
          -- load your default shell before starting the task
          use_shell = true,
          -- overwrite the default toggleterm "direction" parameter
          direction = "float",
          -- overwrite the default toggleterm "highlights" parameter
          highlights = nil,
          -- overwrite the default toggleterm "auto_scroll" parameter
          auto_scroll = nil,
          -- have the toggleterm window close automatically after the task exits
          close_on_exit = false,
          -- open the toggleterm window when a task starts
          open_on_start = true,
          -- mirrors the toggleterm "hidden" parameter, and keeps the task from
          -- being rendered in the toggleable window
          hidden = false,
        }
      })
    end
  },
  -- language specific extension modules
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.golang" },
  { import = "plugins.extras.lang.nodejs" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.cpp" },
}
