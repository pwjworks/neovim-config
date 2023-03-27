local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    layout_config = {
      vertical = {
        preview_cutoff = 0.2,
        preview_height = 0.4,
      },
      height = 0.9,
      width = 0.9,
    },
    mappings = {
      i = {
      },
      n = {
      },
    },
  },
  extensions = {
    project = {
      base_dirs = {
        "~/Projects",
        "~/.config/nvim"
      },
    },
    undo = {
      use_delta = true,
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.4,
      },
    },
  },
}

return options
