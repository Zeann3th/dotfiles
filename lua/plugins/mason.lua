return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup {
        ensure_installed = {
          "clangd",
          "jdtls",
          "gopls",
          "html-lsp",
          "emmet-language-server",
          "lua-language-server",
          "stylua",
          "tailwindcss-language-server",
          "typescript-language-server",
        },
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup { handlers = require "configs.lspconfig" }
    end,
  },
}
