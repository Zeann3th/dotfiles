local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local nvlsp = require "nvchad.configs.lspconfig"

local capabilities = nvlsp.capabilities
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Languages
------------------------------------------------------------------------------------------

return {

  -- Automatic Lspconfig
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
    }
  end,

  -- Java
  ["jdtls"] = function()
    -- Do nothing because jdtls is configured by nvim-jdtls
  end,

  -- Lua
  ["lua_ls"] = function()
    require("nvchad.configs.lspconfig").defaults()
  end,

  -- =Go
  ["gopls"] = function()
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
  end,

  -- JS
  ["ts_ls"] = function()
    lspconfig.ts_ls.setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = os.getenv "LOCALAPPDATA"
              .. "/nvim-data/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue", "typescript", "javascript" },
          },
        },
        preferences = {
          completeUnimported = true,
          disableSuggestions = true,
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      },
      settings = {
        javascript = {
          format = {
            semicolons = "insert",
          },
        },
        typescript = {
          format = {
            semicolons = "insert",
          },
        },
      },
    }
  end,

  -- Vue
  ["volar"] = function()
    lspconfig.volar.setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      filetypes = { "vue" },
    }
  end,

  -- C, C++
  ["clangd"] = function()
    lspconfig.clangd.setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      cmd = { "clangd", "--enable-config", "--query-driver=C:/msys64/ucrt64/bin/g++.exe" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    }
  end,

  -- Emmet
  ["emmet_language_server"] = function()
    lspconfig.emmet_language_server.setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      filetypes = {
        "css",
        "html",
        "javascriptreact",
        "typescriptreact",
        "php",
        "vue",
      },
    }
  end,

  -- tailwindcss
  ["tailwindcss"] = function()
    lspconfig.tailwindcss.setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      filetypes = { "javascriptreact", "typescriptreact", "php", "vue" },
    }
  end,

  -- PHP
  ["intelephense"] = function()
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
  end,
}
