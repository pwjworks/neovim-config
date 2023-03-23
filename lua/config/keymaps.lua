local map = vim.keymap.set

-- vim.g.mapleader = " "

-- unset highlight
map("n", "<Esc>", ":nohl<CR>")

-- local history
map("n", "<A-h>", ":LocalHistoryToggle<CR>")

-- escape the insert mode
map("i", "jj", "<Esc>")

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

-- tagbar
map("n", "<A-t>", ":Tagbar<CR>")

-- diagnostic
map("n", "<A-n>", vim.diagnostic.goto_next)
map("n", "<A-p>", vim.diagnostic.goto_prev)
