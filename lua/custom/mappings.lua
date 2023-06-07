--@type MappingsTable
local M = {}

M.disabled = {
	i = {
		["<CR>"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>qq"] = { "<cmd>qa<CR>", "enter command mode", opts = { nowait = true } },
		["<leader>uf"] = { ":lua require('custom.configs.format').toggle()<CR>", "toggle autoformat" },
	},
	i = {
		["<C-s>"] = { "<cmd>w<CR><ESC>", "save", opts = { nowait = true } },
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
		["<leader>fn"] = { ":Telescope noice<CR>", "find notify" },
		["<leader>f;"] = { ":Telescope telescope-tabs list_tabs<CR>", "find tabs" },
	},
}

M.dap = {
	n = {
		["<leader>do"] = { "<cmd>:lua require'dap'.toggle_breakpoint()<CR>", "toggle breakpoint" },
		["<leader>dc"] = { "<cmd>:lua require'dap'.continue()<CR>", "continue" },
		["<leader>ds"] = { "<cmd>:lua require'dap'.step_over()<CR>", "step_over" },
		["<leader>di"] = { "<cmd>:lua require'dap'.step_into()<CR>", "step_into" },
		["<leader>du"] = { "<cmd>:lua require'dapui'.toggle()<CR>", "toggle ui" },
	},
}

M.notify = {
	n = {
		["<leader>cn"] = { "<cmd>:lua require'notify'.dismiss({true,true})<CR>" },
	},
}

M.cppassist = {
	n = {
		-- switch between source and header
		["<A-o>"] = { "<Cmd>SwitchSourceAndHeader<CR>", "switch between source and header" },
		-- generate the function definition or static variable definition in source
		["<leader>cpi"] = {
			"<Cmd>ImplementInSource<CR>",
			"generate the function definition or static variable definition in source",
		},
		-- generate the ation definition or static variable definition in source in visual mode
		["<leader>cpv"] = {
			"<Cmd>lua require('cppassist').ImplementInSourceInVisualMode<CR>",
			"generate the ation definition or static variable definition in source in visual mode",
		},
		-- generate the function definition or static variable definition in header
		["<leader>cpo"] = {
			"<Cmd>ImplementOutOfClass<CR>",
			"generate the function definition or static variable definition in header",
		},
		-- goto the header file
		["<leader>cph"] = { "<Cmd>GotoHeaderFile<CR>", "goto the header file" },
	},
}

M.split = {
	n = {
		["<leader>_"] = { ":split<CR>", "Open the file in an horizontal split screen." },
		["<leader>|"] = { ":vsplit<CR>", "Open the file in a vertical split screen." },
	},
}

M.history = {
	n = {
		["<leader>oh"] = { "<Cmd>LocalHistoryToggle<CR>", "LocalHistoryToggle" },
	},
}

M.neogen = {
	n = {
		["<leader>cpa"] = { "<Cmd>Neogen<CR>", "generate doc for cpp" },
	},
}

M.hop = {
	n = {
		["W"] = { "<Cmd>HopChar1<CR>", "hopchar1", opts = { nowait = true, silent = true } },
	},
}
return M
