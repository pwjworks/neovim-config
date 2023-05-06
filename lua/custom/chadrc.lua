---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  changed_themes = {
    catppuccin = {
      -- polish_hl = {
      --   ["@keyword"] = {
      --     fg = "#fca7ea",
      --     style = { "italic" },
      --   },
      -- }
    },
  },
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default",
    separator_style = "round",
  },
  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = { "alpha", "notify", "dap", "bufferline" }, -- these aren't compiled by default, ex: "alpha", "notify"
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored",       -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = true,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },
  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,
    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File",    "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word",    "Spc f w", "Telescope live_grep" },
      { "  Bookmarks",    "Spc b m", "Telescope marks" },
      { "  Themes",       "Spc t h", "Telescope themes" },
      { "  Mappings",     "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
