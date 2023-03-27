local dap = require("dap")


dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/pwjworks/codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.cpp = {
  {
    type = 'codelldb',
    request = 'launch',
    program = '${fileDirname}/../build/linux/x86_64/debug/${fileBasenameNoExtension}',
    -- program = function()
    --   return '${fileDirname}/build/linux/x86_64/debug/${fileBasenameNoExtension}'
    -- end,
    cwd = '${workspaceFolder}',
    terminal = 'integrated'
  }
}
