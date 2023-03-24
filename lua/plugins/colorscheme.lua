return {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      term_colors = true,
      transparent_background = true,
      no_italic = false,
      no_bold = false,
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      }
    },
  },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark",   -- style for floating windows
      },
    }
  },
  -- oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon"
  },
  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      -- italic = {
      --   strings = true,
      --   operators = true,
      --   comments = true
      -- },
      strikethrough = false,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = false,
      overrides = {
        GruvboxRedSign = { bg = "none" },
        GruvboxGreenSign = { bg = "none" },
        GruvboxYellowSign = { bg = "none" },
        GruvboxBlueSign = { bg = "none" },
        GruvboxPurpleSign = { bg = "none" },
        GruvboxAquaSign = { bg = "none" },
        GruvboxOrangeSign = { bg = "none" }
      },
      contrast = "soft",
      dim_inactive = false,
      transparent_mode = false,
    },
  },

  -- dracula
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
