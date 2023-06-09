return {
  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#D8EEEB", bg = "#58B5A8" })
      return require("plugins.config.neo-tree")
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
    config = function()
      require("toggleterm").setup(require("plugins.config.toggleterm"))
    end
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      "nvim-treesitter/playground"
    },
    opts = {
      ensure_installed = {
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
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
          hlgroups = {
            'TSRainbowOrange',
            'TSRainbowRed',
            'TSRainbowViolet',
            'TSRainbowYellow',
            'TSRainbowBlue',
            'TSRainbowGreen',
            'TSRainbowCyan'
          },
        }
      }
    end
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
      return require("plugins.config.telescope")
    end,
    keys = {
      {
        "<leader>fp",
        "<CMD>Telescope project display_type=full<CR>",
        desc = "Find project",
      },
      {
        "<leader>fm",
        "<CMD>Telescope harpoon marks<CR>",
        desc = "Find marks",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("dap")
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("undo")
      telescope.load_extension("harpoon")
    end,
  },
  -- add cmp-emoji
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },
    --@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local options = require("plugins.config.nvim-cmp")
      local cmp = require("cmp")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      -- tab for confirm
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.window = options.window
      opts.formatting = options.formatting
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.config.neoscroll")
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handle = {
          color = "#BDC0C2"
        },
      })
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "Kohirus/cppassist.nvim",
    event = "VeryLazy",
    config = function()
      require("cppassist").setup()
    end
  },
  {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    event = { "WinNew" },
    config = function()
      local picker = require("window-picker")
      picker.setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
            buftype = { "terminal" },
          },
        },
        other_win_hl_color = "#e35e4f",
      })

      vim.keymap.set("n", ",w", function()
        local picked_window_id = picker.pick_window({
          include_current_win = true,
        }) or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = "Pick a window" })

      -- Swap two windows using the awesome window picker
      local function swap_windows()
        local window = picker.pick_window({
          include_current_win = false,
        })
        local target_buffer = vim.fn.winbufnr(window)
        -- Set the target window to contain current buffer
        vim.api.nvim_win_set_buf(window, 0)
        -- Set current window to contain target buffer
        vim.api.nvim_win_set_buf(0, target_buffer)
      end

      vim.keymap.set("n", ",W", swap_windows, { desc = "Swap windows" })
    end,
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
  {
    "phaazon/hop.nvim",
    lazy = true,
    keys = { "E" },
    config = function()
      require("hop").setup({})
      -- vim.api.nvim_set_keymap("n", "R", "<cmd>HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "E", "<cmd>HopChar1<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "U", "<cmd>HopWord<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "C", "<cmd>HopLine<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "P", "<cmd>HopPattern<cr>", { silent = true })
    end,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = { useDefaultKeymaps = true },
  },
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>am",
        ":lua require('harpoon.mark').add_file()<CR>",
        desc = "Add marks",
      },
    }
  },
  {
    "echasnovski/mini.surround",
    enabled = false
  },
  {
    "echasnovski/mini.comment",
    enabled = false
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'folke/todo-comments.nvim',
    opts = {
      highlight = {
        multiline = true,                 -- enable multine todo comments
        multiline_pattern = "^.",         -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,           -- extra lines that will be re-evaluated when changing a line
        before = "",                      -- "fg" or "bg" or empty
        keyword = "wide",                 -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                     -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:?]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,             -- uses treesitter to match keywords in comments only
        max_line_len = 400,               -- ignore lines longer than this
        exclude = {},                     -- list of file types to exclude highlighting
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup()
    end
  },
  {
    'christoomey/vim-tmux-navigator'
  }
}
