--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["<C-s>"] = { "<cmd> w <CR><ESC>", "save", opts = { nowait = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.tmuxnav = {
  plugin = true,
  n = {
    ["<C-h>"] = {
      "<cmd> TmuxNavigateLeft<CR>",
      "tmux nav left",
    },
    ["<C-l>"] = {
      "<cmd> TmuxNavigateRight<CR>",
      "tmux nav right",
    },
    ["<C-j>"] = {
      "<cmd> TmuxNavigateDown<CR>",
      "tmux nav down",
    },
    ["<C-k>"] = {
      "<cmd> TmuxNavigateUp<CR>",
      "tmux nav up",
    },
  },
}
M.persistence = {
  n = {
    ["<leader>qs"] = {
      "<cmd>lua require('persistence').load({last=true})<cr>",
      "restore the session for the current directory",
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit<CR>", "open lazygit" },
  },
}

M.symboloutline = {
  n = {
    ["<leader>oo"] = { "<cmd> SymbolsOutline<CR>", "open symbol outline" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { ":lua require'telescope'.extensions.project.project{}<CR>", "find project" },
    ["<leader>ft"] = { "<cmd> TodoTelescope<CR>", "find todo" },
  },
}

return M
