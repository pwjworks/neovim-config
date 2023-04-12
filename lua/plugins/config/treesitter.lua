local options = {
  ensure_installed = {
    "bash",
    "comment",
    "diff",
    "dockerfile",
    "dot",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "python",
    "regex",
    "vim",
    "yaml",
    "cpp",
  },
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}

return options
