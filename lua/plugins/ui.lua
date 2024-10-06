return {
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      {
        "rcarriga/nvim-notify",
        lazy = false,
      },
    },
    config = function()
      require("noice").setup {
        lsp = {
          signature = {
            enabled = false,
          },
        },
      }
    end,
  },
}
