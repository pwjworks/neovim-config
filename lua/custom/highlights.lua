-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}
--- @type Base46HLGroupsList
M.override = {
	TbLineBufOff = {
		bg = "NONE",
	},
	TbBufLineBufOffModified = {
		bg = "NONE",
	},
	TbLineBufOffClose = {
		bg = "NONE",
	},
	TblineFill = {
		bg = "NONE",
	},
	FoldColumn = {
		fg = "NONE",
		bg = "NONE",
	},
}

---@type HLTable
M.add = {
	UfoCursorFoldedLine = {
		bg = "#342e4f",
	},
	NotifyBackground = {
		fg = "#C5CDD9",
		bg = "#22252A",
	},
}

return M
