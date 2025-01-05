-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = { "html" }
local nvlsp = require "nvchad.configs.lspconfig"

local capabilities = nvlsp.capabilities
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }
end

-- =Go
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- JS
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    preferences = {
      completeUnimported = true,
      disableSuggestions = true,
    },
  },
}

-- C, C++
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "clangd", "--enable-config", "--query-driver=C:/msys64/ucrt64/bin/g++.exe" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- Emmet
lspconfig.emmet_language_server.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "php",
  },
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "blade", "php" },
}

-- PHP
lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "php" },
  settings = {
    intelephense = {
      format = {
        enable = true,
      },
    },
  },
}
