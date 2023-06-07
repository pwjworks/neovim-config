local dap = require("dap")

-- start/close dapui when debugging session initialized/terminated
dap.listeners.after.event_initialized["dapui_config"] = function()
	require("dapui").open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	require("dapui").close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	require("dapui").close({})
end

local dap_breakpoint_color = {
	breakpoint = {
		ctermbg = 0,
		fg = "white",
		bg = "#FC5185",
	},
	logpoing = {
		ctermbg = 0,
		fg = "white",
		bg = "#3FC1C9",
	},
	stopped = {
		ctermbg = 0,
		fg = "#252A34",
		bg = "#F5F5F5",
	},
}
dap.defaults.fallback.terminal_win_cmd = "enew | set filetype=dap-terminal"

vim.api.nvim_set_hl(0, "DapBreakpoint", dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, "DapLogPoint", dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, "DapStopped", dap_breakpoint_color.stopped)
local dap_breakpoint = {
	error = {
		-- text = "",
		text = "🔴",
		texthl = "DapBreakpoint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	condition = {
		text = "🟠",
		texthl = "DapBreakpoint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	rejected = {
		text = "⚪️",
		texthl = "DapBreakpint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	logpoint = {
		text = "🔔",
		texthl = "DapLogPoint",
		linehl = "DapLogPoint",
		numhl = "DapLogPoint",
	},
	stopped = {
		text = "✔️",
		texthl = "DapStopped",
		linehl = "DapStopped",
		numhl = "DapStopped",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
vim.fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-repl",
	callback = function()
		require("dap.ext.autocompl").attach()
	end,
})

-- cpp configurations
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = "/home/pwjworks/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}
dap.configurations.cpp = {
	{
		type = "codelldb",
		request = "launch",
		program = "${fileDirname}/../build/src/${fileBasenameNoExtension}",
		cwd = "${workspaceFolder}",
		terminal = "integrated",
	},
}
