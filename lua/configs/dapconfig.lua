local dap = require "dap"

-- C and C++ debugging
------------------------------------------------------------------------------------------
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
  detached = false,
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
------------------------------------------------------------------------------------------

-- Java debugging
------------------------------------------------------------------------------------------
dap.configurations.java = {
  {
    name = "Debug Launch (2GB)",
    type = "java",
    request = "launch",
    vmArgs = "" .. "-Xmx2G",
  },
  {
    name = "Debug Attach",
    type = "java",
    request = "attach",
    hostName = "localhost",
    port = 11903,
  },
}
------------------------------------------------------------------------------------------
