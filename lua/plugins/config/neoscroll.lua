require("neoscroll").setup({
  -- mappings = { '<C-u>', '<C-d>' },
  --
  hide_cursor = false,         -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = nil,       -- Default easing function
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '200' } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '200' } }
require('neoscroll.config').set_mappings(t)
