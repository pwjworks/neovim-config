-- highlight groups config
local hl_groups = {
  PmenuSel = { bg = "#AAAAFF", fg = "white" },
  Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE" },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE" },
  CmpItemMenu = { fg = "#C792EA", bold = true },
  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}
for group, color in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, group, color)
end

local options = {
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      side_padding = 0,
    },
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      side_padding = 0,
    }
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({
        mode = "symbol_text",
        maxwidth = 40,
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })

      kind.menu = ({
        buffer = "☄️",
        nvim_lsp = "👾",
        luasnip = "🌖",
        nvim_lua = "🌙",
        latex_symbols = "📚",
      })[entry.source.name]
      -- add return types for function suggestions.
      local item = entry:get_completion_item()
      if item.detail then
        kind.menu = "    " .. (strings[2] or "") .. (kind.menu or "") .. "✨" .. item.detail
      else
        kind.menu = "    " .. (strings[2] or "") .. (kind.menu or "")
      end

      kind.kind = " " .. (strings[1] or "") .. " "
      return kind
    end,
  }
}

return options
