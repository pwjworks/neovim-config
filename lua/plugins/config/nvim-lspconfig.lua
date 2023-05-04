local options = {
  diagnostics = {
    update_in_insert = true,
  },
  autoformat = true,
  format = {
    timeout_ms = 5000,
  },
  ---@type lspconfig.options
  servers = {
    clangd = {
      cmd = { "clangd",
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
        "-j=4",                 -- number of workers
        -- "--resource-dir="
        "--log=error",
        --[[ "--query-driver=/usr/bin/g++", ]]
      },
      init_options = {
        compilationDatabasePath = "./build",
      },
    }
  },
}
return options
