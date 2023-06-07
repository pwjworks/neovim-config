local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"cpp",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",
		"rust-analyzer",
		"codelldb",
	},
}

-- git support in nvimtree
M.nvimtree = {
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = true,
	},
	renderer = {
		root_folder_label = true,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	git = {
		enable = true,
	},
}

M.lspconfig = {
	format = {
		timeout_ms = 5000,
	},
	---@type lspconfig.options
	servers = {
		clangd = {
			cmd = {
				"clangd",
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
				"-j=4", -- number of workers
				-- "--resource-dir="
				"--log=error",
				--[[ "--query-driver=/usr/bin/g++", ]]
			},
			init_options = {
				compilationDatabasePath = "./build",
			},
		},
	},
}
local cmp = require("cmp")
M.cmp = {
	mapping = {
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

return M
