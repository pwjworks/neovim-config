local map = vim.keymap.set

-- vim.g.mapleader = " "

-- unset highlight
map("n", "<Esc>", ":nohl<CR>")

-- local history
map("n", "<A-h>", ":LocalHistoryToggle<CR>")

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

map("n", "x", '"_x')
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<C-a>", "ggVG", { silent = true })

map("i", "<M-z>", "<ESC>", { silent = true })

map("n", "<leader>nh", ":nohl<CR>", { silent = true })

-- git
map("n", "<leader>rh", ":lua require 'gitsigns'.reset_hunk()<CR>")
map("n", "<leader>ph", ":lua require 'gitsigns'.preview_hunk()<CR>")
map("n", "<leader>gb", ":lua package.loaded.gitsigns.blame_line()<CR>")
map("n", "<leader>td", ":lua require 'gitsigns'.toggle_deleted()<CR>")

-- diagnostic
map("n", "<A-n>", vim.diagnostic.goto_next)
map("n", "<A-p>", vim.diagnostic.goto_prev)

-- overseer
map("n", "<F2>", ":OverseerRun<CR>")

-- cppassist
local opts = { noremap = true, silent = true }
-- switch between source and header
map('n', '<A-o>', '<Cmd>SwitchSourceAndHeader<CR>', opts)
-- generate the function definition or static variable definition in source
map('n', '<leader>hb', '<Cmd>ImplementInSource<CR>', opts)
-- generate the ation definition or static variable definition in source in visual mode
map('v', '<leader>hb', '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>', opts)
-- generate the function definition or static variable definition in header
map('n', '<leader>hv', '<Cmd>ImplementOutOfClass<CR>', opts)
-- goto the header file
map('n', '<leader>hh', '<Cmd>GotoHeaderFile<CR>', opts)
