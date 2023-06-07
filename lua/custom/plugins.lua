local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/playground",
		},
		opts = overrides.treesitter,
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	-- better_escape
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	-- neoscroll
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>" },
				--
				hide_cursor = false, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
		end,
	},
	-- vim-tmux-navigator
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		opts = overrides.lspconfig,
	},
	-- surround
	{
		"kylechui/nvim-surround",
		lazy = false,
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- nvim scrollbar
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		config = function()
			require("scrollbar").setup({
				handle = {
					color = "#BDC0C2",
				},
			})
		end,
	},
	-- todo-comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:?]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
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
	-- noice
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					progress = {
						enabled = false,
					},
					hover = {
						enabled = false,
					},
					signature = {
						enabled = false,
					},
					message = {
						-- Messages shown by lsp servers
						enabled = true,
						view = "notify",
						opts = {},
					},
				},
			})
		end,
	},
	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	},
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
	-- indentscope
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
	},
	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>ax", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>aX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>aL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>aQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},
	-- symbols outline
	{
		"simrat39/symbols-outline.nvim",
		lazy = false,
		config = function()
			require("symbols-outline").setup()
		end,
	},
	-- telescope project
	{ "nvim-telescope/telescope-project.nvim" },

	-- leap
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	-- hop
	{
		"phaazon/hop.nvim",
		lazy = false,
		branch = "v2",
		config = function()
			require("hop").setup({})
		end,
	},
	-- dapui
	{
		"rcarriga/nvim-dap-ui",
		opts = require("custom.configs.dapui"),
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
			require("custom.configs.dap")
		end,
	},
	{
		"Kohirus/cppassist.nvim",
		event = "VeryLazy",
		config = function()
			require("cppassist").setup()
		end,
	},
	{
		"LukasPietzschmann/telescope-tabs",
		config = function()
			require("telescope-tabs").setup()
		end,
	},
	-- startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	-- rooter
	{
		"notjedi/nvim-rooter.lua",
		lazy = false,
		config = function()
			require("nvim-rooter").setup()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				lazy = false,
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						segments = {
							{
								text = { builtin.lnumfunc, " " },
								condition = { true, builtin.not_empty },
								click = "v:lua.ScLa",
							},
							{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
						},
					})
				end,
			},
		},
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			open_fold_hl_timeout = 400,
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					-- winhighlight = "Normal:Folded",
					winblend = 0,
				},
			},
		},
		config = function(_, opts)
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local totalLines = vim.api.nvim_buf_line_count(0)
				local foldedLines = endLnum - lnum
				local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
				suffix = (" "):rep(rAlignAppndx) .. suffix
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end
			opts["fold_virt_text_handler"] = handler
			require("ufo").setup(opts)
		end,
	},
	{
		"gen740/SmoothCursor.nvim",
		lazy = false,
		config = function()
			require("smoothcursor").setup({
				autostart = true,
				texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
				linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
				type = "default", -- define cursor movement calculate function, "default" or "exp" (exponential).
				fancy = {
					enable = true, -- enable fancy mode
					body = {
						{ cursor = "", texthl = "SmoothCursorRed" },
						{ cursor = "", texthl = "SmoothCursorOrange" },
						{ cursor = "●", texthl = "SmoothCursorYellow" },
						{ cursor = "●", texthl = "SmoothCursorGreen" },
						{ cursor = "•", texthl = "SmoothCursorAqua" },
						{ cursor = ".", texthl = "SmoothCursorBlue" },
						{ cursor = ".", texthl = "SmoothCursorPurple" },
					},
					tail = { cursor = nil, texthl = "SmoothCursor" },
				},
				flyin_effect = nil, -- "bottom" or "top"
				speed = 25, -- max is 100 to stick to your current position
				intervals = 35, -- tick interval
				priority = 10, -- set marker priority
				timeout = 3000, -- timout for animation
				threshold = 3, -- animate if threshold lines jump
				disable_float_win = false, -- disable on float window
				enabled_filetypes = nil, -- example: { "lua", "vim" }
				disabled_filetypes = nil, -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
			})
		end,
	},
	{
		"danymat/neogen",
		lazy = false,
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"utilyre/barbecue.nvim",
		lazy = false,
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{ "simrat39/rust-tools.nvim" },
}
return plugins
