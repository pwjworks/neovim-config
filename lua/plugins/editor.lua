return {
  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return require "plugins.config.neo-tree"
    end
  },

  -- { "folke/noice.nvim", enabled = false },

  -- go nvim
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- dapui
  {
    "rcarriga/nvim-dap-ui",
    opts = function()
      return require("plugins.config.dap-ui")
    end
  },
  -- dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
    },
    config = function()
      -- cpp configuration
      require("plugins.debug-config.cpp")
      -- go configuration
      require("plugins.debug-config.go")
      -- icons configuration
      require("plugins.config.dap")
    end,
    keys = function()
      return require("plugins.keys.dap")
    end
  },

  -- toggle term
  {
    "akinsho/toggleterm.nvim",
    opts = function()
      return require("plugins.config.toggleterm")
    end
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2"
    },
    opts = function(_, opts)
      opts.ensure_installed = {
        "bash",
        "comment",
        "diff",
        "dockerfile",
        "dot",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "regex",
        "vim",
        "yaml",
        "cpp",
      }
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
        }
      }
    end
  },

  -- tagbar
  -- neet to install ctags: apt install universal-ctags
  {
    "preservim/tagbar",
  },

  -- history
  -- you need to install python3 and pip3 install pynvim
  -- If you see an error Not and editor command: LocalHistoryToggle you need to run :UpdateRemotePlugins
  {
    "dinhhuy258/vim-local-history",
    branch = "master"
  },
  -- customize telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-project.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
    opts = function()
      require("plugins.config.telescope")
    end,
    keys = function()
      require("plugins.keys.telescope")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("dap")
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("undo")
    end,
  },
  -- add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local options = require("plugins.config.nvim-cmp")
      local cmp = require("cmp")
      -- tab for confirm
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.window = options.window
      opts.formatting = options.formatting
      return opts
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  }
}
