local lsp_status = require('lsp-status')
lsp_status.config({
  show_filename = false,
  component_separator = ' | ',
  status_symbol = '',
  current_function = true,
  diagnostics = false,
  spinner_frames = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' }
})


lsp_status.register_progress()
local lspconfig = require('lspconfig')

-- Some arbitrary servers
lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
